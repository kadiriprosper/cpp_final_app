import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/widgets/tab_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Change all the colors to their final colors

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final landingPageController = Get.put(LandingPageController());
  int totalCourseProgress = 80;
  bool isOngoingSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(
        landingPageController: landingPageController,
        title: 'Courses',
      ).build(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
                    isSelected: isOngoingSelected,
                    label: 'Ongoing',
                    onPressed: () {
                      setState(() {
                        isOngoingSelected = true;
                      });
                    },
                  ),
                  StatusButton(
                    isSelected: !isOngoingSelected,
                    label: 'Completed',
                    onPressed: () {
                      setState(() {
                        isOngoingSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            isOngoingSelected
                ? CoursesListView(totalCourseProgress: totalCourseProgress)
                : CoursesListView(totalCourseProgress: totalCourseProgress),
          ],
        ),
      ),
    );
  }
}

class CoursesListView extends StatelessWidget {
  const CoursesListView({
    super.key,
    required this.totalCourseProgress,
  });

  //TODO: This progress would come from the course model
  final int totalCourseProgress;

  //TODO: Plug this to the provider and allow it show the selected
  //TODO: status for the courses

  //TODO: All colors need to be rectified to their final colors

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      HelperFunctions.ongoingCourseImages[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                // width: MediaQuery.of(context).size.width / 2.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UI UX Design',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '8 Lessons to go',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 200,
                          child: LinearProgressIndicator(
                            value: totalCourseProgress / 100,
                            minHeight: 3.5,
                            color: CustomColor.buttonColor1,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '$totalCourseProgress%',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 4,
    );
  }
}

class StatusButton extends StatelessWidget {
  const StatusButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.width,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // hoverColor: Colors.transparent,
      // splashColor: Colors.transparent,
      // focusColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      colorBrightness: Brightness.dark,
      hoverElevation: 0,
      highlightElevation: 0,
      color: isSelected
          ? const Color.fromARGB(255, 212, 228, 253)
          : Colors.transparent,
      elevation: 0,
      // padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      minWidth: width ?? MediaQuery.of(context).size.width / 2.3,
      height: 50,
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: isSelected ? CustomColor.buttonColor1 : Colors.grey,
        ),
      ),
    );
  }
}
