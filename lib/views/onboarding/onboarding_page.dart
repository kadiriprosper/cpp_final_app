import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/views/auth/login_page.dart';
import 'package:cpp_final_app/views/onboarding/page1.dart';
import 'package:cpp_final_app/views/onboarding/page2.dart';
import 'package:cpp_final_app/views/onboarding/page3.dart';
import 'package:cpp_final_app/views/onboarding/page4.dart';
import 'package:cpp_final_app/widgets/onboarding_position_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;
  int currentIndex = 0;
  final pages = const [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: pageController,
              children: pages,
            ),
            currentIndex == pages.length - 1
                ? const SizedBox()
                : Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 0,
                        onPressed: () {
                          // pageController.jumpToPage(pages.length - 1);
                          pageController.animateToPage(
                            pages.length - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Text('Skip'),
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        pages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: OnboardingPositionIcon(
                              isSelected: currentIndex == index),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            currentIndex == pages.length - 1
                                ? Get.offUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                    (route) => false,
                                  )
                                : pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          textColor: Colors.white,
                          color: CustomColor.buttonColor1,
                          height: 50,
                          minWidth: 150,
                          child: Text(
                            (currentIndex == pages.length - 1)
                                ? 'Get Started'
                                : 'Next',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
