import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:cpp_final_app/widgets/profile_pic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //TODO: Get the user details from the controller

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: 'Edit Profile',
        onBack: () {
          Get.back();
        },
      ).build(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20),
            height: MediaQuery.of(context).size.height * .85,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfilePicWidget(
                  isEditable: true,
                  onChangeImage: () {},
                ),
                const SizedBox(height: 20),
                EditProfileTextField(
                  controller: nameController,
                  icon: SvgPicture.asset(EditProfileIcon.profileIcon),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 20),
                EditProfileTextField(
                  controller: emailController,
                  icon: SvgPicture.asset(EditProfileIcon.mailIcon),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                EditProfileTextField(
                  controller: numberController,
                  icon: SvgPicture.asset(EditProfileIcon.callIcon),
                  keyboardType: TextInputType.phone,
                ),
                const Spacer(),
                CustomButton(
                  buttonColor: CustomColor.buttonColor1,
                  buttonText: 'Save',
                  onPressed: () {},
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final Widget icon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset.fromDirection(90),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                maxLines: 1,
                expands: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
