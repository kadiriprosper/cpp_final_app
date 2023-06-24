import 'package:cpp_final_app/colors/colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: CustomColor.buttonColor1,
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
