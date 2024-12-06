import 'package:cpp_final_app/views/mainscreen/main_screen.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class VerificationPage extends StatefulWidget {
//   const VerificationPage({super.key});

//   @override
//   State<VerificationPage> createState() => _VerificationPageState();
// }

// class _VerificationPageState extends State<VerificationPage> {
//   TextEditingController inputController = TextEditingController();
//   UserController userController = Get.put(UserController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
//             .copyWith(bottom: 0),
//         child: Column(
//           children: [
//             const Text(
//               'Verification',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 15),
//             Text(
//               'Enter the code sent to ${userController.phoneNumber}',
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 25),
//             //TODO: How to autofill from message
//             //TODO: Update the input fields with the correct plugin
//             Pinput(
//               controller: inputController,
//               length: 6,
//               onCompleted: (value) => print(value),
//             ),
//             const SizedBox(height: 26),
//             AuthButton(
//               title: 'Confirm',
//               onPressed: () {
//                 if (inputController.text.length == 6) {
//                   // userController.getOtp(inputController.text);
//                   // userController.otpCode.update(
//                   //   (val) {
//                   //     val = inputController.text;
//                   //   },
//                   // );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AuthDialogBox extends StatelessWidget {
  const AuthDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 2.5,
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 400,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/success.png',
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
          ),
          const Text(
            'Successful!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const Text(
            'You have been registered successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          AuthButton(
            title: 'Ok',
            onPressed: () {
              Get.offUntil(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
