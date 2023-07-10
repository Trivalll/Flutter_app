import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final keyboarNum;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboarNum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboarNum,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          //  fillColor: Colors.grey.shade200,
          fillColor: Color.fromARGB(255, 200, 117, 179),
          
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white)),
      ),
      
    );
  }
}
class MyTextField2 extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final keyboarNum;
  const MyTextField2({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboarNum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboarNum,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          //  fillColor: Colors.grey.shade200,
          fillColor: Color.fromARGB(255, 200, 117, 179),
          
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white)),
      ),
      
    );
  }
}




