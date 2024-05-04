// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:cpp_final_app/controllers/user_controller.dart';
// import 'package:cpp_final_app/views/auth/registration/verification_page.dart';
// import 'package:cpp_final_app/widgets/auth_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MobileAuthPage extends StatefulWidget {
//   const MobileAuthPage({super.key});

//   @override
//   State<MobileAuthPage> createState() => _MobileAuthPageState();
// }

// class _MobileAuthPageState extends State<MobileAuthPage> {
//   String countryCode = '+234';
//   String number = '';
//   final mobileController = TextEditingController();
//   UserController userController = Get.put(UserController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               const SizedBox(height: 15),
//               const Text(
//                 'Enter your phone number',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               const Text(
//                 'You will receive 4 digits number to verified number',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.shade400,
//                     width: 1.5,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 3,
//                       child: CountryCodePicker(
//                         onChanged: (value) {
//                           countryCode = value.toString();
//                         },
//                         initialSelection: 'NG',
//                         padding: EdgeInsets.zero,
//                         showCountryOnly: false,
//                         showDropDownButton: true,
//                         alignLeft: false,
//                       ),
//                     ),
//                     //TODO: Change this to credit card controller
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2,
//                       child: TextField(
//                         controller: mobileController,
//                         keyboardType: TextInputType.phone,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         decoration: const InputDecoration(
//                           hintText: 'Phone Number',
//                           hintStyle: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               AuthButton(
//                 title: 'Continue',
//                 onPressed: () async {
//                   number = countryCode + mobileController.text;
//                   if (number.length > 5) {
//                     await userController.verifyPhoneNumber(number, context);
//                     userController.phoneNumber = number;
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
