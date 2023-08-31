import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({
    super.key,
    required this.imagePath,
    required this.titleText,
    required this.contentText,
  });

  final String imagePath;
  final String titleText;
  final String contentText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    contentText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
