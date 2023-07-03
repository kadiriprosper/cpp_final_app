import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/cpp_icons_icons.dart';
import 'package:cpp_final_app/views/mainscreen/chat_page.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/views/mainscreen/home_page.dart';
import 'package:cpp_final_app/views/mainscreen/profile_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = const [
    HomePage(),
    CoursesPage(),
    ChatPage(),
    ProfilePage(),
  ];
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: CustomColor.buttonColor1,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: CustomInactiveIcon(
                icon: Icon(CppIcons.home),
              ),
              activeIcon: CustomActiveIcon(
                icon: Icon(CppIcons.home_bold),
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: CustomInactiveIcon(
                icon: Icon(CppIcons.course),
              ),
              activeIcon: CustomActiveIcon(
                icon: Icon(CppIcons.course_bold),
              ),
              label: 'courses'),
          BottomNavigationBarItem(
              icon: CustomInactiveIcon(
                icon: Icon(CppIcons.chat),
              ),
              activeIcon: CustomActiveIcon(
                icon: Icon(CppIcons.chat_bold),
              ),
              label: 'chat'),
          BottomNavigationBarItem(
              icon: CustomInactiveIcon(
                icon: Icon(CppIcons.profile),
              ),
              activeIcon: CustomActiveIcon(
                icon: Icon(CppIcons.profile_bold),
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}

class CustomInactiveIcon extends StatelessWidget {
  const CustomInactiveIcon({
    super.key,
    required this.icon,
  });

  final Icon icon;

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

  final Icon icon;

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
