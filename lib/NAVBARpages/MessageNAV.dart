import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/NAVBARpages/WallMessage.dart';
import 'package:flutter_application_1/components/my_text_fill.dart';
import 'package:get/get.dart';


class MessagePage extends StatefulWidget {
 
   MessagePage({super.key, });

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
final Textcontroller =TextEditingController();
final currentUser=FirebaseAuth.instance.currentUser!;





void PostMessage(){
if(Textcontroller.text.isNotEmpty){
  FirebaseFirestore.instance.collection("Users message").add({
      'UserEmail' :currentUser.email,
      'Message' :Textcontroller.text,
      'TimeStamp' : Timestamp.now(),
      'Day' :DateTime.now().day,
      'Month' :DateTime.now().month,
      'Year' :DateTime.now().year,
      'Hours':DateTime.now().hour,
      'Min':DateTime.now().minute,

  });
}
setState(() {
  Textcontroller.clear();
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
            Text('Sezin - командасы'),
          ],
        ),
        backgroundColor:Color.fromARGB(255, 211, 90, 181),
      ),
      backgroundColor: Color.fromARGB(255, 211, 90, 181),
      body: Center(
        child: Column(
          children: [

            Expanded(child: 
            StreamBuilder(
              stream: FirebaseFirestore.instance.
              collection('Users message').
              orderBy('TimeStamp',descending: false).
              snapshots(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                     reverse: false,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                        final post =snapshot.data!.docs[index];
                        return WallMessages(message:  post['Message'],user: post['UserEmail'],timeD: post['Day'],timeH: post['Hours'],timeM: post['Min'],);
                  });
                }
                else if(snapshot.hasError){
                      return Center(
                        child: Text('Қателік+ ${snapshot.error}'),
                        );
                }
               
                return const Center(child: CircularProgressIndicator(),);
              },
            ),
            ),

            
      Row(
            children: [
              Expanded(
                child: MyTextField2(
                controller: Textcontroller,
                hintText: "Жолдау жолағы",
                obscureText: false, 
                keyboarNum: null,
                
              ),
              
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: IconButton(onPressed: PostMessage ,icon: const Icon(Icons.send,color:Colors.white,),
                           ),
              ), 
             
            ],
               
              ),
          ],
          
        ),
        
      ),
    
    );
    
  }
  
}