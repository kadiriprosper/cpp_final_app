import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({
    super.key,
    this.onChangeImage,
    required this.isEditable,
  });

  final VoidCallback? onChangeImage;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 46,
      child: Stack(
        children: [
          CircleAvatar(
            //TODO: Change the path to the provider profile pic
            backgroundImage: AssetImage(HelperFunctions.profilePic),
            radius: 44,
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
