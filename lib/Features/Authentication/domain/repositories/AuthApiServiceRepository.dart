import 'package:syara_finder/Features/Authentication/domain/entities/UserEntity.dart';

abstract class AuthApiServiceRepository{
  Future<UserEntity> login({required String email , required String password});
  Future<UserEntity> register({required String username,required String password,required String email});
}