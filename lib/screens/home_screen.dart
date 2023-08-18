import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/firebase_auth_methods.dart';
import 'package:flutter_firebase_auth/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(user.providerData[0].providerId),
          if (user.phoneNumber != null) Text(user.phoneNumber!),
          Text(user.uid),
          if (!user.emailVerified && !user.isAnonymous)
            CustomButton(
              onTap: () {
                context
                    .read<FirebaseAuthMethods>()
                    .sendEmailVerification(context);
              },
              text: "Verify Email",
            ),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context);
            },
            text: 'Sign Out',
          ),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().deleteAccount(context);
            },
            text: 'Delete Account',
          ),
        ],
      ),
    );
  }
}
