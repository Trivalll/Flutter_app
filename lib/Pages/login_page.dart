import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NAVBARpages/MainPage.dart';
import 'package:flutter_application_1/components/my_buttons.dart';
import 'package:flutter_application_1/components/square_tile.dart';

import '../components/my_text_fill.dart';

import '../services/auth_service.dart';
import 'ForgetPasswordPage_FOR.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((_) {
          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MainPage();
                                    },
                                  ),
                                );
          Navigator.pop(context);
        }
        
        );
       Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrormessage(e.code);
    }
   
  }

  void showErrormessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlue,
          title: Center(
              child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          )),
        );
      },
    );
     Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 144, 207),
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image:DecorationImage(image:  AssetImage("lib/images/2.png"),
                  fit: BoxFit.cover,),
                  ),
            child: Scaffold(
              backgroundColor: Colors.black45,
              body: Center(
                
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200),
                      //
                     /* Image.asset(
                        "lib/images/image3.png",
                      ),*/
                      
                      //
                      
                      MyTextField(
                        keyboarNum: TextInputType.emailAddress,
                        controller: emailController,
                        //hintText: "Email немесе icloud",
                        hintText: "Email",
                        
                        obscureText: false,
                      ),
                      
                      //
                      const SizedBox(height: 5),
                      
                      //
                      MyTextField(
                        keyboarNum: TextInputType.text,
                        controller: passwordController,
                        hintText: "Құпия сөз",
                        obscureText: true,
                      ),
                      //
                      const SizedBox(height: 5),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ForgetPasswordPage();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Құпия сөзді ұмытып қалдыңызба?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      //
                      
                      const SizedBox(height: 10),
                      MyButton(
                        text: "Кіру",
                        onTap: signIn,
                      ),
                      //
                      const SizedBox(height: 10),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Немесе басқаша жалғастыру',
                                style: TextStyle(color:Colors.white),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 5,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 10),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SquareTile(
                            onTap: () => AuthService().signInWithGoogle(),
                            // imagePath :'lib/images/google.png' ,
                           /* onTap: ()=>Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => chekCon())),*/
                            imagePath: 'lib/images/google.png',
                          ),
                          SizedBox(width: 25),
                          SquareTile(
                            onTap: () {},
                            imagePath: 'lib/images/apple.png',
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Алғаш рет келіп тұрсыз ба?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () => Navigator.of(context)..pushReplacement(FadeRoute(page: Ver3())),
                            child: Text(
                              'Қазір тіркеліңіз',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 235, 124, 207),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )*/
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
