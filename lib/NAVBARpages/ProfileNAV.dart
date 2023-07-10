
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/MytextBOx.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage ({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 final currentUser=FirebaseAuth.instance.currentUser!;
  final UserCollection = FirebaseFirestore.instance.collection('users');
final GoogleSignIn googleSignIn = new GoogleSignIn();
Future<void>editField(String field) async{
  String newValue ='';
   await showDialog(context: context, builder: (context)=>
   AlertDialog(
    backgroundColor: Color.fromARGB(255, 200, 117, 179),
    title: Text("Өзгерту $field ",
    style: const TextStyle(color: Colors.white),
    
    ),
    content: TextField(
      autofocus: true,
      style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: "  $field " ,
      hintStyle: TextStyle(color: Colors.white)
    ),
    onChanged: (value){
      newValue=value;
    },
    ),
    actions: [
      TextButton(
        child: Text('Отмена',
        style: TextStyle(color: Colors.white)),
        onPressed: ()=> Navigator.pop(context),
      ),
       TextButton(
        child: Text('Өзгерту',
        style: TextStyle(color: Colors.white)),
        onPressed: ()=> Navigator.of(context).pop(newValue),
      ),
      
    ],
    
   ),
   );
   if(newValue.trim().length > 0){
        await UserCollection.doc(currentUser.email).update({field:newValue});
   }
   
}


 void signUserOut() {
    FirebaseAuth.instance.signOut();
    googleSignIn.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 211, 90, 181),
      
         appBar:AppBar (
         title:Text('Профиль'),
         backgroundColor: Color.fromARGB(255, 211, 90, 181),
    ),
    body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(currentUser.email).snapshots(),
      builder: (context,screen){
        if(screen.hasData){
          final  userData = screen.data!.data() as Map<String,dynamic>;
          return ListView(
      
      children: [
       const   SizedBox(height: 50,),
       Icon(Icons.person,size: 72,color: Colors.white,),
       const   SizedBox(height: 10,),
       Text(currentUser.email!,
       textAlign: TextAlign.center,
       style: TextStyle(color: Colors.white),),
SizedBox(height: 50,),
Padding(
  padding: const EdgeInsets.only(left: 25),
  child: Text(
    "Менің ақпаратарым",
    style: TextStyle(color: Colors.white),
  ),
),
MyTextBox(
  text: userData['Аты'], 
  sectionName: 'Аты',
   
  onPressed:()=>editField('Аты')
  ),
  MyTextBox(
  text: userData['Жасы'], 
  sectionName: 'Жасы', 
  
  onPressed:()=>editField('Жасы'),
  ),


SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.end,
  
    children: [
  
          IconButton(onPressed: signUserOut,  icon: Icon(Icons.logout,color: Colors.white,),),
  
    ],
  
  ),
),
SizedBox(height: 0,),

Padding(
  padding: const EdgeInsets.only(left: 25),
  child: Text(
    "Тағы",
    style: TextStyle(color: Colors.white),
  ),
),
  /*MyTextBox(
  text: 'bio', 
  sectionName: 'bio', 
  onPressed:()=>editField('bio')
  ),*/





      ],  
    );
    
        }
        else if(screen.hasError){
              return  Center(
                child: 
                Text ('Қателік${screen.error}')
              );

        };

        return const Center(child: CircularProgressIndicator(),);
        
      })
    ) ;
}
}

