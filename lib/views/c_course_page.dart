import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/global_controller.dart';
import 'package:cpp_final_app/data/dummy_data.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/course_page.dart';
import 'package:cpp_final_app/views/tutorial_list.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/views/program_list_page.dart';
import 'package:cpp_final_app/views/qapage.dart';

import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CCoursePage extends StatefulWidget {
  const CCoursePage({super.key});

  @override
  State<CCoursePage> createState() => _CCoursePageState();
}

class _CCoursePageState extends State<CCoursePage> {
  int currentSelected = 0;
  final segments = const [
    OverviewSegment(),
    PdfSegment(),
    PdfSegment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
        title: 'C Programming',
      ).build(context),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: CustomColor.courseFrameColor,
                      width: 5,
                    ),
                    image: DecorationImage(
                      image: AssetImage(HelperFunctions.cCourseImage),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset.fromDirection(90),
                        blurRadius: 10,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white60,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(90),
                      blurRadius: 10,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: StatusButton(
                        isSelected: currentSelected == 0,
                        label: 'Overview',
                        width: MediaQuery.of(context).size.width / 3.5,
                        onPressed: () {
                          setState(() {
                            currentSelected = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: StatusButton(
                        isSelected: currentSelected == 1,
                        label: 'PDFs',
                        width: MediaQuery.of(context).size.width / 3.5,
                        onPressed: () {
                          setState(() {
                            currentSelected = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: StatusButton(
                        isSelected: currentSelected == 2,
                        label: 'Videos',
                        width: MediaQuery.of(context).size.width / 3.5,
                        onPressed: () {
                          setState(() {
                            currentSelected = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              segments[currentSelected],
            ],
          ),
        ),
      ),
    );
  }
}

class OverviewSegment extends StatelessWidget {
  const OverviewSegment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalController globalController = Get.put(GlobalController());
    return ListView(
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'C Programming',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
          width: double.infinity,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            cText,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CourseButton(
                isSvg: true,
                imagePath: HelperFunctions.lessonsImage,
                onPressed: () {
                  Get.to(() => const TutorialList(
                        pageTitle: 'C Tutorials',
                      ));
                },
                title: 'Tutorial',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CourseButton(
                isSvg: true,
                imagePath: HelperFunctions.programImage,
                onPressed: () {
                  globalController.selectedProgrammingLanguage = 'c';
                  Get.to(() => const ProgramListPage());
                },
                title: 'Program',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CourseButton(
                isSvg: true,
                imagePath: HelperFunctions.qaImage,
                onPressed: () {
                  globalController.selectedProgrammingLanguage = 'c';
                  Get.to(() => const QaPage());
                },
                title: 'Q/A',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CourseButton(
                isSvg: true,
                imagePath: HelperFunctions.langImage,
                onPressed: () {},
                title: 'English',
                isButton: false,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CourseButton(
                isSvg: true,
                imagePath: HelperFunctions.certImage,
                onPressed: () {},
                title: 'Certificate',
                isButton: false,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CourseButton(
                isSvg: true,
                imagePath: HelperFunctions.securityImage,
                onPressed: () {},
                title: 'Fully Secure',
                isButton: false,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// //TODO: Fix up the coming soon page
// class PdfSegment extends StatelessWidget {
//   const PdfSegment({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.running_with_errors,
//             size: 50,
//           ),
//           Text(
//             'Feature not yet here, expect it in future updates',
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CourseButton extends StatelessWidget {
//   const CourseButton({
//     super.key,
//     required this.isSvg,
//     required this.title,
//     required this.imagePath,
//     required this.onPressed,
//     this.isButton = true,
//   });

//   final bool isSvg;
//   final String title;
//   final String imagePath;
//   final VoidCallback onPressed;
//   final bool isButton;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           height: 90,
//           width: 85,
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: isButton
//                 ? const Color.fromARGB(255, 160, 212, 255)
//                 : const Color.fromARGB(255, 228, 243, 255),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               isSvg
//                   ? SvgPicture.asset(
//                       imagePath,
//                       height: 30,
//                       width: 30,
//                       fit: BoxFit.contain,
//                     )
//                   : Image.asset(
//                       imagePath,
//                       filterQuality: FilterQuality.high,
//                       height: 30,
//                       width: 30,
//                       fit: BoxFit.contain,
//                     ),
//               const SizedBox(height: 10),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         isButton
//             ? MaterialButton(
//                 onPressed: onPressed,
//                 height: 98,
//                 minWidth: 92,
//                 hoverColor: Colors.black12,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               )
//             : const SizedBox(),
//       ],
//     );
//   }
// }
