import 'dart:convert';

import 'package:exam/models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future getUsers() async {
    return await http
        .get(Uri.parse(
            'https://mocki.io/v1/386e9265-e20d-4aec-ac9c-ed6fc401d48c'))
        .then(
      (res) {
        return userModelFromJson(res.body);
      },
    );
  }

  List<UserModel> userModelFromJson(String str) =>
      List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
}
