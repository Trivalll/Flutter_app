import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/VErify_Page_Email.dart';
import 'package:flutter_application_1/Pages/register_page.dart';

class Ver3 extends StatelessWidget {
  const Ver3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return VerifyEmail();
          } else {
            //return LoginOrRegisterPage();
            return RegisterPAges();
          }
        },
      ),
    );
  }
}
