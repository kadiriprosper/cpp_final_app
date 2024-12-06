import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/views/auth/forgot_password_screen.dart';
import 'package:cpp_final_app/views/auth/registration/registration_page.dart';
import 'package:cpp_final_app/views/loading_screen.dart';
import 'package:cpp_final_app/views/mainscreen/main_screen.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:cpp_final_app/widgets/auth_button_external.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserController userController = Get.put(UserController());
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Glad to meet you again!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: mailController,
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
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (passwordController.text.length < 6) {
                                  return 'length needs to be  or more';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: showPassword,
                              //TODO: Probably remove this text
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: !showPassword
                                      ? Icon(MdiIcons.eyeOff)
                                      : Icon(MdiIcons.eye),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(() => const ForgotPasswordScreen());
                          },
                          child: const Text(
                            'Forgot password ?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.buttonColor1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AuthButton(
                        title: 'Log In',
                        onPressed: () async {
                          if (formKey.currentState?.validate() == true) {
                            LoadingScreen.loadPage(
                              computation: userController.userLogin(
                                mailController.text,
                                passwordController.text,
                                const MainScreen(),
                              ),
                            );
                          }
                        },
                      ),
                      // const SizedBox(height: 20),
                      // const Text(
                      //   'or sign in with',
                      // ),
                      // const SizedBox(height: 20),
                      // AuthButtonExternal(
                      //   icon: Icon(
                      //     MdiIcons.google,
                      //     color: Colors.red,
                      //   ),
                      //   title: 'Login with Google',
                      //   onPressed: () {
                      //     //TODO: validate and login with google
                      //   },
                      // ),
                      // const SizedBox(height: 20),
                      // AuthButtonExternal(
                      //     icon: Icon(
                      //       MdiIcons.facebook,
                      //       color: CustomColor.buttonColor1,
                      //     ),
                      //     title: 'Login with Facebook',
                      //     onPressed: () {},),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(
                    bottom: 30,
                    top: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Get.to(() => const RegistrationPage());
                        },
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        minWidth: 20,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: CustomColor.buttonColor1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
