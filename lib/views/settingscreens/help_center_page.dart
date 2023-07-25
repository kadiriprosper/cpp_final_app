import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/mainscreen/courses_page.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/faq_expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(90),
                      blurRadius: 10,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ButtonBar(
                  buttonPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 5,
                  ),
                  alignment: MainAxisAlignment.center,
                  children: [
                    StatusButton(
                      isSelected: isFaqSelected,
                      label: 'FAQ',
                      onPressed: () {
                        setState(() {
                          isFaqSelected = true;
                        });
                      },
                    ),
                    StatusButton(
                      isSelected: !isFaqSelected,
                      label: 'Contact Us',
                      onPressed: () {
                        setState(() {
                          isFaqSelected = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              isFaqSelected ? FAQPage() : ContactUsPage(),
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
          onPressed: () {},
          icon: SvgPicture.asset(ContactIcon.customerServiceIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Website',
          onPressed: () {},
          icon: SvgPicture.asset(ContactIcon.websiteIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Whatsapp',
          onPressed: () {},
          icon: SvgPicture.asset(ContactIcon.whatsappIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Facebook',
          onPressed: () {},
          icon: SvgPicture.asset(ContactIcon.facebookIcon),
        ),
        const SizedBox(height: 10),
        ContactUsButton(
          title: 'Instagram',
          onPressed: () {},
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
    return InkWell(
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
    );
  }
}

class FAQPage extends StatelessWidget {
  const FAQPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FAQExpansionWidget(
          title: 'What is learn management',
          text: 'Hello world this is an expansion tile',
        ),
        const SizedBox(height: 10),
        const FAQExpansionWidget(
          title: 'What is learn management',
          text: 'Hello world this is an expansion tile',
        ),
      ],
    );
  }
}

