// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.status,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.tanggalLahir,
    required this.bioSingkat,
  });

  bool status;
  String username;
  String firstName;
  String lastName;
  String email;
  DateTime tanggalLahir;
  String bioSingkat;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        status: json["status"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        bioSingkat: json["bio_singkat"],
      );

  Map<String, dynamic> toJson() => {
        "status": status.toString(),
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "bio_singkat": bioSingkat,
      };
}
