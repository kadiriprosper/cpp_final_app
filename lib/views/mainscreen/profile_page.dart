import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/auth/login_page.dart';
import 'package:cpp_final_app/views/settingscreens/certificates_page.dart';
import 'package:cpp_final_app/views/settingscreens/edit_profile_page.dart';
import 'package:cpp_final_app/views/settingscreens/feedback_page.dart';
import 'package:cpp_final_app/views/settingscreens/help_center_page.dart';
import 'package:cpp_final_app/views/settingscreens/payments_page.dart';
import 'package:cpp_final_app/views/settingscreens/privacy_page.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:cpp_final_app/widgets/custom_button_small.dart';
import 'package:cpp_final_app/widgets/profile_pic_widget.dart';
import 'package:cpp_final_app/widgets/tab_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final landingPageController = Get.put(LandingPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(
        landingPageController: landingPageController,
        title: 'My Profile',
      ).build(context),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ProfilePicWidget(
                isEditable: false,
              ),
              const SizedBox(height: 10),
              //TODO: Get the username
              const Text(
                'Leslie Alexander',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(
                    () => const EditProfilePage(),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SettingsButton(
                label: 'My Certification',
                leadingIcon:
                    SvgPicture.asset(ProfileCustomIcon.certificateIcon),
                onPressed: () {
                  Get.to(const CertificatePage());
                },
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'Projects',
                leadingIcon: SvgPicture.asset(ProfileCustomIcon.projectIcon),
                onPressed: () {
                  //TODO: link this to the controller and get it to go to page 2
                  landingPageController.changeTabIndex(1);
                },
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'Payments',
                leadingIcon: SvgPicture.asset(ProfileCustomIcon.cardIcon),
                onPressed: () {
                  Get.to(const PaymentsPage());
                },
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'Help Center',
                leadingIcon: SvgPicture.asset(ProfileCustomIcon.helpCenterIcon),
                onPressed: () {
                  Get.to(const HelpCenterPage());
                },
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'Privacy Policy',
                leadingIcon:
                    SvgPicture.asset(ProfileCustomIcon.privacyPolicyIcon),
                onPressed: () {
                  Get.to(const PrivacyPolicy());
                },
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'Feedback',
                leadingIcon: SvgPicture.asset(ProfileCustomIcon.feedbackIcon),
                onPressed: () {
                  Get.to(const FeedbackPage());
                },
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'Rate Us',
                leadingIcon: SvgPicture.asset(ProfileCustomIcon.rateIcon),
                onPressed: () {
                  Get.dialog(
                    RateUsDialogBox(),
                  );
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                buttonColor: Colors.white,
                buttonText: 'Logout',
                onPressed: () {
                  Get.dialog(
                    const ProfileDialogBoxWidget(),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class RateUsDialogBox extends StatelessWidget {
  const RateUsDialogBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 500,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                HelperFunctions.rateusPic,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 10),
              const Text(
                'Give Your Opinion',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your opinion matters to us a lot, we\'d love to know how you rate this app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                allowHalfRating: true,
                glowColor: Colors.amberAccent,
                itemSize: 50,
                maxRating: 5,
                itemCount: 5,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  //TODO: Get the rating value from the widget
                },
              ),
              const SizedBox(height: 20),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  CustomButtonSmall(
                    onPressed: () {
                      Get.back();
                    },
                    title: 'Cancel',
                    minWidth: 20,
                  ),
                  const SizedBox(height: 10),
                  CustomButtonSmall(
                    onPressed: () {},
                    minWidth: 20,
                    title: 'Submit',
                    textColor: CustomColor.buttonColor1,
                    buttonColor: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDialogBoxWidget extends StatelessWidget {
  const ProfileDialogBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //TODO: Probably convert this to container instead of simple dialog
      //TODO: Also use the index to know which card is selected
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text(
        'Are you sure you want to Logout!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            CustomButtonSmall(
              minWidth: MediaQuery.of(context).size.width * 0.3,
              onPressed: () async {
                //TODO: Reset all the tab guys
                final userController = Get.put(UserController());
                await userController.userLogout();
                Get.offUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              title: 'Yes',
            ),
            const SizedBox(height: 10),
            CustomButtonSmall(
              minWidth: MediaQuery.of(context).size.width * 0.3,
              onPressed: () {
                Get.back();
              },
              buttonColor: Colors.white,
              textColor: CustomColor.buttonColor1,
              title: 'No',
            ),
          ],
        ),
      ],
    );
  }
}
