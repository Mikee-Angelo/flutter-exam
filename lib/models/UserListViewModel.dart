import 'dart:convert';

import 'package:exam/models/UserModel.dart';
import 'package:exam/services/UserService.dart';
import 'package:flutter/foundation.dart';

class UserListViewModel {
  final _users = UserService();

  Future<List<UserModel>> fetchUsers() async {
    List<UserModel> users = await _users.getUsers();
    Map<String?, UserModel> list = {};

    //Format to map to override duplicate values
    for (var user in users) {
      list[user.id.toString()] = user;
    }

    return list.values.toList();
  }
}
