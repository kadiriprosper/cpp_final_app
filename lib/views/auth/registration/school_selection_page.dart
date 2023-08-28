import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/data/data_pool.dart';
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
              DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  print(value);
                },
                initialSelection: DataPool.schoolList.first,
                dropdownMenuEntries: List.generate(
                  DataPool.schoolList.length,
                  (index) => DropdownMenuEntry(
                    value: DataPool.schoolList[index],
                    label: DataPool.schoolList[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  print(value);
                },
                initialSelection: DataPool.facultyList.first,
                dropdownMenuEntries: List.generate(
                  DataPool.facultyList.length,
                  (index) => DropdownMenuEntry(
                    value: DataPool.facultyList[index],
                    label: DataPool.facultyList[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  print(value);
                },
                initialSelection: DataPool.departmentList.first,
                dropdownMenuEntries: List.generate(
                  DataPool.departmentList.length,
                  (index) => DropdownMenuEntry(
                    value: DataPool.departmentList[index],
                    label: DataPool.departmentList[index],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  print(value);
                },
                initialSelection: DataPool.levelList.first,
                dropdownMenuEntries: List.generate(
                  DataPool.levelList.length,
                  (index) => DropdownMenuEntry(
                    value: DataPool.levelList[index],
                    label: DataPool.levelList[index],
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
                onPressed: () => Get.to(() => const MobileAuthPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
