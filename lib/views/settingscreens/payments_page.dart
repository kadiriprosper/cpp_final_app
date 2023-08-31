import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/widgets/custom_app_bar.dart';
import 'package:cpp_final_app/widgets/custom_button.dart';
import 'package:cpp_final_app/widgets/custom_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: 'Payment',
        onBack: () {},
      ).build(context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 100,
          padding: const EdgeInsets.all(15).copyWith(bottom: 20),
          child: Column(
            children: [
              PaymentCard(
                icon: Image.asset(
                  PaymentIcon.paypalIcon,
                  height: 25,
                  filterQuality: FilterQuality.high,
                ),
                title: 'Paypal',
                onPressed: (value) {
                  if (value == 0) {
                    Get.bottomSheet(const PaymentBottomSheet());
                  } else {
                    Get.dialog(
                      const DialogBoxWidget(),
                      barrierColor: Colors.black45,
                    );
                  }
                },
              ),
              const SizedBox(height: 15),
              PaymentCard(
                icon: Image.asset(
                  PaymentIcon.mastercardIcon,
                  height: 25,
                  filterQuality: FilterQuality.high,
                ),
                title: 'Master Card',
                onPressed: (value) {},
              ),
              const SizedBox(height: 15),
              PaymentCard(
                icon: Image.asset(
                  PaymentIcon.visaIcon,
                  height: 25,
                  filterQuality: FilterQuality.high,
                ),
                title: 'Visa',
                onPressed: (value) {},
              ),
              const SizedBox(height: 15),
              PaymentCard(
                icon: Image.asset(
                  PaymentIcon.cashIcon,
                  height: 25,
                  filterQuality: FilterQuality.high,
                ),
                title: 'Cash',
                onPressed: (value) {},
              ),
              const SizedBox(height: 15),
              const Spacer(),
              CustomButton(
                buttonColor: CustomColor.buttonColor1,
                buttonText: 'Add New Card',
                onPressed: () {},
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DialogBoxWidget extends StatelessWidget {
  const DialogBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //TODO: Probably convert this to container instead of simple dialog
      //TODO: Also use the index to know which card is selected
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text(
        'Are you sure you want to delete card!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            CustomButtonSmall(
              onPressed: () {},
              title: 'Yes',
            ),
            CustomButtonSmall(
              onPressed: () {
                Get.back();
              },
              buttonColor: Colors.white,
              textColor: CustomColor.buttonColor1,
              title: 'No',
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final Widget icon;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: onTap,
          //   icon: const Icon(Icons.more_vert_outlined),
          // )
          CustomPopUpMenuButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    super.key,
    this.onPressed,
  });

  final void Function(int)? onPressed;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onSelected: onPressed,
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: 0,
            child: Text(
              'Edit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ];
      },
    );
  }
}
