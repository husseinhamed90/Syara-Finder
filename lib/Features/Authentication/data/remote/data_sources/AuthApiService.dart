import 'package:syara_finder/Features/Authentication/data/models/UserModel.dart';
import 'package:syara_finder/Features/Authentication/domain/entities/UserEntity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../Core/Constants.dart';
import '../../../../../injection_container.dart';
import '../../local/data_sources/SharedPrefSource.dart';
class AuthApiService{

    Future<UserEntity> login({required String username,required String password}) async {
      final response = await http.post(Uri.parse("$BASE_URL_FOR_AUTH/login/"),body: json.encode(<String, String>{
        "username":username,
        "password" :password
      }),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
    );
    if (response.statusCode == 201) {
      final result = json.decode(response.body);
      dependencyInjection.get<SharedPrefSource>().setDataToShared("UserProfile",response.body);
      return UserModel.fromJson(result);
    } else {
      throw Exception('Failed to login');
    }
  }

    Future<UserEntity>register({required String email,required String password,required String username})async{
    final response = await http.post(Uri.parse("$BASE_URL_FOR_AUTH/register/"),body: json.encode(<String, String>{
      "username":username,
      "email":email,
      "first_name":"",
      "last_name":"",
      "password" :password
    }),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      dependencyInjection.get<SharedPrefSource>().setDataToShared("UserProfile",response.body);
      return UserModel.fromJson(result);
    } else {
      throw Exception('Failed to register');
    }
  }
}