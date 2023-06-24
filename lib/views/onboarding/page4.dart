import 'package:cpp_final_app/widgets/page_widget.dart';
import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWidget(
      imagePath: 'assets/onboarding/intro4.png',
      titleText: 'Explore new resources!',
      contentText:
          'We provide the best learning courese & great mentors for you.',
    );
  }
}
