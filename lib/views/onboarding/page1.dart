import 'package:cpp_final_app/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWidget(
      imagePath: 'assets/onboarding/intro1.png',
      titleText: 'Learn new skills every day!',
      contentText:
          'We provide the best learning courese & great mentors for you.',
    );
  }
}
