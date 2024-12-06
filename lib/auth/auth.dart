import 'package:cpp_final_app/auth/profile_update.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const authSuccess = {AuthStatusEnum.success: 'success'};

class Auth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String get username => firebaseAuth.currentUser?.displayName ?? '';
  String get usermail => firebaseAuth.currentUser?.email ?? '';
  String? get userImage => firebaseAuth.currentUser?.photoURL;

  Future<Map<AuthStatusEnum, String>> userLoginWithEmail(
      String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {AuthStatusEnum.failed: 'No user record'};
      }
      if (e.code == 'wrong-password') {
        return {AuthStatusEnum.failed: 'Wrong email or password'};
      }
      if (e.code == 'invalid-credential' || e.code == "wrong-password") {
        return {AuthStatusEnum.failed: 'Email or password incorrect'};
      }
      return {AuthStatusEnum.failed: 'error logging in'};
    }
    return authSuccess;
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
      if (e.code == 'weak-password') {
        return {AuthStatusEnum.failed: 'password too weak'};
      }
      if (e.code == 'email-already-in-use') {
        return {AuthStatusEnum.failed: 'email already exist'};
      }
      return {AuthStatusEnum.failed: 'registration error'};
    }
    userCredential.user?.updateDisplayName(name);
    return authSuccess;
  }

  Future<Map<AuthStatusEnum, String>> setPhoneNumber({
    required String phoneNumber,
    required VoidCallback verificationCompleted,
    required VoidCallback verificationFailed,
    required String Function() codeSent,
    required VoidCallback codeAutoRetrievalTimeout,
  }) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) => verificationCompleted,
        verificationFailed: (error) => verificationFailed,
        codeSent: (verificationId, forceResendingToken) async {
          String smsCode = codeSent.call();
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          try {
            await firebaseAuth.currentUser?.linkWithCredential(credential);
          } on Exception catch (e) {
            return Future(
                () => {AuthStatusEnum.failed: 'registration error $e'});
          }
        },
        codeAutoRetrievalTimeout: (verificationId) => codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: 'registration error $e'};
    }
    return authSuccess;
  }

  Future<Map<AuthStatusEnum, String>> sendPasswordResetMail({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    return authSuccess;
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
    return authSuccess;
  }

  Future<Map<AuthStatusEnum, String>> userLogout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    return authSuccess;
  }

  Future<Map<AuthStatusEnum, String>> deleteAccount() async {
    try {
      await firebaseAuth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      return {AuthStatusEnum.failed: e.code};
    }
    return authSuccess;
  }

  Future<Map<AuthStatusEnum, String>> updateUserImage(String photoUrl) async {
    try {
      await firebaseAuth.currentUser?.updatePhotoURL(photoUrl);
    } on FirebaseAuthException catch (_) {
      return updateFailed('Error updating user profile picture');
    }
    return updateSuccess;
  }
}
