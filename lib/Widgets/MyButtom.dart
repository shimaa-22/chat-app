import "package:flutter/material.dart";



// ignore: must_be_immutable
class MyButtom extends StatelessWidget {
 
 MyButtom({required this.name,required this.color,required this.onPressed});
 String name;
 Color color;
 VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: Material(
        elevation: 5,
        
        color:color,
        borderRadius: BorderRadius.circular(10),
        child:MaterialButton(onPressed:onPressed,minWidth:370,height:42,child:Text(name,style: TextStyle(color:Colors.white),),)
      ),
    );
  }
}