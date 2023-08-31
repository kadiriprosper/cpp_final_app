import 'package:cpp_final_app/data/dummy_data.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/models/message_model.dart';
import 'package:cpp_final_app/views/mainscreen/chat_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        hasLeading: true,
        titleWidget: Row(
          children: [
            UserChatIcon(
              onTap: () {},
              imagePath: HelperFunctions.profilePic,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: Get the username from the controller
                Text(
                  'Jane Cooper',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 5),
                    //TODO: Get to see if the user is online
                    Text(
                      'Online',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              //TODO: Write code to allow calls
            },
            icon: const Icon(Icons.phone_outlined),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {
              //TODO: Write code to allow calls
            },
            icon: const Icon(Icons.video_call_outlined),
          ),
        ],
      ).build(context),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final messageData = MessageModel.fromMap(messages[index]!);
                  return Column(
                    crossAxisAlignment: messageData.sender == 1
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 1.5,
                        ),
                        decoration: BoxDecoration(
                          color: messageData.sender == 1
                              ? const Color.fromARGB(255, 255, 222, 233)
                              : const Color.fromARGB(255, 174, 219, 255),
                          borderRadius: BorderRadius.circular(15).copyWith(
                            bottomLeft: messageData.sender == 1
                                ? const Radius.circular(0)
                                : const Radius.circular(15),
                            bottomRight: messageData.sender == 1
                                ? const Radius.circular(15)
                                : const Radius.circular(0),
                          ),
                        ),
                        child: Text(messageData.message),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: messageData.sender == 0
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Text(
                              messageData.timeSent,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(width: 5),
                            messageData.sender == 0
                                //TODO: Put if the chat has been read
                                ? const Icon(
                                    Icons.mark_chat_read,
                                    size: 14,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 20,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: 'Enter Message',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      //TODO:Write code to verify that message is not empty..
                      //TODO: .. and sends it
                      setState(() {
                        if (controller.text.isNotEmpty) {
                          messages[messages.length] = {
                            'sender': '0',
                            'message': controller.text,
                            'time sent': DateTime.now().toString(),
                          };
                        }
                      });
                      controller.clear();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
