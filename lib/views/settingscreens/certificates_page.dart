import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/global_controller.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalController = Get.put(GlobalController());
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: 'Certification',
        onBack: () {},
      ).build(context),
      body: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        height: MediaQuery.of(context).size.height - 60,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(bottom: 60),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 250,
                          minHeight: 500,
                          maxHeight: 1000,
                          maxWidth: 500,
                        ),
                        child: Image.asset(
                          globalController.userCertificate,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                buttonColor: CustomColor.buttonColor1,
                buttonText: 'Get Certificate',
                onPressed: () async {
                  //TODO: Implement the certificate saving feature,
                },
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
