import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/db_controller.dart';
import 'package:cpp_final_app/controllers/user_controller.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:cpp_final_app/views/auth/registration/mobile_auth_page.dart';
import 'package:cpp_final_app/views/loading_screen.dart';
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
  final matNoController = TextEditingController();
  int facultyIndex = 0;
  Map<String, dynamic> facultyList = {};
  GlobalKey<FormFieldState> formFieldKey = GlobalKey();
  List<bool> stepList = [
    false,
    false,
    false,
    false,
  ];
  String selectedSchool = '';
  String selectedLevel = '';
  String selectedDepartment = '';
  String selectedFaculty = '';

  @override
  void dispose() {
    facultyList = dbController.getData('Faculty');
    matNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(
      //   hasLeading: true,
      // ).build(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30)
              .copyWith(bottom: 0),
          child: SingleChildScrollView(
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
                    //TODO: Learn how to use the error text for dropdown menu
                    onSelected: (value) async {
                      if (value != null && value.isNotEmpty) {
                        facultyList = await dbController.getData('Faculty');
                        setState(() {
                          selectedSchool = value;
                          stepList[0] = true;
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
                  stepList[0]
                      ? DropdownMenu<String>(
                          width: MediaQuery.of(context).size.width * 0.8,
                          onSelected: (value) {
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                selectedFaculty = value;
                                stepList[1] = true;
                              });
                            }
                          },
                          initialSelection: facultyList.entries.last.key,
                          dropdownMenuEntries: List.generate(
                            facultyList.length,
                            (index) => DropdownMenuEntry(
                              value: facultyList.entries.elementAt(index).key,
                              label: facultyList.entries.elementAt(index).key,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 25),
                  stepList[1]
                      ? DropdownMenu<String>(
                          width: MediaQuery.of(context).size.width * 0.8,
                          onSelected: (value) {
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                selectedDepartment = value;
                                stepList[2] = true;
                              });
                            }
                          },
                          initialSelection:
                              (facultyList[selectedFaculty]).first,
                          dropdownMenuEntries: List.generate(
                            facultyList[selectedFaculty].length,
                            (index) => DropdownMenuEntry(
                              value: facultyList[selectedFaculty][index],
                              label: facultyList[selectedFaculty][index],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 25),
                  stepList[2]
                      ? DropdownMenu<String>(
                          width: MediaQuery.of(context).size.width * 0.8,
                          onSelected: (value) {
                            if (value != null && value.isNotEmpty) {
                              setState(() {
                                selectedLevel = value;
                                stepList[3] = true;
                              });
                            }
                          },
                          initialSelection:
                              dbController.getData('levels').first,
                          dropdownMenuEntries: List.generate(
                            dbController.getData('levels').length,
                            (index) => DropdownMenuEntry(
                              value: dbController.getData('levels')[index],
                              label: dbController.getData('levels')[index],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 25),
                  stepList[3]
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            key: formFieldKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != null && value.length > 5) {
                                return null;
                              }
                              return 'Input a valid mat. no';
                            },
                            controller: matNoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: const Text('Mat Number'),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 50),
                  CustomButton(
                    buttonColor: CustomColor.buttonColor1,
                    buttonText: 'Continue',
                    textColor: Colors.white,
                    onPressed: () async {
                      //TODO: Test this feature
                      bool inputState = true;
                      for (var element in stepList) {
                        inputState &= element;
                      }
                      if (formFieldKey.currentState?.validate() == true &&
                          inputState) {
                        LoadingScreen.loadPage(
                          computation: registerUser(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    var response = await dbController.storeUserData(userController.usermail, {
      'username': userController.username,
      'school': selectedSchool,
      'faculty': selectedFaculty,
      'department': selectedDepartment,
      'level': selectedLevel,
      'mat_no': matNoController.text,
    });
    if (response.keys.first == AuthStatusEnum.failed) {
      //TODO: Handle showing error here
      print('error1');
    } else {
      Get.to(() => const MobileAuthPage());
    }
  }
}
