import 'package:dio/dio.dart';
import 'package:flutter_interview/data/users_model.dart';

class HomeRepositoryImpl {
  Future<UsersModel> getUsers(String query) async {
    final call = await Dio().get('https://api.github.com/search/users',
        queryParameters: {"q": query});
    final response = UsersModel.fromJson(call.data);

    return response;
  }
}
