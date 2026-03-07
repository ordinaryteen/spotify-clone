import 'package:flutter/material.dart';
import 'package:spotify_clone/core/config/app_assets.dart';

class AuthFooter extends StatelessWidget {
  final String bottomText;
  final String bottomActionText;
  final VoidCallback onActionPressed;

  const AuthFooter({
    required this.bottomText,
    required this.bottomActionText,
    required this.onActionPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.grey, thickness: 0.5)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Or', style: TextStyle(color: Colors.grey)),
            ),
            const Expanded(child: Divider(color: Colors.grey, thickness: 0.5)),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googleIcon, width: 30),
            const SizedBox(width: 40),
            Image.asset(AppAssets.appleIcon, width: 30),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(bottomText,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
            TextButton(
              onPressed: onActionPressed,
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, minimumSize: const Size(0, 0)),
              child: Text(bottomActionText,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
            ),
          ],
        ),
      ],
    );
  }
}
