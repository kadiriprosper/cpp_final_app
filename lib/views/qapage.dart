import 'package:cpp_final_app/data/data_pool.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/faq_expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          itemCount: DataPool.cppQA.length,
          physics: const BouncingScrollPhysics(),
          // separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            const questions = DataPool.cppQA;
            return FAQExpansionWidget(
              title: questions[index]!['Question']!.trim(),
              text: qaString(questions[index]!['Answer'] as String),
            );
          },
        ),
      ),
    );
  }

  qaString(String? body) {
    return (body != null
            ? body
                .replaceAll(RegExp(r'\[|\]'), '')
                .replaceAll('-', '\n\n•') //⚈
                .trim()
            : '')
        .trim();
  }
}
