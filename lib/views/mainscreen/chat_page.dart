import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/chat_screen.dart';
import 'package:cpp_final_app/widgets/tab_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final landingPageController = Get.put(LandingPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(landingPageController: landingPageController, title: 'Chats',)
          .build(context),
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
        child: SvgPicture.asset(
          ProfileCustomIcon.editIcon,
          height: 25,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
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
      onTap: () {
        //TODO: Do some computations here to assign the person clicked to..
        //TODO: ..the controller
        Get.to(() => const ChatScreen());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(244, 250, 250, 250),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset.fromDirection(90),
              blurRadius: 10,
              spreadRadius: .1,
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
    this.isUserOnline = false,
  });

  final VoidCallback onTap;
  final bool isUserOnline;
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
                  backgroundColor:
                      isUserOnline ? Colors.green : Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
