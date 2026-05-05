import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab11_fyp/model/user_model.dart';
import 'package:lab11_fyp/api/api_constants.dart';
class ApiService {
  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint),
      );

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}