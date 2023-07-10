  import 'package:flutter/material.dart';
//import 'package:flutter_application_1/components/auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'components/auth.dart';
import 'firebase_options.dart';
import 'homeeePAG/models/note_data.dart';

void main() async {
 

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
 
  // initialize hive
  await Hive.initFlutter();
  //open a hive box
  await Hive.openBox('note_database');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,   });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(create: (context) => NoteData(),
      builder: (context, child) => MaterialApp(
   debugShowCheckedModeBanner:false,
   //home:Authpage(),samgarbakytbek@gmail.com
   home:Authpage(),
    ),
    );
  }
}

