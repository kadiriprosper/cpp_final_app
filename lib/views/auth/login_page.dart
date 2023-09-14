import 'package:cpp_final_app/auth/auth.dart';
import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:cpp_final_app/views/auth/registration/registration_page.dart';
import 'package:cpp_final_app/views/mainscreen/main_screen.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:cpp_final_app/widgets/auth_button_external.dart';
import 'package:cpp_final_app/widgets/auth_loading_widget.dart';
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
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     color: Colors.black,
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 40),
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
                                  //TODO: Write the code to validate the email
                                  return null;
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
                              //TODO: Write code to go to the forgotten password page
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
                            //TODO: Write code to validate login and go to home page
                            Get.showOverlay(
                              asyncFunction: () async {
                                await userController.userLogin(
                                  mailController.text,
                                  passwordController.text,
                                  const MainScreen(),
                                );
                              },
                              loadingWidget: const AuthLoadingWidget(),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'or sign in with',
                        ),
                        const SizedBox(height: 20),
                        AuthButtonExternal(
                          icon: Icon(
                            MdiIcons.google,
                            color: Colors.red,
                          ),
                          title: 'Login with Google',
                          onPressed: () {
                            //TODO: validate and login with google
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthButtonExternal(
                            icon: Icon(
                              MdiIcons.facebook,
                              color: CustomColor.buttonColor1,
                            ),
                            title: 'Login with Facebook',
                            onPressed: () {}),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(bottom: 30),
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
      ),
    );
  }
}
