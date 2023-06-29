import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

//TODO: Change all the colors to their final colors

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int totalCourseProgress = 80;
  bool isOngoingSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Courses',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColor.color14,
            ),
            width: MediaQuery.of(context).size.width,
            height: 45,
            child: ButtonBar(
              buttonPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
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
          const SizedBox(height: 10),
          isOngoingSelected
              ? CoursesListView(totalCourseProgress: totalCourseProgress)
              : CoursesListView(totalCourseProgress: totalCourseProgress),
        ],
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
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
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
                    image:
                        AssetImage(HelperFunctions.ongoingCourseImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 1.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'UI UX Design',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '8 Lessons to go',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: LinearProgressIndicator(
                            value: totalCourseProgress / 100,
                            color: CustomColor.buttonColor1,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('$totalCourseProgress%'),
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
  });

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isSelected ? Colors.blueAccent.shade200 : Colors.transparent,
      elevation: 0,
      // padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      minWidth: MediaQuery.of(context).size.width / 2.3,
      height: 50,
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: isSelected ? CustomColor.buttonColor1 : Colors.white,
        ),
      ),
    );
  }
}
