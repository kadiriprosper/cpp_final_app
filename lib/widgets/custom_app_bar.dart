import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.hasLeading,
    this.title,
    this.titleWidget,
    this.bgColor = Colors.white,
    this.fgColor = Colors.black,
    this.onBack,
    this.actions,
  });

  final bool hasLeading;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final String? title;
  final Widget? titleWidget;
  final Color bgColor;
  final Color fgColor;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 60),
      child: AppBar(
        elevation: 0,
        leading: hasLeading
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              )
            : null,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: titleWidget ??
            Text(
              title ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: fgColor,
        actions: actions,
      ),
    );
  }
}
