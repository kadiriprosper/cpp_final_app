import 'package:cpp_final_app/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWidget(
      imagePath: 'assets/onboarding/intro2.png',
      titleText: 'Easy enroll in class!',
      contentText:
          'We provide the best learning courese & great mentors for you.',
    );
  }
}
