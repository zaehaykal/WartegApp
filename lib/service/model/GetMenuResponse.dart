// To parse this JSON data, do
//
//     final getMenuResponse = getMenuResponseFromJson(jsonString);

import 'dart:convert';

GetMenuResponse getMenuResponseFromJson(String str) => GetMenuResponse.fromJson(json.decode(str));

String getMenuResponseToJson(GetMenuResponse data) => json.encode(data.toJson());

class GetMenuResponse {
    String message;
    List<DataMenu> data;

    GetMenuResponse({
        required this.message,
        required this.data,
    });

    factory GetMenuResponse.fromJson(Map<String, dynamic> json) => GetMenuResponse(
        message: json["message"],
        data: List<DataMenu>.from(json["data"].map((x) => DataMenu.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataMenu {
    int id;
    String nama;
    String harga;
    String kategori;
    DateTime createdAt;
    DateTime updatedAt;
    String foto;

    DataMenu({
        required this.id,
        required this.nama,
        required this.harga,
        required this.kategori,
        required this.createdAt,
        required this.updatedAt,
        required this.foto,
    });

    factory DataMenu.fromJson(Map<String, dynamic> json) => DataMenu(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        kategori: json["kategori"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "kategori": kategori,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "foto": foto,
    };
}
