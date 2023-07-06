import 'package:cpp_final_app/data/dummy_data.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        title: 'Courses',
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
                      label: 'Pdfs',
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
                'C++',
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
                    title: '12 Lessons',
                  ),
                  CourseButton(
                    isSvg: true,
                    imagePath: HelperFunctions.lessonsImage,
                    onPressed: () {},
                    title: '12 Lessons',
                  ),
                  CourseButton(
                    isSvg: true,
                    imagePath: HelperFunctions.lessonsImage,
                    onPressed: () {},
                    title: '12 Lessons',
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
    return MaterialButton(
      onPressed: onPressed,
      color: const Color.fromARGB(255, 228, 243, 255),
      height: 80,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          isSvg ? SvgPicture.asset(imagePath) : Image.asset(imagePath),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
