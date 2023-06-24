import 'package:cpp_final_app/colors/colors.dart';
import 'package:flutter/material.dart';

class OnboardingPositionIcon extends StatelessWidget {
  const OnboardingPositionIcon({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 5,
      backgroundColor: Colors.grey.shade400,
      child: CircleAvatar(
        radius: 4.9,
        backgroundColor:
            isSelected ? CustomColor.buttonColor1 : Colors.transparent,
      ),
    );
  }
}
