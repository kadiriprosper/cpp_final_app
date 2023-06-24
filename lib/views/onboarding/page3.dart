import 'package:cpp_final_app/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWidget(
      imagePath: 'assets/onboarding/intro3.png',
      titleText: 'Get online learning certificate!',
      contentText:
          'We provide the best learning courese & great mentors for you.',
    );
  }
}
