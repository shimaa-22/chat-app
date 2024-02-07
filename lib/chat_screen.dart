import 'package:chat/Widgets/messageLine.dart';
import 'package:chat/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
class ChatScreen extends StatefulWidget {
  
  static const String ScreenRoute="chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  late User signedInUser;
  final textMessageController=TextEditingController();
  String? message;
  @override
  void initState() {
  super.initState();
  getCurrentUser();
  }
  // void messagesStream() async{
  //   await for(var snapshots in _firestore.collection("messages").snapshots()){
  //     for(var message in snapshots.docs ){
  //       print(message.data());
  //     }
  //   }
  // }
  void getCurrentUser(){
    final user=_auth.currentUser;
   try {
        if(user!=null){
         signedInUser=user;
         print(signedInUser.email);
    }
  
   
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home:Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow[900],leading:IconButton(onPressed:(){},icon:Icon(Icons.arrow_back),color:Colors.white),title: Row(children: [
        Image.asset("assets/images/logo (2).png",height: 25,),
        SizedBox(width:10),
        Text("Chat",style: TextStyle(fontSize:23,color:Colors.white,),)
      ]),
      actions:[
        IconButton(onPressed: (){
        
          _auth.signOut();
          Navigator.pop(context);
        }, icon: Icon(Icons.close))
        

      ]), 
      body:
      SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          StreamBuilder(stream: _firestore.collection("messages").orderBy('time',descending: false).snapshots()
          
          , builder:(context,snapshot){
            List<MessageLine> messageWidgets=[];
            if(!snapshot.hasData){
              return Center(
                child:CircularProgressIndicator(backgroundColor: Colors.blue,)
              );

            }
            final messages=snapshot.data!.docs.reversed;
            for(var message in messages){
              final messageText=message.get("text");
              final messageSender=message.get("sender");
              
              final currentUser=signedInUser.email;
              final messageWidget=MessageLine(message: messageText, sender: messageSender,isMe: currentUser==messageSender,)
              ;
              messageWidgets.add(messageWidget);
            }
            return Expanded(child: ListView(reverse: true,padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),children: messageWidgets));
          }

          ),
          Container(
            decoration: BoxDecoration(border:Border(
              top:BorderSide(color: Colors.orange,width:2)
            )),
            child:
            Row(
        
              children: [
                Expanded(child:
                TextField(
                  controller: textMessageController,
                  onChanged: (value){
                    message=value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    hintText: "Write Your Message Here....",
                    border:InputBorder.none
                   
                   
                  ),
                
                )
                ),
                TextButton(onPressed: (){
                  textMessageController.clear();
                  _firestore.collection("messages").add({"text":message,"sender":signedInUser.email,
                  'time':FieldValue.serverTimestamp()});
                    

                }, child: Text("send",style:TextStyle(color:Colors.blue[800],
                fontWeight: FontWeight.bold,fontSize:18 )))
              ],
            )
        
          )
        
        
        ],),
      )
    
    
    
    
    ),);
  }
}