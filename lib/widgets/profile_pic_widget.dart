import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({
    super.key,
    this.onChangeImage,
    required this.userController,
    required this.isEditable,
  });

  final VoidCallback? onChangeImage;
  final bool isEditable;
  final UserController userController;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 46,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 44,
            child: Obx(
              () => Container(
                // borderRadius: BorderRadius.circular(46),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        userController.getProfileImageUrl,                        
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // backgroundImage:imagePath == null ? AssetImage(HelperFunctions.profilePic): ,
            
          ),
          isEditable
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: onChangeImage,
                    child: const CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 18,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
