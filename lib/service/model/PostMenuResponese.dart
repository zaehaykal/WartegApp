
import 'dart:convert';

PostMenuResponse postMenuResponseFromJson(String str) => PostMenuResponse.fromJson(json.decode(str));

String postMenuResponseToJson(PostMenuResponse data) => json.encode(data.toJson());

class PostMenuResponse {
    String message;
    Data data;

    PostMenuResponse({
        required this.message,
        required this.data,
    });

    factory PostMenuResponse.fromJson(Map<String, dynamic> json) => PostMenuResponse(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String nama;
    String harga;
    String kategori;
    String foto;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    Data({
        required this.nama,
        required this.harga,
        required this.kategori,
        required this.foto,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        harga: json["harga"],
        kategori: json["kategori"],
        foto: json["foto"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "kategori": kategori,
        "foto": foto,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
