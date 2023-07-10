import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Start_page.dart';

import '../NAVBARpages/MainPage.dart';

class Ver22 extends StatelessWidget {
  const Ver22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainPage();
          } else {
            //return LoginOrRegisterPage();
           return StartPG();
          // return HomePage();
          }
        },
      ),
    );
  }
}
