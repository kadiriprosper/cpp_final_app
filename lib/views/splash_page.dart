import 'package:cpp_final_app/views/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 1),
            () => Get.to(() => const OnboardingPage()),
          ),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.asset('assets/logo.png'),
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
