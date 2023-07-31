import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:flutter/material.dart';

class TabAppBar extends StatelessWidget {
  const TabAppBar({
    super.key,
    required this.landingPageController,
    required this.title,
  });

  final LandingPageController landingPageController;
  final String title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      titleTextStyle: Theme.of(context)
          .appBarTheme
          .titleTextStyle
          ?.copyWith(fontWeight: FontWeight.bold),
      leading: IconButton(
        onPressed: () {
          landingPageController.popTab();
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        title,
        // style: TextStyle(
        //   fontSize: 18,
        //   fontWeight: FontWeight.bold,
        // ),
      ),
    );
  }
}
