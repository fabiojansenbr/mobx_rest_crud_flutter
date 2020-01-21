// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

List<CompanyModel> companyModelFromJson(String str) => List<CompanyModel>.from(
    json.decode(str).map((x) => CompanyModel.fromJson(x)));

String companyModelToJson(List<CompanyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyModel {
  String id;
  String name;
  String email;
  DateTime createdAt;
  int v;

  CompanyModel({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.v,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
