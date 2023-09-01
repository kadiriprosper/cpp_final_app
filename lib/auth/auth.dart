import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<Map<AuthStatusEnum, String>> userLoginWithEmail(
      String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    return {AuthStatusEnum.success: 'success'};
  }

  Future<Map<AuthStatusEnum, String>> userRegistration({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    userCredential.user?.updateDisplayName(name);
    return {AuthStatusEnum.success: 'success'};
  }

  Future<Map<AuthStatusEnum, String>> sendPasswordResetMail({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    return {AuthStatusEnum.success: 'success'};
  }

  Future<Map<AuthStatusEnum, String>> resetPassword({
    required String code,
    required String newPassword,
  }) async {
    try {
      await firebaseAuth.confirmPasswordReset(
        code: code,
        newPassword: newPassword,
      );
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    return {AuthStatusEnum.success: 'success'};
  }
}
