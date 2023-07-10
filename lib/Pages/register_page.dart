

  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter_application_1/components/my_buttons.dart';
  import 'package:flutter_application_1/components/square_tile.dart';

  import 'package:flutter_application_1/services/auth_service.dart';

  import '../components/my_text_fill.dart';
import 'VErify_Page_Email.dart';

  class RegisterPAges extends StatefulWidget {
    const RegisterPAges({
      super.key,
    });

    @override
    State<RegisterPAges> createState() => _RegisterPAgesState();
  }

  class _RegisterPAgesState extends State<RegisterPAges> {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final AgeController = TextEditingController();
    final NameController = TextEditingController();

    @override
    void dispose() {
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
      AgeController.dispose();
      NameController.dispose();
    }

    void signInup() async {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      try {
        if (passwordController.text == confirmPasswordController.text) {
          UserCredential userCredential=
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          //
        
            FirebaseFirestore.instance.collection('users').doc(userCredential.user!.email).set({
            'Аты': NameController.text.trim(),
            'Жасы': AgeController.text.trim().toString(),
            'email':emailController.text.trim(),
            'groups':[],
            'uid':userCredential.user?.uid,
          }).then((_) {
          Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => VerifyEmail()));
          }
          );
          
        } 
        
      
        
        else {
          showErrormessage('Құпия сөздер сәйкес емес');
        }
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
                  image:DecorationImage(image:  AssetImage("lib/images/3.png"),
                  fit: BoxFit.cover,),
                  ),
              child: Scaffold(
                 backgroundColor: Colors.black45,
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 25),
                        //
                       // Image.asset("lib/images/image2.png", width: 300, height: 200),
                          
                        //
                        MyTextField(
                          keyboarNum: TextInputType.emailAddress,
                          controller: NameController,
                          //hintText: "Email немесе icloud",
                          hintText: "Аты",
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          keyboarNum: TextInputType.emailAddress,
                          controller: AgeController,
                          //hintText: "Email немесе icloud",
                          hintText: "Жасы",
                          obscureText: false,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          keyboarNum: TextInputType.emailAddress,
                          controller: emailController,
                          //hintText: "Email немесе icloud",
                          hintText: "Email",
                          obscureText: false,
                        ),
                          
                        //
                        const SizedBox(height: 10),
                          
                        //
                        MyTextField(
                          keyboarNum: TextInputType.text,
                          controller: passwordController,
                          hintText: "Құпия сөз",
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        MyTextField(
                          keyboarNum: TextInputType.text,
                          controller: confirmPasswordController,
                          hintText: "Құпия сөзді қайталаңыз",
                          obscureText: true,
                        ),
                        //
                          
                        //
                          
                        //
                          
                        const SizedBox(height: 15),
                        MyButton(
                          text: "Тіркелу",
                          onTap: signInup,
                        ),
                        //
                        const SizedBox(height: 8),
                        //
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 5,
                                  color:  Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  'Немесе басқаша жалғастырыңыз',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 5,
                                  color: Colors.grey[400],
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
                              imagePath: 'lib/images/google.png',
                            ),
                            SizedBox(width: 25),
                            SquareTile(
                              onTap: () {},
                              imagePath: 'lib/images/apple.png',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Аккаунтыңыз бар ма?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () => Navigator.of(context)..pushReplacement(FadeRoute(page: LoginPage())),
                              child: Text(
                                'Қазір кіріңіз',
                                style: TextStyle(
                                    color: Colors.deepPurple,
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
