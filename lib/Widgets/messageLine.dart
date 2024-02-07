import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  MessageLine({required this.message,required this.sender,required this.isMe});

final String message;
final String sender;
final bool isMe;

  @override
  Widget build(BuildContext context) {
    return 
     Padding(
       padding: const EdgeInsets.all(10),
       child: Column(
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
         children: [
          // Text("$sender",style:TextStyle(fontSize: 12,color:Colors.yellow[900])),
           Material(elevation: 5,borderRadius: isMe? BorderRadius.only(

            topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)
            ):
            BorderRadius.only(

            topRight: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)
            )
            ,color: isMe? Colors.blue[800]:Colors.white,child: Padding(
           
             padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
             child: Text("$message",style: TextStyle(fontSize: 15,color: isMe?Colors.white:Colors.black45),),
           )),
         ],
       ),
     );
  }
}