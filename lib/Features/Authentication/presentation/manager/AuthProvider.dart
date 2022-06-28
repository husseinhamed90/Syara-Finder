
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syara_finder/Features/Authentication/data/remote/data_sources/FirebaseService.dart';
import 'package:syara_finder/Features/Authentication/domain/repositories/AuthRepository.dart';
import 'package:syara_finder/Features/Home/presentation/manager/HomeProvider.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository repository;
  final HomeProvider homeProvider;
  AuthProvider(this.repository,this.homeProvider);
  User? userCredential;

  Future signInWithFacebookAccount(Function onEndFunction)async {
    await FirebaseService.signInWithFacebook().then((value){
      userCredential=value!.user;
      onEndFunction();
      notifyListeners();
    });
  }

  Future getLoggedInUser()async{
    userCredential = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
  Future logOutFromAccount()async{
    userCredential=null;
    homeProvider.returnNavBarToHome();
    await repository.signOutFromAccount();
  }
  Future signInWithGoogleAccount(Function onEndFunction)async {
    repository.signInWithGoogleAccount().then((value) {
      userCredential=value.user;
      onEndFunction();
      notifyListeners();
    });
  }
  Future signInWithNormalAccount({required String email , required String password})async{
    return await repository.signInWithNormalAccount(email: email, password: password).then((value){
      userCredential=value.user;
        notifyListeners();
    });
  }
  Future createNormalAccount({required String email , required String password})async{
     await repository.createNormalAccount(email: email, password: password).then((value){
       userCredential=value.user;
      notifyListeners();
    });
  }
}