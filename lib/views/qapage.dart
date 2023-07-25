import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/faq_expansion_widget.dart';
import 'package:flutter/material.dart';

class QaPage extends StatelessWidget {
  const QaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
        title: 'Q/A Interview',
      ).build(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          // separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return FAQExpansionWidget(
              title: 'Hello',
              text: 'Hello World',
            );
          },
        ),
      ),
    );
  }
}
