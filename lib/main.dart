import 'package:cpp_final_app/colors/theme.dart';
import 'package:cpp_final_app/views/auth/login_page.dart';
import 'package:cpp_final_app/views/auth/registration/mobile_auth_page.dart';
import 'package:cpp_final_app/views/auth/registration/registration_page.dart';
import 'package:cpp_final_app/views/auth/registration/verification_page.dart';
import 'package:cpp_final_app/views/course_page.dart';
import 'package:cpp_final_app/views/courses_list.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/views/mainscreen/main_screen.dart';
import 'package:cpp_final_app/views/settingscreens/certificates_page.dart';
import 'package:cpp_final_app/views/settingscreens/edit_profile_page.dart';
import 'package:cpp_final_app/views/settingscreens/feedback_page.dart';
import 'package:cpp_final_app/views/settingscreens/help_center_page.dart';
import 'package:cpp_final_app/views/settingscreens/payments_page.dart';
import 'package:cpp_final_app/views/settingscreens/privacy_page.dart';
import 'package:cpp_final_app/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: Change the text theme of the whole app
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.dayTheme,
      defaultTransition: Transition.cupertino,
      home: const MainScreen(),
    );
  }
}
