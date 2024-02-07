import 'package:chat/Widgets/MyButtom.dart';
import 'package:chat/register.dart';
import 'package:chat/signIn.dart';

import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  static const String ScreenRoute="Welcom_screen";
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home:Scaffold(body:

    
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(padding:EdgeInsets.fromLTRB(0,100,0,0),
          
             child: Column(
             children:[
              Image.asset("assets/images/logo (2).png",height: 180)
              
              ,const Text("MessageMe",style:TextStyle(fontSize: 40,fontWeight:FontWeight.w900,color:Color(0xff2e386b)),)
              ,const SizedBox(height: 30,),
              MyButtom(name: "Sign In",color: Colors.yellow[900]!,onPressed:(){Navigator.pushNamed(context,SingIn.ScreenRoute) ;},),
              MyButtom(name: "register", color: Colors.blue[800]!, onPressed: (){Navigator.pushNamed(context,Register.ScreenRoute);})

             
               
                   ]),
           ),
        ],
      ),
    ))
    ;
  
     
  }}


