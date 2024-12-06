import 'dart:io';

import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/views/mainscreen/main_screen.dart';
import 'package:cpp_final_app/views/network_error_page.dart';
import 'package:cpp_final_app/views/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: () async {
            const secureStorage = FlutterSecureStorage();
            if (await secureStorage.read(key: 'email') == null) {
              Get.to(() => const OnboardingPage());
            } else {
              final networkResponse = await isNetworkAvailable();
              if (networkResponse) {
                final controller = Get.put(UserController());
                await controller.userLogin(
                  (await secureStorage.read(key: 'email'))!,
                  (await secureStorage.read(key: 'password'))!,
                  const MainScreen(),
                );
              } else {
                Get.to(NetwortErrorPage());
              }
            }
          }.call(),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Team TYP',
                        style: TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(148, 101, 123, 141),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SpinKitRipple(
                        color: Color.fromARGB(255, 37, 157, 255),
                        size: 30,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

Future<bool> isNetworkAvailable() async {
  try {
    final response = await InternetAddress.lookup('google.com');
    return response.isNotEmpty && response[0].rawAddress.isNotEmpty;
  } catch (_) {
    return false;
  }
}
