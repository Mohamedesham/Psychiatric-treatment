import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  String userID = Random().nextInt(10000).toString();
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  bool isModelRunning = false;

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    cameraController?.dispose();
    super.dispose();
  }

  loadCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await cameraController?.initialize();
    if (!mounted) return;
    setState(() {
      cameraController?.startImageStream((imageStream) {
        cameraImage = imageStream;
        runModel();
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  runModel() async {
    if (cameraImage != null && !isModelRunning) {
      setState(() {
        isModelRunning = true;
      });
      var predictions = await Tflite.runModelOnFrame(
        bytesList: cameraImage!.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage!.height,
        imageWidth: cameraImage!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.1,
        asynch: true,
      );
      predictions!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
      setState(() {
        isModelRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ZegoUIKitPrebuiltCall(
          appID: 2060782974,
          appSign: "yourAppSign",
          callID: widget.callID,
          userID: userID,
          userName: 'user_$userID',
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: cameraController?.value.isInitialized ?? false
                        ? AspectRatio(
                      aspectRatio: cameraController!.value.aspectRatio,
                      child: CameraPreview(cameraController!),
                    )
                        : Container(),
                  ),
                ),
                Text(
                  "Emotion is $output",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
