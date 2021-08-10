// To parse this JSON data, do
//
//     final chemistLoginModel = chemistLoginModelFromJson(jsonString);

import 'dart:convert';

ChemistLoginModel chemistLoginModelFromJson(String str) =>
    ChemistLoginModel.fromJson(json.decode(str));

String chemistLoginModelToJson(ChemistLoginModel data) =>
    json.encode(data.toJson());

class ChemistLoginModel {
  ChemistLoginModel({
    this.message,
    this.token,
    this.data,
    this.code,
  });

  final String message;
  final String token;
  final ChemistLoginData data;
  final int code;

  factory ChemistLoginModel.fromJson(Map<String, dynamic> json) =>
      ChemistLoginModel(
        message: json["message"],
        token: json["token"],
        data: ChemistLoginData.fromJson(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "data": data.toJson(),
        "code": code,
      };
}

class ChemistLoginData {
  ChemistLoginData({
    this.id,
    this.name,
    this.userName,
    this.phone,
    this.email,
    this.gender,
    this.dob,
    this.height,
    this.weight,
    this.disability,
    this.loginType,
    this.deletedAt,
    this.status,
    this.profilePic,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  final int id;
  final String name;
  final String userName;
  final String phone;
  final String email;
  final String gender;
  final String dob;
  final String height;
  final String weight;
  final String disability;
  final String loginType;
  final dynamic deletedAt;
  final String status;
  final dynamic profilePic;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic address;

  ChemistLoginData copyWith({
    final String name,
    final String userName,
    final String phone,
    final String email,
    final String gender,
    final String dob,
    final String height,
    final String weight,
    final String disability,
    final String status,
    final dynamic profilePic,
    final dynamic address,
  }) {
    return ChemistLoginData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      disability: disability ?? this.disability,
      status: status ?? this.status,
      profilePic: profilePic ?? this.profilePic,
      address: address ?? this.address,
    );
  }

  factory ChemistLoginData.fromJson(Map<String, dynamic> json) =>
      ChemistLoginData(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        phone: json["phone"],
        email: json["email"],
        gender: json["gender"],
        dob: json["dob"],
        height: json["height"],
        weight: json["weight"],
        disability: json["disability"],
        loginType: json["login_type"],
        deletedAt: json["deleted_at"],
        status: json["status"],
        profilePic: json["profile_pic"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "phone": phone,
        "email": email,
        "gender": gender,
        "dob": dob,
        "height": height,
        "weight": weight,
        "disability": disability,
        "login_type": loginType,
        "deleted_at": deletedAt,
        "status": status,
        "profile_pic": profilePic,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "address": address,
      };
}
