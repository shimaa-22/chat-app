import 'dart:io';

import 'package:chat/chat_screen.dart';
import 'package:chat/register.dart';
import 'package:chat/signIn.dart';
import 'package:chat/welcom_screen.dart';
import 'package:flutter/material.dart';
import"package:firebase_core/firebase_core.dart";
import 'package:firebase_auth/firebase_auth.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
Platform.isAndroid?
await Firebase.initializeApp(
   
   
    options: const FirebaseOptions(
      apiKey: "AIzaSyAVHcWzhe6My7p7MNN09TpB2PCjjYUEFlo",
      appId: "1:602814727535:android:cf6bf609cfadc9fce1949a",
      messagingSenderId: "602814727535",
      projectId: "messageme-app-5931e",
    ),)
    :await Firebase.initializeApp();
  
  
  runApp( MyApp());

}




class MyApp extends StatelessWidget {
  
  

  final _auth=FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    
    
    initialRoute: _auth.currentUser!=null?
    ChatScreen.ScreenRoute:
    WelcomScreen.ScreenRoute,
    routes: {
      WelcomScreen.ScreenRoute:(context)=>WelcomScreen(),
      Register.ScreenRoute:(context)=>Register(),
      SingIn.ScreenRoute:(context)=>SingIn(),
      ChatScreen.ScreenRoute:(context)=>ChatScreen()



    

    },
    );
    
  }
}
     
     
    
    