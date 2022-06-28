import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {

  static Future<UserCredential?> signInWithFacebook() async {
    LoginResult facebookLoginResult = await FacebookAuth.instance.login();
    //final userData = await FacebookAuth.instance.getUserData();
    //var accessToken = facebookLoginResult.accessToken;
    final facebookAuthCredential = FacebookAuthProvider.credential(
        facebookLoginResult.accessToken!.token);
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  static Future<UserCredential> signInWithNormalAccount({required String email , required String password})async{
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<UserCredential> createNormalAccount({required String email , required String password})async{
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  static signOutFromGoogle() async{
    await FirebaseAuth.instance.signOut();
  }
  static signOutFromFacebook() async{
    await FacebookAuth.instance.logOut();
  }
  static Future<void>signOutFromAccount() async{
    return await FirebaseAuth.instance.signOut();
  }

  static Future<UserCredential> signInWithGoogle() async {
// Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

// Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!
        .authentication;

// Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

// Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}
