import 'package:cpp_final_app/auth/auth.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Auth auth = Auth();

  get username => auth.username;

  get usermail => auth.usermail;

  Future<void> userLogin(String email, String password, Widget toPage) async {
    final response = await auth.userLoginWithEmail(email, password);
    processFunction(response, toPage);
  }

  Future<void> userRegistration(
      String email, String password, String name, Widget toPage) async {
    final response = await auth.userRegistration(
      email: email,
      name: name,
      password: password,
    );

    processFunction(response, toPage);
  }

  Future<void> updateUserRegistration() async {}

  Future<void> sendPasswordReset(String email, Widget toPage) async {
    final response = await auth.sendPasswordResetMail(
      email: email,
    );
    processFunction(response, toPage);
  }

  Future<void> resetPassword(
      String code, String newPassword, Widget toPage) async {
    final response = await auth.resetPassword(
      code: code,
      newPassword: newPassword,
    );
    processFunction(response, toPage);
  }

  Future<void> userLogout() async {
    await auth.userLogout();
  }

  Future<void> deleteUserAccount() async {
    await auth.deleteAccount();
  }

  //TODO: Possibly take this guy to helper function
  void processFunction(
      Map<AuthStatusEnum, String> response, Widget toPage) async {
    if (response.entries.first.key == AuthStatusEnum.success) {
      Get.offUntil(
        MaterialPageRoute(
          builder: (context) => toPage,
        ),
        (route) => false,
      );
    } else {
      Get.snackbar(
        'Error',
        response.entries.first.value,
        animationDuration: const Duration(seconds: 3),
        backgroundColor: Colors.red.shade300,
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
      );
    }
  }
}
