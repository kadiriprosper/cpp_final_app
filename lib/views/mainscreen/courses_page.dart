import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:cpp_final_app/data/data_pool.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/widgets/tab_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO: Change all the colors to their final colors

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final landingPageController = Get.put(LandingPageController());
  int totalCourseProgress = 80;
  bool isCpp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(
        landingPageController: landingPageController,
        title: 'Projects',
      ).build(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
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
                      isSelected: isCpp,
                      label: 'Cpp',
                      onPressed: () {
                        setState(() {
                          isCpp = true;
                        });
                      },
                    ),
                    StatusButton(
                      isSelected: !isCpp,
                      label: 'C',
                      onPressed: () {
                        setState(() {
                          isCpp = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              isCpp
                  ? CoursesListView(
                      projectList: DataPool.cppProjectLinks,
                    )
                  : CoursesListView(
                      projectList: DataPool.cProjectLinks,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesListView extends StatelessWidget {
  const CoursesListView({
    super.key,
    required this.projectList,
    // required this.totalCourseProgress,
  });
  //TODO: All colors need to be rectified to their final colors
  final Map<String, String> projectList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            final Uri url =
                Uri.parse(projectList.entries.elementAt(index).value);
            if (!await launchUrl(url)) {
              Get.showSnackbar(
                const GetSnackBar(
                  title: 'Url could not be launched',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Container(
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    // width: MediaQuery.of(context).size.width / 2.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectList.entries.elementAt(index).key,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       width: MediaQuery.of(context).size.width - 200,
                        //       child: LinearProgressIndicator(
                        //         value: totalCourseProgress / 100,
                        //         minHeight: 3.5,
                        //         color: CustomColor.buttonColor1,
                        //       ),
                        //     ),
                        //     const SizedBox(width: 10),
                        //     Text(
                        //       '$totalCourseProgress%',
                        //       style: const TextStyle(
                        //         fontSize: 12,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: projectList.length,
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
