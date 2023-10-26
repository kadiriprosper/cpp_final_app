import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/db_controller.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/data/data_pool.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:cpp_final_app/views/auth/registration/mobile_auth_page.dart';
import 'package:cpp_final_app/widgets/auth_button.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchoolSelectionPage extends StatefulWidget {
  const SchoolSelectionPage({super.key});

  @override
  State<SchoolSelectionPage> createState() => _SchoolSelectionPageState();
}

class _SchoolSelectionPageState extends State<SchoolSelectionPage> {
  final dbController = Get.put(DataController());
  final userController = Get.put(UserController());
  String selectedSchool = '';
  String selectedLevel = '';
  String selectedDepartment = '';
  String selectedFaculty = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasLeading: true,
      ).build(context),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Text(
                'Register Yourself',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 25),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  if (value != null && value.isNotEmpty) {
                    setState(() {
                      selectedSchool = value;
                    });
                  }
                },
                initialSelection: dbController.getData('schools').first,
                dropdownMenuEntries: List.generate(
                  dbController.getData('schools').length,
                  (index) => DropdownMenuEntry(
                    value: dbController.getData('schools')[index],
                    label: dbController.getData('schools')[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  if (value != null && value.isNotEmpty) {
                    setState(() {
                      selectedFaculty = value;
                    });
                  }
                },
                initialSelection: dbController.getData('faculty').first,
                dropdownMenuEntries: List.generate(
                  dbController.getData('faculty').length,
                  (index) => DropdownMenuEntry(
                    value: dbController.getData('faculty')[index],
                    label: dbController.getData('faculty')[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  if (value != null && value.isNotEmpty) {
                    setState(() {
                      selectedDepartment = value;
                    });
                  }
                },
                initialSelection: dbController.getData('departments').first,
                dropdownMenuEntries: List.generate(
                  dbController.getData('departments').length,
                  (index) => DropdownMenuEntry(
                    value: dbController.getData('departments')[index],
                    label: dbController.getData('departments')[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownMenu<String>(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  if (value != null && value.isNotEmpty) {
                    setState(() {
                      selectedLevel = value;
                    });
                  }
                },
                initialSelection: dbController.getData('levels').first,
                dropdownMenuEntries: List.generate(
                  dbController.getData('levels').length,
                  (index) => DropdownMenuEntry(
                    value: dbController.getData('levels')[index],
                    label: dbController.getData('levels')[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  // controller: take the iniput here,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('Mat Number'),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                buttonColor: CustomColor.buttonColor1,
                buttonText: 'Continue',
                textColor: Colors.white,
                onPressed: () async {
                  if (selectedDepartment.isNotEmpty) {
                    if (selectedFaculty.isNotEmpty) {
                      if (selectedLevel.isNotEmpty) {
                        if (selectedSchool.isNotEmpty) {
                          var response = await dbController
                              .storeUserData(userController.usermail, {
                                'username': userController.username,
                            'school': selectedSchool,
                            'faculty': selectedFaculty,
                            'department': selectedDepartment,
                            'level': selectedLevel,
                          });
                          if (response.keys.first == AuthStatusEnum.failed) {
                            //TODO: Handle showing error here
                            print('error1');
                          } else {
                            Get.to(() => const MobileAuthPage());
                          }
                        } else {
                          //TODO: Handle showing error here
                          print('error2');
                        }
                      } else {
                        //TODO: Handle showing error here
                        print('error3');
                      }
                    } else {
                      //TODO: Handle showing error here
                      print('error4');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
