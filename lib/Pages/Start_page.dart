import 'package:flutter/material.dart';



class StartPG extends StatefulWidget {
  const StartPG({super.key});

  @override
  State<StartPG> createState() => _StartPGState();
}

class _StartPGState extends State<StartPG> {
  @override
  Widget build(BuildContext context) {
   /* var myButton = MyButton(
        text: "Бастау",
        onTap: () {
          Navigator.of(context)
              .pushReplacement(FadeRoute(page:  Ver()));
        });*/
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 228, 144, 207),
      body: SafeArea(
        
        child: Container(
          
            decoration: BoxDecoration(
              
                  image:DecorationImage(image:  AssetImage("lib/images/1.png",),
                  fit: BoxFit.cover,),
                  ),
          child: Scaffold(
             backgroundColor: Colors.black45,
            body: Center(
              
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     /* Image.asset(
                        "lib/images/image1.png",
                      ),*/
                      const SizedBox(height: 500),
                      const Text(
                        "SEZIN",
                        style:
                            TextStyle(fontSize: 100, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Өз болашағың өз қолыңда",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 35),
                      //myButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
