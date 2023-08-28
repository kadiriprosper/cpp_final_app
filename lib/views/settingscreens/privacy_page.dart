import 'package:cpp_final_app/controllers/global_controller.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final globalController = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: 'Privacy Policy',
        onBack: () {},
      ).build(context),
      body: Padding(
        padding: const EdgeInsets.all(10).copyWith(top: 0, bottom: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            
            children: [
              const SizedBox(height: 10),
              const Text(
                'PRIVACY POLICY FOR C/C++ PROGRAMMING MOBILE APP\n',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'This Privacy Policy outlines the types of data we collect from you and how we use and safeguard that data.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 15),
              ListView.separated(
                itemCount: globalController.privacyPolicyData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final policyPool = globalController.privacyPolicyData;
                  return PrivacyPolicyTextSegment(
                    index: index,
                    title: policyPool[index]!['title'] as String? ?? '',
                    text: policyString(
                        policyPool[index]!['body'] as List<String>?,
                        policyPool[index]!['heading'] as String),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  policyString(List<String>? list, String body) {
    return '''
        $body\n\n${list != null ? list.toString().replaceAll(RegExp(r'\[|\]'), '').replaceAll('-', '\n\n•').replaceAll('.,', '.') //⚈
            .trim() : ''}
        '''
        .trim();
  }
}

class PrivacyPolicyTextSegment extends StatelessWidget {
  const PrivacyPolicyTextSegment({
    super.key,
    required this.title,
    required this.text,
    required this.index,
  });

  final String title;
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1}. $title\n',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
