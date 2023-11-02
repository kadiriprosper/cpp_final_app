import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/db_controller.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  DataController dbController = Get.put(DataController());
  UserController userController = Get.put(UserController());
  String userRating = '';
  TextEditingController feedbackTextController = TextEditingController();

  @override
  void dispose() {
    feedbackTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: '',
        onBack: () {},
      ).build(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: MediaQuery.of(context).size.height - 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Give Feedback',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Give your feedback about our app',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Are you satisfied with this app?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: 5,
                maxRating: 5,
                allowHalfRating: true,
                direction: Axis.horizontal,
                itemCount: 5,
                wrapAlignment: WrapAlignment.spaceEvenly,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                itemSize: 50,
                onRatingUpdate: (value) {
                  if (value < 2) {
                    userRating = 'Poor - $value';
                  } else if (value == 3) {
                    userRating = 'Average - $value';
                  } else if (value == 4) {
                    userRating = 'Good - $value';
                  } else {
                    userRating = 'Excellent - $value';
                  }
                },
              ),
              const SizedBox(height: 30),
              const Text(
                'Tell us what can be improved',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: feedbackTextController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Write your feedback...',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                buttonColor: CustomColor.buttonColor1,
                textColor: Colors.white,
                buttonText: 'Submit Feedback',
                onPressed: () async {
                  if (feedbackTextController.text.length > 4) {
                    var response = await dbController
                        .storeUserData(userController.usermail, {
                      'rating': userRating,
                      'feedback': feedbackTextController.text,
                    });
                    if (response.keys.first == AuthStatusEnum.failed) {
                      //TODO: Handle showing error here
                      print('error1');
                    } else {
                      Get.back();
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
