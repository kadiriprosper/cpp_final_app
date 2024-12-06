import 'package:cpp_final_app/colors/theme.dart';
import 'package:cpp_final_app/controllers/db_controller.dart';
import 'package:cpp_final_app/firebase_options.dart';
import 'package:cpp_final_app/views/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //TODO: Move this to splash screen page
  final dbController = Get.put(DataController());
  await dbController.getDataElements('school_list');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.dayTheme.copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 232, 221),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Color.fromARGB(255, 246, 232, 221),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 246, 232, 221),
        ),
      ),
      defaultTransition: Transition.cupertino,
      home: const SplashPage(),
    );
  }
}
