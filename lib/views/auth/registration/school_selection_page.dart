import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/data/data_pool.dart';
import 'package:cpp_final_app/views/auth/registration/mobile_auth_page.dart';
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
        title: 'Register yourself',
      ).build(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              DropdownMenu(
                width: MediaQuery.of(context).size.width * 0.8,
                onSelected: (value) {
                  print(value);
                },
                initialSelection: 'Select School',
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
                initialSelection: 'Selet Faculty',
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
                initialSelection: 'Select Department',
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
                initialSelection: 'Select Level',
                dropdownMenuEntries: List.generate(
                  DataPool.schoolList.length,
                  (index) => DropdownMenuEntry(
                    value: DataPool.schoolList[index],
                    label: DataPool.schoolList[index],
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
