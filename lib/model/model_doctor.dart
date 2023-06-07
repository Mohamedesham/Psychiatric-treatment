class DoctorModel {
  final String name;
  final String email;
  final String ID;
  String image;


  DoctorModel(
      {required this.name,
        required this.email,
        required this.ID,
        required this.image,
      });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
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
