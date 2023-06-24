import 'package:flutter/material.dart';

class AuthButtonExternal extends StatelessWidget {
  const AuthButtonExternal({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final Icon icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      elevation: 0,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.grey.shade100,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
