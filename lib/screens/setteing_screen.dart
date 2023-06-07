import 'package:final_graduation_project/auth/auth_provider.dart';
import 'package:final_graduation_project/provider/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SetteingScreen extends StatelessWidget {
  const SetteingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<AuthProvider>(context);

    var profileimage = Provider.of<PhotoProvider>(context).imagefile;

    return  Consumer<AuthProvider>(builder: (context,value,child){
      value.getpatient();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          leading: BackButton(),
          title: Text("Setteings",style: TextStyle(fontSize:23,color: Colors.amber),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.bottomRight,children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () => VoidCallbackAction(),
                        child: Ink.image(
                            height: 150,
                            width: 150,
                            fit: BoxFit.fill,
                            image: userprovider.user.image == null
                                ? FileImage(profileimage!) as ImageProvider
                                : NetworkImage(userprovider.user.image))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 25,
                        title: Text('Edit photo'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<PhotoProvider>(context,
                                  listen: false)
                                  .getimage(ImageSource.camera);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "From Camera",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            style: ButtonStyle(
                                fixedSize:
                                MaterialStatePropertyAll(Size(200, 30)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20))),
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<PhotoProvider>(context,
                                  listen: false)
                                  .getimage(ImageSource.gallery);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "From Gallery",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            style: ButtonStyle(
                                fixedSize:
                                MaterialStatePropertyAll(Size(200, 30)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20))),
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                          ),
                        ],
                        shape: RoundedRectangleBorder(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20,
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),

              ],)
            ],
          ),
        ),
      );
    }
    );
  }
}
