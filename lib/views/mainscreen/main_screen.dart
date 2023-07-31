import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/mainscreen/chat_page.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/views/mainscreen/home_page.dart';
import 'package:cpp_final_app/views/mainscreen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final landingPageController = Get.put(LandingPageController());
  final pages = const [
    HomePage(),
    CoursesPage(),
    ChatPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: landingPageController.tabIndex.last,
            children: pages,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: landingPageController.tabIndex.last,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              landingPageController.changeTabIndex(value);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: CustomColor.buttonColor1,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: CustomInactiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.homeOutlined),
                ),
                activeIcon: CustomActiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.homeIcon),
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: CustomInactiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.courseOutlined),
                ),
                activeIcon: CustomActiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.courseIcon),
                ),
                label: 'courses',
              ),
              BottomNavigationBarItem(
                icon: CustomInactiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.chatOutlined),
                ),
                activeIcon: CustomActiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.chatIcon),
                ),
                label: 'chat',
              ),
              BottomNavigationBarItem(
                icon: CustomInactiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.profileOutlined),
                ),
                activeIcon: CustomActiveIcon(
                  icon: SvgPicture.asset(NavCustomIcon.profileIcon),
                ),
                label: 'profile',
              ),
            ],
          ),
        ));
  }
}

class CustomInactiveIcon extends StatelessWidget {
  const CustomInactiveIcon({
    super.key,
    required this.icon,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CustomActiveIcon extends StatelessWidget {
  const CustomActiveIcon({
    super.key,
    required this.icon,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(
          height: 10,
        ),
        Container(
          color: CustomColor.buttonColor1,
          width: 20,
          height: 2,
        ),
      ],
    );
  }
}


