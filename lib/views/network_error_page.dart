import 'package:cpp_final_app/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NetwortErrorPage extends StatelessWidget {
  const NetwortErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: SvgPicture.asset(
                'assets/network_error.svg',
                // color: Colors.orange,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                colorFilter: const ColorFilter.mode(
                  Colors.greenAccent,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'OOPS!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightGreen,
                fontFamily: 'Klasik',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'No internet connection\nCheck your internet connection and try again',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightGreen,
                fontFamily: 'Klasik',
              ),
            ),
            const SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                Get.offAll(
                  SplashPage(),
                );
              },
              height: 50,
              minWidth: 100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: Colors.greenAccent,
              child: Text(
                'Retry',
                style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
