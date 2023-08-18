import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {},
            text: 'Verify Email',
          ),
          CustomButton(
            onTap: () {},
            text: 'Sign Out',
          ),
          CustomButton(
            onTap: () {},
            text: 'Delete Account',
          ),
        ],
      ),
    );
  }
}
