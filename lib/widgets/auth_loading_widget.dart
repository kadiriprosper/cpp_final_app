import 'package:cpp_final_app/colors/colors.dart';
import 'package:flutter/material.dart';

class AuthLoadingWidget extends StatelessWidget {
  const AuthLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      child: const LinearProgressIndicator(
        color: CustomColor.buttonColor1,
      ),
    );
  }
}
