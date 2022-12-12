// To parse this JSON data, do
//
//     final donasiModerasi = donasiModerasiFromJson(jsonString);

import 'dart:convert';

DonasiModerasi donasiModerasiFromJson(String str) =>
    DonasiModerasi.fromJson(json.decode(str));

String donasiModerasiToJson(DonasiModerasi data) => json.encode(data.toJson());

class DonasiModerasi {
  DonasiModerasi({
    required this.data,
  });

  List<Datum> data;

  factory DonasiModerasi.fromJson(Map<String, dynamic> json) => DonasiModerasi(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    required this.deskripsi,
    this.isApproved,
    required this.nama,
    required this.penggalang,
    required this.target,
    required this.tipe,
    required this.urlFoto,
  });

  String deskripsi;
  dynamic isApproved;
  String nama;
  String penggalang;
  int target;
  String tipe;
  String urlFoto;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        deskripsi: json["deskripsi"],
        isApproved: json["is_approved"],
        nama: json["nama"],
        penggalang: json["penggalang"],
        target: json["target"],
        tipe: json["tipe"],
        urlFoto: json["urlFoto"],
      );

  Map<String, dynamic> toJson() => {
        "deskripsi": deskripsi,
        "is_approved": isApproved,
        "nama": nama,
        "penggalang": penggalang,
        "target": target,
        "tipe": tipe,
        "urlFoto": urlFoto,
      };
}
