import 'dart:io';

import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:cpp_final_app/widgets/profile_pic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //TODO: Get the user details from the controller

  final picker = ImagePicker();
  File? _pickedImage;
  UserController userController = Get.put(UserController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode mailNode = FocusNode();
  FocusNode numberNode = FocusNode();

  @override
  void initState() {
    // nameController.text = userController.username;
    emailController.text = userController.usermail;
    numberController.text = userController.userPhoneNumber;
    //TODO: Init phone number controller
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    nameNode.dispose();
    mailNode.dispose();
    numberNode.dispose();
    super.dispose();
  }

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
                  userController: userController,
                  onChangeImage: () async {
                    final pickedFile = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      _pickedImage = File(pickedFile.path);
                      await userController.updateUserImage(_pickedImage!);
                    }
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                EditProfileTextField(
                  controller: nameController,
                  focusNode: nameNode,
                  icon: SvgPicture.asset(EditProfileIcon.profileIcon),
                  keyboardType: TextInputType.name,
                  hint: userController.username,
                ),
                const SizedBox(height: 20),
                EditProfileTextField(
                  controller: emailController,
                  focusNode: mailNode,
                  icon: SvgPicture.asset(EditProfileIcon.mailIcon),
                  keyboardType: TextInputType.emailAddress,
                  isEditable: false,
                ),
                const SizedBox(height: 20),
                EditProfileTextField(
                  controller: numberController,
                  focusNode: numberNode,
                  icon: SvgPicture.asset(EditProfileIcon.callIcon),
                  keyboardType: TextInputType.phone,
                  isEditable: false,
                ),
                const Spacer(),
                CustomButton(
                  buttonColor: CustomColor.buttonColor1,
                  buttonText: 'Save',
                  onPressed: () async {
                    nameNode.unfocus();
                    mailNode.unfocus();
                    numberNode.unfocus();
                    // if (userController.username != nameController.text) {
                    //   await userController.updateUsername(nameController.text);
                    // }
                    // setState(() {});
                    Get.back();
                  },
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
    required this.focusNode,
    this.isEditable,
    this.hint,
  });

  final TextEditingController controller;
  final Widget icon;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool? isEditable;
  final String? hint;

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
                focusNode: focusNode,
                controller: controller,
                keyboardType: keyboardType,
                onTap: () {
                  focusNode.requestFocus();
                },
                onTapOutside: (_) {
                  focusNode.unfocus();
                },
                maxLines: 1,
                expands: false,
                decoration: InputDecoration(
                  enabled: isEditable ?? true,
                  hintText: hint,
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const UnderlineInputBorder(
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
