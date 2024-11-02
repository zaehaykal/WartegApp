// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    String message;
    String token;
    DataUserLogin dataUserLogin;

    UserResponse({
        required this.message,
        required this.token,
        required this.dataUserLogin,
    });

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        message: json["message"],
        token: json["token"],
        dataUserLogin: DataUserLogin.fromJson(json["dataUserLogin"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "dataUserLogin": dataUserLogin.toJson(),
    };
}

class DataUserLogin {
    int id;
    String role;
    String name;
    String nomorhp;
    String foto;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    String alamat;
    String jenkel;

    DataUserLogin({
        required this.id,
        required this.role,
        required this.name,
        required this.nomorhp,
        required this.foto,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.alamat,
        required this.jenkel,
    });

    factory DataUserLogin.fromJson(Map<String, dynamic> json) => DataUserLogin(
        id: json["id"],
        role: json["role"],
        name: json["name"],
        nomorhp: json["nomorhp"],
        foto: json["foto"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        alamat: json["alamat"],
        jenkel: json["jenkel"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "name": name,
        "nomorhp": nomorhp,
        "foto": foto,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "alamat": alamat,
        "jenkel": jenkel,
    };
}
