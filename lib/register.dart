import 'package:chat/Widgets/MyButtom.dart';
import 'package:chat/Widgets/textField.dart';
import 'package:chat/chat_screen.dart';
import 'package:flutter/material.dart';
import"package:firebase_auth/firebase_auth.dart";
import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";
class Register extends StatefulWidget {
   
  
  
static const String ScreenRoute='register_screen';


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 final _auth=FirebaseAuth.instance;
     String? email;
    String? password;
    bool showSpinner=false;
    final textMessageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home:Scaffold(body: 
  ModalProgressHUD(
    inAsyncCall: showSpinner,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch
        ,children: [
        Image.asset("assets/images/logo (2).png",height:180),
        SizedBox(height:50)
      
        ,Text_field(name: "Enter Your Email",x:2,checkboxCallback:(value){
          email=value;
        })
        
        ,SizedBox(height: 30,),
        Text_field( name: "Enter Your password",x:1,checkboxCallback: (value){
               password=value;
        },),
        SizedBox(height: 20,),
        MyButtom(name: "Register", color: Colors.blue[800]!, onPressed:()async{
textMessageController.clear();
          setState(() {
            showSpinner=true;
          });
          
      
        try {
                 final newUser=await 
        
        _auth.createUserWithEmailAndPassword(email:email!, password:password!);
        Navigator.pushNamed(context, ChatScreen.ScreenRoute);
        setState(() {
          showSpinner=false;
        });
        } catch (e) {
          print(e);
          
        }
        
        })
      ],),
    )
    ));
  }
}


