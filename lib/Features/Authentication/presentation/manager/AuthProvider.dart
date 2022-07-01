
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syara_finder/Features/Authentication/data/local/data_sources/SharedPrefSource.dart';
import 'package:syara_finder/Features/Authentication/data/remote/data_sources/AuthApiService.dart';
import 'package:syara_finder/Features/Authentication/data/remote/data_sources/FirebaseService.dart';
import 'package:syara_finder/Features/Authentication/domain/entities/UserEntity.dart';
import 'package:syara_finder/Features/Authentication/domain/repositories/AuthApiServiceRepository.dart';
import 'package:syara_finder/Features/Authentication/domain/repositories/AuthRepository.dart';
import 'package:syara_finder/injection_container.dart';

import '../../data/models/UserModel.dart';

class AuthProvider with ChangeNotifier {

  bool isLoading =false;

  //ValueNotifier<bool> isLoading =ValueNotifier<bool>(false);
  void isLoadingState(bool newState){
     isLoading =newState;
     notifyListeners();
  }
  Future signInWithFacebookAccount(Function onEndFunction)async {
    await FirebaseService.signInWithFacebook().then((value) async {
      userEntity =UserEntity(
          email: value!.additionalUserInfo!.profile!["email"],
          username: value.additionalUserInfo!.profile!["name"],
          firstName: value.additionalUserInfo!.profile!["first_name"],
          lastName:  value.additionalUserInfo!.profile!["last_name"],
          providerName: value.additionalUserInfo!.providerId
      );
      await dependencyInjection.get<SharedPrefSource>().setDataToShared("UserProfile", json.encode(userEntity!.toJson()));
      onEndFunction();
      notifyListeners();
    }).onError((error, stackTrace) {

    });
  }


  bool isLoggedUserExist(){
    if(userEntity!=null){
      return true;
    }
    else {
      return false;
    }
  }

  Future getLoggedInUser()async{
    bool isKeyExist =await dependencyInjection.get<SharedPrefSource>().isKeyExist("UserProfile");
    if(isKeyExist){
      String? userProfile = await dependencyInjection.get<SharedPrefSource>().getDataFromShared("UserProfile");
      Map<String,dynamic> userProfileMap = json.decode(userProfile!);
      userEntity=UserModel.fromJson(userProfileMap);
      userEntity!.providerName=userProfileMap["providerName"];
    }
    notifyListeners();
  }
  Future logOutFromAccount()async{
    userEntity=null;
    await dependencyInjection.get<AuthRepository>().signOutFromAccount();
    await dependencyInjection.get<SharedPrefSource>().removeKey("UserProfile");
  }
  Future signInWithGoogleAccount(Function onEndFunction)async {
    dependencyInjection.get<AuthRepository>().signInWithGoogleAccount().then((value) async {
      userEntity =UserEntity(
          email: value.user!.email,
          username: value.user!.displayName,
          providerName: value.additionalUserInfo!.providerId
      );
      await dependencyInjection.get<SharedPrefSource>().setDataToShared("UserProfile",json.encode(userEntity!.toJson()));
      onEndFunction();
      notifyListeners();
    });
  }
  UserEntity ?userEntity;
  Future signInWithNormalAccount({required String email , required String password})async{
    userEntity= await dependencyInjection.get<AuthApiServiceRepository>().login(email: email,password: password);

   // profile=userEntity!.toJson();
    return userEntity;
    // return await dependencyInjection.get<AuthRepository>().signInWithNormalAccount(email: email, password: password).then((value){
    //   userCredential=value.user;
    //   additionalUserInfo=value.additionalUserInfo;
    //   profile=value.additionalUserInfo!.profile;
    //   notifyListeners();
    // });
  }
  Future createNormalAccount({required String email,required String password,required String username})async{
    //  await dependencyInjection.get<AuthRepository>().createNormalAccount(email: email, password: password).then((value){
    //    userCredential=value.user;
    //    additionalUserInfo=value.additionalUserInfo;
    //   notifyListeners();
    // });
    userEntity= await dependencyInjection.get<AuthApiServiceRepository>().register(email: email,password: password, username: username,);
  //  profile=userEntity!.toJson();
    return userEntity;
  }
}