import 'package:cpp_final_app/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    required this.onPressed,
    this.textColor = CustomColor.buttonColor1,
  });

  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MaterialButton(
        onPressed: onPressed,
        height: 60,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: CustomColor.buttonColor1,
          ),
        ),
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.leadingIcon,
  });

  final String label;
  final VoidCallback onPressed;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset.fromDirection(90),
              blurRadius: 10,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: ListTile(
          leading: leadingIcon,
          title: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
