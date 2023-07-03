import 'package:cpp_final_app/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonSmall extends StatelessWidget {
  const CustomButtonSmall({
    super.key,
    required this.onPressed,
    this.buttonColor = CustomColor.buttonColor1,
    required this.title,
    this.textColor,
  });

  final VoidCallback onPressed;
  final Color buttonColor;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: CustomColor.buttonColor1),
      ),
      minWidth: MediaQuery.of(context).size.width / 2.5,
      color: buttonColor,
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
