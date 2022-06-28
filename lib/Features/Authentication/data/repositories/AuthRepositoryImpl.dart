import 'package:firebase_auth/firebase_auth.dart';
import 'package:syara_finder/Features/Authentication/data/remote/data_sources/FirebaseService.dart';
import 'package:syara_finder/Features/Authentication/domain/repositories/AuthRepository.dart';

class AuthRepositoryImpli extends AuthRepository{

  @override
  Future<UserCredential?> signInWithFacebookAccount() async{
   return await FirebaseService.signInWithFacebook();
  }

  @override
  Future<UserCredential> signInWithGoogleAccount() {
    return FirebaseService.signInWithGoogle();
  }

  @override
  Future<void> signOutFromAccount() async{
    return FirebaseService.signOutFromAccount();
  }

  @override
  Future<UserCredential> signInWithNormalAccount({required String email , required String password}) {
    // TODO: implement signInWithNormalAccount
    return FirebaseService.signInWithNormalAccount(email: email, password: password);
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> createNormalAccount({required String email, required String password}) async{
    return await FirebaseService.createNormalAccount(email: email, password: password);
  }

}