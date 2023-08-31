import 'package:cpp_final_app/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, this.computation});

  final Future<dynamic>? computation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return const SpinKitChasingDots(
            color: CustomColor.caroselColor1,
          );
        },
      ),
    );
  }
}
