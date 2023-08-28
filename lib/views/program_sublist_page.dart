import 'package:cpp_final_app/views/tutorial_list.dart';
import 'package:cpp_final_app/views/program_detail_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramSublistPage extends StatelessWidget {
  const ProgramSublistPage(
      {super.key, required this.pageTitle, required this.dataList});

  final String pageTitle;
  final Map<String, dynamic> dataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: pageTitle,
      ).build(context),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 20),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: dataList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            return TutorialListCard(
              onPressed: () {
                Get.to(
                  () => ProgramDetailPage(
                    pageTitle: dataList.keys.elementAt(index),
                    dataList: dataList.values.elementAt(index),
                  ),
                );
              },
              title: dataList.keys.elementAt(index),
              // length: courseList[index]?['length'] ?? '',
              index: index + 1,
            );
          },
        ),
      ),
    );
  }
}
