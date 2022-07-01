import 'package:syara_finder/Features/Authentication/data/remote/data_sources/AuthApiService.dart';
import 'package:syara_finder/Features/Authentication/domain/entities/UserEntity.dart';

import '../../domain/repositories/AuthApiServiceRepository.dart';

class AuthApiServiceRepositoryImple extends AuthApiServiceRepository{
  AuthApiService authApiService;
  AuthApiServiceRepositoryImple(this.authApiService);

  @override
  Future<UserEntity> register({required String email,required String password,required String username}) async {
    return await authApiService.register(username: username, password: password,email: email);
  }

  @override
  Future<UserEntity> login({required String email, required String password}) async{
    // TODO: implement login
    return await authApiService.login(username: email, password: password);
  }

}