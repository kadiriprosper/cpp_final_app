import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/mainscreen/chat_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: const Text('My Profile'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          titleTextStyle: Theme.of(context)
              .appBarTheme
              .titleTextStyle
              ?.copyWith(fontWeight: FontWeight.bold)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 46,
                child: CircleAvatar(
                  backgroundImage: AssetImage(HelperFunctions.profilePic),
                  radius: 44,
                ),
              ),
              const SizedBox(height: 10),
              //TODO: Get the username
              Text(
                'Leslie Alexander',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //TODO: Edit the username
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
                leadingIcon: Icon(Icons.badge),
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              SettingsButton(
                label: 'My Certification',
                leadingIcon: Icon(Icons.badge),
                onPressed: () {},
              ),
              //TODO: Add the remaining buttons and change the color
              //TODO: Also change all the colors to fill the colors
              const SizedBox(height: 15),
              //TODO: Work on the sign out button functionality
              const SignOutSettingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignOutSettingButton extends StatelessWidget {
  const SignOutSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MaterialButton(
        onPressed: () {},
        height: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: CustomColor.buttonColor1,
          ),
        ),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          'Logout',
          style: TextStyle(
            color: CustomColor.buttonColor1,
          ),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.leadingIcon,
  });

  final String label;
  final VoidCallback onPressed;
  final Icon leadingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset.fromDirection(90),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          leading: leadingIcon,
          title: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
