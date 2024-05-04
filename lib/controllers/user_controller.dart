import 'dart:io';

import 'package:cpp_final_app/auth/auth.dart';
import 'package:cpp_final_app/helpers/image_downloader.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:cpp_final_app/views/auth/registration/verification_page.dart';
import 'package:cpp_final_app/views/loading_screen.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pinput/pinput.dart';

class UserController extends GetxController {
  Auth auth = Auth();
  RxString otpCode = ''.obs;  
  String phoneNumber = '';
  Rx<String> profileImageUrl = ''.obs;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final secureStorage = const FlutterSecureStorage();

  get username =>    auth.username;
  

  get usermail => auth.usermail;

  get userPhoneNumber => auth.firebaseAuth.currentUser?.phoneNumber ?? 'null';

  String get getProfileImageUrl => profileImageUrl.value;

  // String? _getImage() {
  //   return auth.userImage;
  // }

  // Future<void> verifyPhoneNumber(
  //     String tempPhoneNumber, BuildContext context) async {
  //   phoneNumber = tempPhoneNumber;
  //   LoadingScreen.loadPage(
  //     computation: Future(
  //       () async => await auth.firebaseAuth.verifyPhoneNumber(
  //         phoneNumber: tempPhoneNumber,
  //         verificationCompleted: (phoneAuthCredential) async {},
  //         verificationFailed: (error) {
  //           Get.snackbar(
  //             'Verification Failed',
  //             error.code + (error.message ?? ''),
  //             // 'Unable to register your phone number right now, Please check the number and try again',
  //             colorText: Colors.white,
  //             backgroundColor: Colors.red,
  //             duration: const Duration(seconds: 4),
  //           );
  //         },
  //         codeSent: (verificationId, forceResendingToken) async {
  //           await Get.bottomSheet(
  //             const OTPBottomSheet(),
  //           );
  //           String smsCode = otpCode.value;
  //           print('error $smsCode');

  //           if (smsCode.isNotEmpty) {
  //             PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //               verificationId: verificationId,
  //               smsCode: smsCode,
  //             );
  //             await auth.firebaseAuth.currentUser
  //                 ?.linkWithCredential(credential);
  //           }
  //           Get.dialog(
  //             const Dialog(
  //               insetPadding: EdgeInsets.symmetric(
  //                 horizontal: 25,
  //                 vertical: 20,
  //               ),
  //               backgroundColor: Colors.transparent,
  //               child: AuthDialogBox(),
  //             ),
  //           );
  //         },
  //         codeAutoRetrievalTimeout: (verificationId) {},
  //         timeout: const Duration(seconds: 60),
  //       ),
  //     ),
  //   );
  // }

  Future<void> updateUsername(String newUserName) async {
    try {
      Get.showOverlay(
        asyncFunction: () async {
          await auth.firebaseAuth.currentUser!.updateDisplayName(newUserName);
        },
        loadingWidget: const SpinKitPianoWave(
          color: Colors.grey,
          size: 15,
        ),
      );
    } catch (e) {
      print(e);
      //TODO: Show a snackbar that tells uploading is failed
    }
  }

  Future<void> userLogin(String email, String password, Widget toPage) async {
    final response = await auth.userLoginWithEmail(email, password);
    if (response.entries.first.key == AuthStatusEnum.success) {
      profileImageUrl.value = auth.firebaseAuth.currentUser!.photoURL!;
      secureStorage.write(key: 'email', value: email);
      secureStorage.write(key: 'password', value: password);
    }
    // _getProfileImage(imageUrl: _getImage());
    processFunction(response, toPage);
  }

  Future<void> userRegistration(
      String email, String password, String name, Widget toPage) async {
    final response = await auth.userRegistration(
      email: email,
      name: name,
      password: password,
    );
    // _getProfileImage(imageUrl: _getImage());
    if (response.entries.first.key == AuthStatusEnum.success) {
      await auth.firebaseAuth.currentUser?.updatePhotoURL(
          'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
      profileImageUrl.value = auth.firebaseAuth.currentUser!.photoURL!;
      print(profileImageUrl.value);
      secureStorage.write(key: 'email', value: email);
      secureStorage.write(key: 'password', value: password);
    }
    processFunction(response, toPage);
  }

  // Future<void> _getProfileImage({String? imageUrl}) async {
  //   imageUrl ??=
  //       'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  //   ImageManager imgManager = ImageManager();
  //   var result = await imgManager.imageDownloader(imageUrl);
  //   profileImagePath.value = result.entries.elementAt(0).key
  //       ? result.entries.elementAt(0).value ?? ''
  //       : '';
  // }

  Future<void> updateUserImage(File imageFile) async {
    final storageRef = firebaseStorage.ref('profile_pictures');

    try {
      Get.showOverlay(
        asyncFunction: () async {
          final photoUrl = await storageRef.putFile(imageFile);
          await auth.updateUserImage(await photoUrl.ref.getDownloadURL());
          profileImageUrl.value = auth.firebaseAuth.currentUser!.photoURL!;
        },
        loadingWidget: const SpinKitPianoWave(
          color: Colors.grey,
          size: 15,
        ),
      );

      print('success');
    } catch (e) {
      print(e);
      //TODO: Show a snackbar that tells uploading is failed
    }
  }

  Future<void> sendPasswordResetMail(String email, Widget toPage) async {
    final response = await auth.sendPasswordResetMail(
      email: email,
    );
    processFunction(response, toPage);
  }

  Future<void> resetPassword(
      String code, String newPassword, Widget toPage) async {
    final response = await auth.resetPassword(
      code: code,
      newPassword: newPassword,
    );
    processFunction(response, toPage);
  }

  Future<void> userLogout() async {
    await secureStorage.delete(key: 'email');
    await secureStorage.delete(key: 'password');
    await auth.userLogout();
  }

  Future<void> deleteUserAccount() async {
    await secureStorage.delete(key: 'email');
    await secureStorage.delete(key: 'password');
    await auth.deleteAccount();
  }

  // Future<String> setProfilePicture(String path) async{

  // }

  //TODO: Possibly take this guy to helper function
  void processFunction(
      Map<AuthStatusEnum, String> response, Widget toPage) async {
    if (response.entries.first.key == AuthStatusEnum.success) {
      Get.offUntil(
        MaterialPageRoute(
          builder: (context) => toPage,
        ),
        (route) => false,
      );
    } else {
      Get.snackbar(
        'Error',
        response.entries.first.value,
        animationDuration: const Duration(seconds: 3),
        backgroundColor: Colors.red.shade300,
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
      );
    }
  }
}

//TODO: Refactor the widget

class OTPBottomSheet extends StatefulWidget {
  const OTPBottomSheet({
    super.key,
  });

  @override
  State<OTPBottomSheet> createState() => _OTPBottomSheetState();
}

class _OTPBottomSheetState extends State<OTPBottomSheet> {
  TextEditingController inputController = TextEditingController();
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
            .copyWith(bottom: 0),
        child: Column(
          children: [
            const Text(
              'Verification',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Enter the code sent to ${userController.phoneNumber}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 25),
            const Spacer(),
            //TODO: How to autofill from message
            //TODO: Update the input fields with the correct plugin
            Pinput(
              controller: inputController,
              length: 6,
              onCompleted: (value) => print(value),
            ),
            // const SizedBox(height: 26),
            const Spacer(),
            AuthButton(
              title: 'Confirm',
              onPressed: () {
                if (inputController.text.length == 6) {
                  userController.otpCode.value = inputController.text;

                  Get.back();
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
