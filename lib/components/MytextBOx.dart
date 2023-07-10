import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  
final  String text;
 final void Function()? onPressed;
final String sectionName;
const MyTextBox({
  super.key ,
required this.text, 
required this.sectionName,
required this.onPressed,

});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 144, 207),
        borderRadius: BorderRadius.circular(8)
        ),
        
        padding:const EdgeInsets.only(
          left: 15,
        bottom: 20),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top:20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName,
              style: TextStyle(
                color: Colors.white),
              ),
               IconButton(
                onPressed:onPressed, 
                icon:Icon(
                  Icons.settings,
                  color:Colors.white,))
            ],
          ),
          Text(text),
        ],
      ),
    
    );
  }
}


class MyTextBox2 extends StatelessWidget {
  
final  String text;
 final void Function()? onPressed;

const MyTextBox2({
  super.key ,
required this.text, 

required this.onPressed,

});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 228, 144, 207),
        borderRadius: BorderRadius.circular(8)
        ),
        
        padding:const EdgeInsets.only(
          left: 15,
        bottom: 20),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top:20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
              style: TextStyle(
                color: Colors.white),
              ),
               IconButton(
                onPressed:onPressed, 
                icon:Icon(
                  Icons.settings,
                  color:Colors.white,))
            ],
          ),
          Text(text),
        ],
      ),
    
    );
  }
}