import 'package:cpp_final_app/cpp_icons_icons.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            HomeHeaderWidget(
              profilePic: HelperFunctions.profilePic,
              username: 'Kelvin',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.profilePic,
    required this.username,
  });

  final String profilePic;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          //TODO: Is this profile pic clickable?
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 29,
              //TODO: Change the image to the profile pic
              backgroundImage: AssetImage(profilePic),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          //TODO: Fetch the username from backend
          Text(
            'Welcome, $username',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
