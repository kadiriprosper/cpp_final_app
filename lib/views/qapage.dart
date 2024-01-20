import 'package:cpp_final_app/controllers/global_controller.dart';
import 'package:cpp_final_app/helpers/global_helpers.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/faq_expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QaPage extends StatelessWidget {
  const QaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
        title: 'Q/A Interview',
      ).build(context),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
        // margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: globalController.getQaQuestions().length,
          physics: const BouncingScrollPhysics(),
          // separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final questions = globalController.getQaQuestions();
            return FAQExpansionWidget(
              title: questions[index]!['Question']!.trim(),
              text: GlobalHelpers.stirngModifier(
                  questions[index]!['Answer'] as String),
            );
          },
        ),
      ),
    );
  }
}
