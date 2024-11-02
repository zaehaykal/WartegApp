// // To parse this JSON data, do
// //
// //     final userResponse = userResponseFromJson(jsonString);

// import 'dart:convert';

// UserResponse userResponseFromJson(String str) =>
//     UserResponse.fromJson(json.decode(str));

// String userResponseToJson(UserResponse data) => json.encode(data.toJson());

// class UserResponse {
//   String message;
//   List<DataUser> data;

//   UserResponse({
//     required this.message,
//     required this.data,
//   });

//   factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
//         message: json["message"],
//         data: List<DataUser>.from(json["data"].map((x) => DataUser.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class DataUser {
//   int id;
//   String? role;
//   String name;
//   String? nomorhp;
//   String email;
//   dynamic emailVerifiedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String? alamat;
//   String? jenkel;

//   DataUser({
//     required this.id,
//     required this.role,
//     required this.name,
//     required this.nomorhp,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.alamat,
//     required this.jenkel,
//   });

//   factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
//         id: json["id"],
//         role: json["role"],
//         name: json["name"],
//         nomorhp: json["nomorhp"],
//         email: json["email"],
//         emailVerifiedAt: json["email_verified_at"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         alamat: json["alamat"],
//         jenkel: json["jenkel"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "role": role,
//         "name": name,
//         "nomorhp": nomorhp,
//         "email": email,
//         "email_verified_at": emailVerifiedAt,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "alamat": alamat,
//         "jenkel": jenkel,
//       };
// }
