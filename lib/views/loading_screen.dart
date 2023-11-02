import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingScreen {
  static loadPage({required Future<void> computation}) async {
    Get.showOverlay(
      asyncFunction: () async => await computation,
      loadingWidget: const Center(
        child: SpinKitChasingDots(
          color: Colors.green,
          size: 80,
        ),
      ),
    );
  }
}


// class LoadingScreen extends StatelessWidget {
//   const LoadingScreen({super.key, this.computation});

//   final Future<dynamic>? computation;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: computation,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           return const SpinKitChasingDots(
//             color: CustomColor.caroselColor1,
// //           );
//         },
//       ),
//     );
//   }
// }
