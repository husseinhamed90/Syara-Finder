import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {


  static FacebookAuth facebookAuth =FacebookAuth.instance;

  static FirebaseAuth firebaseAuth =FirebaseAuth.instance;

  static Future<UserCredential?> signInWithFacebook() async {
    LoginResult facebookLoginResult = await facebookAuth.login();
    final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
    return await firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

  static Future<UserCredential> signInWithNormalAccount({required String email , required String password})async{
    return firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> createNormalAccount({required String email , required String password})async{
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static signOutFromGoogle() async{
    await firebaseAuth.signOut();
  }

  static signOutFromFacebook() async{
    await facebookAuth.logOut();
  }

  static Future<void>signOutFromAccount() async{
    return await firebaseAuth.signOut();
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken,);
    return await firebaseAuth.signInWithCredential(credential);
  }
}
