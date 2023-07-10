import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/Pages/VErify_Page_Email.dart';
import 'package:flutter_application_1/Pages/onBoarding.dart';


class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return VerifyEmail();
          } else {
            // return Ver22();
            return ONboardingPage();
          }
        },
      ),
    );
  }
}
