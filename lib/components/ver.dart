import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/NAVBARpages/MainPage.dart';
import 'package:flutter_application_1/Pages/login_page.dart';

class Ver extends StatelessWidget {
  const Ver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return VerifyEmail();
            return MainPage();
          } else {
            //return LoginOrRegisterPage();
            return LoginPage();
          }
        },
      ),
    );
  }
}
