// To parse this JSON data, do
//
//     final userDetail = userDetailFromJson(jsonString);

import 'dart:convert';

List<UserDetail> userDetailFromJson(String str) => List<UserDetail>.from(json.decode(str).map((x) => UserDetail.fromJson(x)));

String userDetailToJson(List<UserDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetail {
    UserDetail({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.tanggalLahir,
        required this.bioSingkat,
    });

    DateTime tanggalLahir;
    String bioSingkat;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        bioSingkat: json["bio_singkat"],
    );

    Map<String, dynamic> toJson() => {
        "tanggal_lahir": "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "bio_singkat": bioSingkat,
    };
}
