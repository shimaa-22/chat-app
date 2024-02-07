import 'package:flutter/material.dart';
import"package:firebase_auth/firebase_auth.dart";
class Text_field extends StatelessWidget {
 Text_field({required this.name,required this.x,required this.checkboxCallback,});
 String? name;
int x;
var textMessageController=TextEditingController();
final Function(String?) checkboxCallback;

 




 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        
        onChanged:checkboxCallback,
      
      
      obscureText: x==1?true:false,
        keyboardType: x==2?TextInputType.emailAddress:TextInputType.streetAddress,
        decoration: InputDecoration(
          
          border:OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10))),
          hintText:name,
          hintStyle: TextStyle(fontSize: 16 ),
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 110)
          ,enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width:2),borderRadius: BorderRadius.all(Radius.circular(15))),
    
        ), 
        
      
      ),
    );
  }
}