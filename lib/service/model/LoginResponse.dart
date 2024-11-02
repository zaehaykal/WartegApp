import 'dart:convert';

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String message;
  String token;
  UserDataResponse userData;

  LoginResponse({
    required this.message,
    required this.token,
    required this.userData,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        token: json["token"],
        userData: UserDataResponse.fromJson(
            json["data"]["data"]), // Ambil data dari json["data"]["data"]
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "data": {
          "data": userData.toJson(), // Sesuaikan kembali ke struktur asli
        },
      };
}

class UserDataResponse {
  int id;
  String nama;
  String nohp;
  String alamat;
  String foto;
  String email;

  UserDataResponse({
    required this.id,
    required this.nama,
    required this.nohp,
    required this.alamat,
    required this.foto,
    required this.email,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      UserDataResponse(
        id: json["id"],
        nama: json["nama"],
        nohp: json["nohp"],
        alamat: json["alamat"],
        foto: json["foto"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nohp": nohp,
        "alamat": alamat,
        "foto": foto,
        "email": email,
      };
}
