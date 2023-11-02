import 'package:cpp_final_app/views/auth/login_page.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'A reset link has been sent to you. Reset your password and relogin with the new password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              AuthButton(
                title: 'Login',
                onPressed: () {
                  Get.offAll(() => const LoginPage());
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
