import 'package:cpp_final_app/controllers/global_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/faq_expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

const customerServiceNumber = '+2348156622466';
const website = 'https://bit.ly/CppProgramming';
const whatsappLink = 'https://wa.link/tc2x9b';
const facebookLink = 'https://facebook.com/cppprogrammin';
const instagramLink = 'https://instagram.com/ccppprogramming';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  bool isFaqSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: 'Help Center',
        onBack: () {},
      ).build(context),
      body: SizedBox(
        // margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10)
                    .copyWith(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(90),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  // spacing: 5,
                  // alignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: StatusButton(
                        isSelected: isFaqSelected,
                        label: 'FAQ',
                        onPressed: () {
                          setState(() {
                            isFaqSelected = true;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: StatusButton(
                        isSelected: !isFaqSelected,
                        label: 'Contact Us',
                        onPressed: () {
                          setState(() {
                            isFaqSelected = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              isFaqSelected ? const FAQPage() : const ContactUsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactUsButton(
          title: 'Customer Service',
          onPressed: () async {
            final Uri url = Uri.parse('tel:$customerServiceNumber');
            if (!await launchUrl(url)) {
              Get.showSnackbar(
                const GetSnackBar(
                  title: 'Number could not be dialed',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          icon: SvgPicture.asset(ContactIcon.customerServiceIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Website',
          onPressed: () async {
            final Uri url = Uri.parse(website);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              Get.showSnackbar(
                const GetSnackBar(
                  title: 'Url could not be launched',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          icon: SvgPicture.asset(ContactIcon.websiteIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Whatsapp',
          onPressed: () async {
            final Uri url = Uri.parse(whatsappLink);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              Get.showSnackbar(
                const GetSnackBar(
                  title: 'Url could not be launched',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          icon: SvgPicture.asset(ContactIcon.whatsappIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Facebook',
          onPressed: () async {
            final Uri url = Uri.parse(facebookLink);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              Get.showSnackbar(
                const GetSnackBar(
                  title: 'Url could not be launched',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          icon: SvgPicture.asset(ContactIcon.facebookIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Instagram',
          onPressed: () async {
            final Uri url = Uri.parse(instagramLink);
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              Get.showSnackbar(
                const GetSnackBar(
                  title: 'Url could not be launched',
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          icon: SvgPicture.asset(ContactIcon.instagramIcon),
        ),
      ],
    );
  }
}

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
  });

  final VoidCallback onPressed;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset.fromDirection(90),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQPage extends StatelessWidget {
  const FAQPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = Get.put(ScrollController());
    final globalController = Get.put(GlobalController());
    return ListView.builder(
      controller: scrollController,
      itemCount: globalController.helpCenterData.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final faqPool = globalController.helpCenterData;
        return FAQExpansionWidget(
          title: faqPool[index]!['title'] as String,
          text: faqbody(faqPool[index]?['bullet'] as List<String>?,
              faqPool[index]!['body'] as String),
        );
      },
    );
  }

  faqbody(List<String>? list, String body) {
    return '''
        $body\n${list != null ? list.toString().replaceAll(RegExp(r'\[|\]'), '').replaceAll('-', '\n -').trim() : ''}
        '''
        .trim();
  }
}
