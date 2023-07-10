import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav/utils/option_data.dart';

import 'DiaryPage.dart';
import 'HomePage.dart';
import 'MessageNAV.dart';
import 'ProfileNAV.dart';



class MainPage extends StatefulWidget {

 const MainPage({ super.key,});
      
  
  
  @override
  State<MainPage> createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {



int currentIndex=0;
void onTap(int index){
setState(() {
  currentIndex =index;
});
}


  @override
  Widget build(BuildContext context) {List pages = [
  HomePage(),
  DiaryPage(),
  MessagePage(),
  ProfilePage(),
  
];
    return Scaffold(
      
        body: pages[currentIndex],
        backgroundColor: Color.fromARGB(255, 211, 90, 181),
        bottomNavigationBar:CurvedNavigationBar(
        onTap: onTap,
        index: currentIndex,
        
       backgroundColor: Color.fromARGB(255, 211, 90, 181),
        color: Colors.deepPurple.shade50,
       animationDuration: Duration(milliseconds: 300),
       
       items: [
        Icon(Icons.home,color: Color.fromARGB(255, 211, 90, 181),),
        Icon(Icons.calendar_month,color:Color.fromARGB(255, 211, 90, 181),),
        Icon(Icons.message,color: Color.fromARGB(255, 211, 90, 181),),
        Icon(Icons.person,color: Color.fromARGB(255, 211, 90, 181),)
        
       ],
      ),
    );
  }
}