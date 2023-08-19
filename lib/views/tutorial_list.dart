import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/data/data_pool.dart';
import 'package:cpp_final_app/views/tutorial_detail_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialList extends StatelessWidget {
  const TutorialList({super.key, this.dataPool});

  final Map<String, dynamic>? dataPool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
        title: 'C++ Tutorial',
      ).build(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: dataPool?.length ?? DataPool.tutorialList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            return TutorialListCard(
              onPressed: () {
                if (dataPool == null) {
                  DataPool.tutorialList[index]?['type'] == 'linear'
                      ? Get.to(
                          TutorialDetailPage(
                            pageTitle: DataPool.tutorialList[index]?['title']
                                as String,
                            mdString: DataPool.tutorialList[index]?['content']
                                as String,
                          ),
                        )
                      : Get.to(TutorialList(
                          dataPool: DataPool.tutorialList[index]?['content']
                              as Map<String, dynamic>,
                        ));
                } else {
                  Get.to(
                    TutorialDetailPage(
                      pageTitle: dataPool?.keys.elementAt(index) ?? '', 
                      mdString: dataPool?.entries.elementAt(index) as String,
                    ),
                  );
                }
              },
              title: DataPool.tutorialList[index]?['title'] as String,
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
