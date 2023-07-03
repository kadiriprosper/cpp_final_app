import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:cpp_final_app/widgets/profile_pic_widget.dart';
import 'package:flutter/material.dart';

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
        onBack: () {},
      ).build(context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfilePicWidget(
                isEditable: true,
                onChangeImage: () {},
              ),
              const SizedBox(height: 20),
              EditProfileTextField(
                controller: nameController,
                icon: Icons.person_2_rounded,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              EditProfileTextField(
                controller: emailController,
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              EditProfileTextField(
                controller: numberController,
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const Spacer(),
              CustomButton(
                buttonColor: CustomColor.buttonColor1,
                buttonText: 'Save',
                onPressed: () {},
                textColor: Colors.white,
              ),
              const SizedBox(height: 20),
            ],
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
  final IconData icon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}