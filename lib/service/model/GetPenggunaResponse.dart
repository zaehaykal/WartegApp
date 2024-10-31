// To parse this JSON data, do
//
//     final getPenggunaResponse = getPenggunaResponseFromJson(jsonString);

import 'dart:convert';

GetPenggunaResponse getPenggunaResponseFromJson(String str) => GetPenggunaResponse.fromJson(json.decode(str));

String getPenggunaResponseToJson(GetPenggunaResponse data) => json.encode(data.toJson());

class GetPenggunaResponse {
    String message;
    List<DataPengguna> data;

    GetPenggunaResponse({
        required this.message,
        required this.data,
    });

    factory GetPenggunaResponse.fromJson(Map<String, dynamic> json) => GetPenggunaResponse(
        message: json["message"],
        data: List<DataPengguna>.from(json["data"].map((x) => DataPengguna.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataPengguna {
    int id;
    String nama;
    String nohp;
    String alamat;
    String foto;
    String? email;
    String password;
    DateTime createdAt;
    DateTime updatedAt;

    DataPengguna({
        required this.id,
        required this.nama,
        required this.nohp,
        required this.alamat,
        required this.foto,
        required this.email,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
    });

    factory DataPengguna.fromJson(Map<String, dynamic> json) => DataPengguna(
        id: json["id"],
        nama: json["nama"],
        nohp: json["nohp"],
        alamat: json["alamat"],
        foto: json["foto"],
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nohp": nohp,
        "alamat": alamat,
        "foto": foto,
        "email": email,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
