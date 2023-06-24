import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8)
            .copyWith(bottom: 0),
        child: Column(
          children: [
            const Text(
              'Verification',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              //TODO: Input the phone number here
              'Enter the code sent to 99*******5',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            //TODO: How to autofill from message
            //TODO: Update the input fields with the correct plugin
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            AuthButton(
              title: 'Confirm',
              onPressed: () {
                //TODO: Code to validate

                Get.dialog(
                  const Dialog(
                    insetPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20,
                    ),
                    backgroundColor: Colors.transparent,
                    child: AuthDialogBox(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
            'Your password has been changed successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          AuthButton(
            title: 'Ok',
            onPressed: () {
              //TODO: Write the code to go to the home screen
            },
          ),
        ],
      ),
    );
  }
}
