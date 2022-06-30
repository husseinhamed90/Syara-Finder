
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:syara_finder/Features/Authentication/data/local/data_sources/SharedPrefSource.dart';
import 'package:syara_finder/Features/Authentication/data/remote/data_sources/FirebaseService.dart';
import 'package:syara_finder/Features/Authentication/domain/repositories/AuthRepository.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';
import 'package:syara_finder/injection_container.dart';

class AuthProvider with ChangeNotifier {
  User? userCredential;
  AdditionalUserInfo ?additionalUserInfo;
  Map<String,dynamic>?profile;
  Future signInWithFacebookAccount(Function onEndFunction)async {
    await FirebaseService.signInWithFacebook().then((value) async {

      additionalUserInfo=value!.additionalUserInfo;
      String encodedMap = json.encode(additionalUserInfo!.profile);
      await dependencyInjection.get<SharedPrefSource>().setDataToShared("UserProfile", encodedMap);
      profile=additionalUserInfo!.profile;
      onEndFunction();
      notifyListeners();
    }).onError((error, stackTrace) {

    });
  }

  Future getLoggedInUser()async{
    userCredential = FirebaseAuth.instance.currentUser;
    bool isKeyExist =await dependencyInjection.get<SharedPrefSource>().isKeyExist("UserProfile");
    if(isKeyExist){
      String? encodedMap = await dependencyInjection.get<SharedPrefSource>().getDataFromShared("UserProfile");
      Map<String,dynamic> decodedMap = json.decode(encodedMap!);
      profile=decodedMap;
    }
    notifyListeners();
  }
  Future logOutFromAccount()async{
    userCredential=null;
    profile=null;
    additionalUserInfo=null;
    await dependencyInjection.get<AuthRepository>().signOutFromAccount();
    await dependencyInjection.get<SharedPrefSource>().removeKey("UserProfile");
  }
  Future signInWithGoogleAccount(Function onEndFunction)async {
    dependencyInjection.get<AuthRepository>().signInWithGoogleAccount().then((value) {
      userCredential=value.user;
      onEndFunction();
      notifyListeners();
    });
  }
  Future signInWithNormalAccount({required String email , required String password})async{
    return await dependencyInjection.get<AuthRepository>().signInWithNormalAccount(email: email, password: password).then((value){
      userCredential=value.user;
        notifyListeners();
    });
  }
  Future createNormalAccount({required String email , required String password})async{
     await dependencyInjection.get<AuthRepository>().createNormalAccount(email: email, password: password).then((value){
       userCredential=value.user;
      notifyListeners();
    });
  }
}