// To parse this JSON data, do
//
//     final postMenuResponse = postMenuResponseFromJson(jsonString);

import 'dart:convert';

PostMenuResponse postMenuResponseFromJson(String str) => PostMenuResponse.fromJson(json.decode(str));

String postMenuResponseToJson(PostMenuResponse data) => json.encode(data.toJson());

class PostMenuResponse {
    String message;
    Menu menu;

    PostMenuResponse({
        required this.message,
        required this.menu,
    });

    factory PostMenuResponse.fromJson(Map<String, dynamic> json) => PostMenuResponse(
        message: json["message"],
        menu: Menu.fromJson(json["menu"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "menu": menu.toJson(),
    };
}

class Menu {
    String nama;
    String harga;
    String kategori;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Menu({
        required this.nama,
        required this.harga,
        required this.kategori,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        nama: json["nama"],
        harga: json["harga"],
        kategori: json["kategori"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "kategori": kategori,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
