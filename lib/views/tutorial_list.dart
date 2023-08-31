import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/global_controller.dart';
import 'package:cpp_final_app/views/sub_tutorial_list.dart';
import 'package:cpp_final_app/views/tutorial_detail_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialList extends StatelessWidget {
  const TutorialList({super.key});

  @override
  Widget build(BuildContext context) {
    final globalController = Get.put(GlobalController());
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
        title: 'C++ Tutorial',
      ).build(context),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 20),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: globalController.getTutorialList('Cpp').length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            final tutorialData = globalController.getTutorialList('Cpp');
            return TutorialListCard(
              onPressed: () {
                tutorialData[index]?['type'] != 'branch'
                    ? Get.to(
                        () => TutorialDetailPage(
                          pageTitle: tutorialData[index]?['title'] as String,
                          mdString: tutorialData[index]?['content'] as String,
                        ),
                      )
                    : Get.to(
                        () => SubTutorialList(
                          dataPool: tutorialData[index]?['content']
                              as Map<String, dynamic>,
                          pageTitle: tutorialData[index]?['title'] as String,
                        ),
                      );
              },
              title: (tutorialData[index]?['title'] as String).capitalize ?? '',
              index: index + 1,
            );
          },
        ),
      ),
    );
  }
}

class TutorialListCard extends StatelessWidget {
  const TutorialListCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.index,
  });

  final VoidCallback onPressed;
  //TODO: Probably pass the course here not just the title
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset.fromDirection(90),
              blurRadius: 10,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 201, 231, 255),
              ),
              child: Center(
                child: Text(
                  index < 10 ? '0$index' : index.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColor.buttonColor1,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  // Text(
                  //   length,
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 12,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
            ),
            // const CircleAvatar(
            //   radius: 12,
            //   backgroundColor: CustomColor.buttonColor1,
            //   child: CircleAvatar(
            //     radius: 10,
            //     backgroundColor: Colors.white,
            //     child: Icon(
            //       Icons.play_arrow_outlined,
            //       color: CustomColor.buttonColor1,
            //       size: 20,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
