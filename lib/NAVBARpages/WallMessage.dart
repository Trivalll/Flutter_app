import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WallMessages extends StatelessWidget {
  final String message;
  final String user;
  final int timeH;
  final int timeM;
  final int timeD;
  
   WallMessages({super.key ,required this.message,required this.user,  required this.timeH, required this.timeM, required this.timeD, });
final currentUser=FirebaseAuth.instance.currentUser!;
  
  @override
  Widget build(BuildContext context) {
    return user ==currentUser.email? Padding(
      padding: const EdgeInsets.only(bottom: 5),
      
      child: Container(
        
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(top:5,left:120,right: 2),
        padding: EdgeInsets.all(3),
        
        child: Row(
          mainAxisAlignment:MainAxisAlignment.end,
          children: [
    
           
         
            Flexible(
              
              child: Column(
                /*Container(
     child: Text(
     DateFormat('dd MMM kk:mm')
     .format(DateTime.fromMillisecondsSinceEpoch(int.parse(document['timestamp']))),
     style: TextStyle(color: chatbox, fontSize: 12.0, fontStyle: FontStyle.italic),
     ), */
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(user,
                  style: TextStyle(color: Color.fromARGB(255, 211, 90, 181),),
                  ),
                  /*Text(time.toString(),
                  style: TextStyle(color: Color.fromARGB(255, 211, 90, 181),),
                  ),*/
                  SizedBox(height: 2,),
                  Text(message,overflow: TextOverflow.clip),
                 SizedBox(height: 2,),
                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(timeD.toString()+':'+timeM.toString(),style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
           
     
     
                ],
                
              ),
              
              
              
            ),
               SizedBox(width: 10,),
             Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color:Color.fromARGB(255, 211, 90, 181),),
              padding: EdgeInsets.all(10),
              child:const Icon(
                Icons.person,color: Colors.white,),
            ),
            
              
          ],
         
        ),
        
       
       
      ),
    )
    
    :Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
    
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(top:5,left:2,right: 120),
        padding: EdgeInsets.all(3),
        child: Row(
          children: [
    
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle,color:Color.fromARGB(255, 211, 90, 181),),
              padding: EdgeInsets.all(10),
              child:const Icon(
                Icons.person,color: Colors.white,),
            ),
            SizedBox(width: 10,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(user,
                  style: TextStyle(color: Color.fromARGB(255, 211, 90, 181),),
                  ),
                  /*Text(time.toString(),
                  style: TextStyle(color: Color.fromARGB(255, 211, 90, 181),),
                  ),*/
                  SizedBox(height: 2,),
                  Text(message,overflow: TextOverflow.clip),
                 SizedBox(height: 2,),
                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(timeD.toString()+':'+timeM.toString(),style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
           
     
     
                ],
                
              ),
            ),
              
          ],
         
        ),
       
       
      ),
    );
   
  }
  
}
  