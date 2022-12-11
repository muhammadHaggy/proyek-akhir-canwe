// To parse this JSON data, do
//
//     final notifikasi = notifikasiFromJson(jsonString);
import 'dart:convert';

List<Notifikasi> notifikasiFromJson(String str) => List<Notifikasi>.from(
    json.decode(str).map((x) => Notifikasi.fromJson(x)));

String notifikasiToJson(List<Notifikasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notifikasi{
  Notifikasi({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Notifikasi.fromJson(Map<String, dynamic> json) => Notifikasi(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
  
}

class Fields {
  Fields({
    // required this.user,
    required this.title,
    required this.description,
  });

  // int user;
  String title;
  String description;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        // user: json["user"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        // "user": 2,
        "title": title,
        "description": description,
      };
}