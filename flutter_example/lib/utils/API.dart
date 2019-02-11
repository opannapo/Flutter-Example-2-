import 'dart:convert';

import 'package:flutter_example/entities/UserEntity.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.myjson.com/bins";

class API {
  static Future<UserEntity> getUser() async {
    final response = await http.get(baseUrl + '/uv2f4');
    print(response.body);
    if (response.statusCode == 200) {
      try {
        return UserEntity.fromJson(json.decode(response.body));
      } catch (e) {
        throw 'Failed to load profile [Parsing Data]';
      }
    } else {
      throw 'Failed to load profile [Urls]';
    }
  }

  static Future<List<UserEntity>> getUsers() async {
    final response = await http.get(baseUrl + '/ihgr4');
    print(response.body);
    if (response.statusCode == 200) {
      try {
        var items = (json.decode(response.body)['data']['items'] as List);
        List<UserEntity> products =
            items.map((data) => new UserEntity.fromJson(data)).toList();
        return products;
      } catch (e) {
        throw 'Failed to load loved product [Parsing]';
      }
    } else {
      throw 'Failed to load loved product [URLs]';
    }
  }
}
