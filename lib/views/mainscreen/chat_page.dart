import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                //TODO: Put the controller
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
                    color: CustomColor.buttonColor1,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              //TODO: Get the users from the provider
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserChatIcon(
                    onTap: () {},
                    imagePath: HelperFunctions.userIcons[0],
                  ),
                  UserChatIcon(
                    onTap: () {},
                    imagePath: HelperFunctions.userIcons[1],
                  ),
                  UserChatIcon(
                    onTap: () {},
                    imagePath: HelperFunctions.userIcons[2],
                  ),
                  UserChatIcon(
                    onTap: () {},
                    imagePath: HelperFunctions.userIcons[3],
                  ),
                  UserChatIcon(
                    onTap: () {},
                    imagePath: HelperFunctions.userIcons[4],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //TODO: Get all the user chats here and populate the page
            UserChatCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Go to the select user for chat
        },
        //TODO: Get the icon from the ux designer
        backgroundColor: CustomColor.buttonColor1,
        child: const Icon(Icons.create),
      ),
    );
  }
}

class UserChatCard extends StatelessWidget {
  const UserChatCard({
    super.key,
  });

  //TODO: All colors would be changed

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //TODO: Link the route to the next page
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 198, 229, 255),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset.fromDirection(90),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        height: 70,
        width: double.infinity,
        child: Center(
          child: ListTile(
            leading: UserChatIcon(
              //TODO: ON click on the user chat
              onTap: () {},
              imagePath: HelperFunctions.userIcons[0],
            ),
            title: Text(
              //TODO: Get the username
              'Jane Cooper',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              //TODO: get the last message here
              //TODO: Change the color here
              'Jane Cooper!',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TODO: Since the messages are gotten, get the time of the..
                //TODO: ..last message in 24hrs
                Text(
                  '11:15',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                Container(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: CustomColor.buttonColor1,
                  ),
                  padding: const EdgeInsets.all(3),
                  constraints: BoxConstraints(
                    maxHeight: 25,
                    maxWidth: 25,
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserChatIcon extends StatelessWidget {
  const UserChatIcon({
    super.key,
    required this.onTap,
    required this.imagePath,
  });

  final VoidCallback onTap;
  //TODO: Technically, get the user info model (provider) and get the image
  //TODO: might even remove the voidcallback property and do all the calculations inside
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        //TODO: Write the code to take the user to the chat
        onTap: onTap,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 23,
                onBackgroundImageError: (exception, stackTrace) =>
                    const Icon(Icons.error_outline),
                //TODO: Get the user's profile image
                backgroundImage: AssetImage(
                  imagePath,
                ),
              ),
              //TODO: Check to see if the user is online
              Positioned(
                bottom: 1,
                right: 1,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
