import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.imageUrl,
  });

  String? id;
  String? name;
  String? imageUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
      };
}
