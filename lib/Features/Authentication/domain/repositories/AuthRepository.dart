import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signInWithGoogleAccount();
  Future<UserCredential> createNormalAccount({required String email , required String password});
  Future<UserCredential> signInWithNormalAccount({required String email , required String password});
  Future<UserCredential?> signInWithFacebookAccount();
  Future signOutFromAccount();
}