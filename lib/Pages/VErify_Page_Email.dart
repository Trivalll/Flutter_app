import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/onBoarding.dart';

import '../NAVBARpages/MainPage.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({
    super.key,
  });

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool canResendEmail = false;
  bool isEmailVer = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVer = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVer) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVer(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVer() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVer = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVer) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true,);
    } catch (e) {
      print(e.toString());
    }
  }
final currentUser=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => isEmailVer
      ? MainPage()
      : Scaffold(
          appBar: AppBar(
            backgroundColor:Color.fromARGB(255, 211, 90, 181),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () => Navigator.pop(context, false),
            ),
            title: Text(
              "ЭЛ.Тексеру",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Сіздің эл.почтаңызға хат жіберілді',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(
                    Icons.email,
                    size: 32,
                  ),
                  label: Text(
                    'Хатты қайтадан жіберу',
                    style: TextStyle(fontSize: 24,color: Color.fromARGB(255, 211, 90, 181)),
                  ),
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                ),
                SizedBox(height: 8),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text(
                      'Отмена',
                      style: TextStyle(fontSize: 24,color: Color.fromARGB(255, 211, 90, 181)),
                    ),
                    onPressed: () => {
                        //  FirebaseAuth.instance.signOut(),
                         
                         FirebaseFirestore.instance.collection('users').doc(currentUser.email).delete().then((value) => FirebaseAuth.instance.currentUser?.delete(),),
                           
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ONboardingPage()))
                        })
              ],
            ),
          ));
}
