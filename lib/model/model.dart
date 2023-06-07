class PatientModel {
  final String name;
  final String email;
  final String ID;
  String image;


  PatientModel(
      {required this.name,
        required this.email,
        required this.ID,
        required this.image,
        });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name'],
      email: json['email'],
      image: json['image'],
      ID: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': ID,
      'image': image,
    };
  }

}
