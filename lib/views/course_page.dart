import 'package:cpp_final_app/data/dummy_data.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/views/qapage.dart';
import 'package:cpp_final_app/views/settingscreens/help_center_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
        title: 'C++ Programming',
      ).build(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 10),
                  image: DecorationImage(
                    image: AssetImage(HelperFunctions.courseImage),
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
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
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
                child: ButtonBar(
                  buttonPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 5,
                  ),
                  alignment: MainAxisAlignment.center,
                  children: [
                    StatusButton(
                      isSelected: currentSelected == 0,
                      label: 'Overview',
                      width: MediaQuery.of(context).size.width / 3.5,
                      onPressed: () {
                        setState(() {
                          currentSelected = 0;
                        });
                      },
                    ),
                    StatusButton(
                      isSelected: currentSelected == 1,
                      label: 'PDFs',
                      width: MediaQuery.of(context).size.width / 3.5,
                      onPressed: () {
                        setState(() {
                          currentSelected = 1;
                        });
                      },
                    ),
                    StatusButton(
                      isSelected: currentSelected == 2,
                      label: 'Videos',
                      width: MediaQuery.of(context).size.width / 3.5,
                      onPressed: () {
                        setState(() {
                          currentSelected = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'C++ Programming',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                placeholderText,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CourseButton(
                    isSvg: true,
                    imagePath: HelperFunctions.lessonsImage,
                    onPressed: () {},
                    title: 'Tutorial',
                  ),
                  CourseButton(
                    isSvg: false,
                    imagePath: HelperFunctions.programImage,
                    onPressed: () {},
                    title: 'Program',
                  ),
                  CourseButton(
                    isSvg: false,
                    imagePath: HelperFunctions.qaImage,
                    onPressed: () {
                      Get.to(() => const QaPage());
                    },
                    title: 'Q/A',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CourseButton(
                    isSvg: true,
                    imagePath: HelperFunctions.langImage,
                    onPressed: () {},
                    title: 'English',
                  ),
                  CourseButton(
                    isSvg: true,
                    imagePath: HelperFunctions.certImage,
                    onPressed: () {},
                    title: 'Certificate',
                  ),
                  CourseButton(
                    isSvg: true,
                    imagePath: HelperFunctions.securityImage,
                    onPressed: () {},
                    title: 'Fully Secure',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CourseButton extends StatelessWidget {
  const CourseButton({
    super.key,
    required this.isSvg,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  final bool isSvg;
  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 90,
        width: 85,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 228, 243, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset(
                    imagePath,
                  )
                : Image.asset(
                    imagePath,
                    filterQuality: FilterQuality.high,
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
