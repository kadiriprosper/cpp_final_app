import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/views/auth/change_password_screen.dart';
import 'package:cpp_final_app/views/loading_screen.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController mailController = TextEditingController();
  UserController userController = Get.put(UserController());
  final formKey = GlobalKey<FormFieldState>();

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 0),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Forgotten your password?\nInput your email address and we\'d send a link to reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 70),
                TextFormField(
                  controller: mailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != null && value.isEmail) {
                      return null;
                    }
                    return 'Input a valid email address';
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                AuthButton(
                  title: 'Send Reset Link',
                  onPressed: () async {
                    if (mailController.text.isEmail) {
                      await LoadingScreen.loadPage(
                        computation: userController.sendPasswordResetMail(
                          mailController.text,
                          const ChangePasswordScreen(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
