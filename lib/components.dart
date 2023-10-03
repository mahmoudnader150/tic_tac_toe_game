import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextButton({
  required VoidCallback? function,
  required String text
})=>TextButton(onPressed: function, child: Center(child: Text(text.toUpperCase(),style: TextStyle(color: Colors.purpleAccent,fontSize: 20),)),);


void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
      builder: (context) =>widget
  ),
      (route)=>false,
);
void navigateTo(context,widget)=> Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>widget
    )
);

void showToast({
  required String text,
})=>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );



Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  required String?Function(String?) validate,
  required String label,
  required IconData prefix,
  bool obscure = false,
  VoidCallback? onTap,
  bool isClickable = true,
  IconData? suffix ,
  void Function()?  suffixPressed
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onChange ,
  validator: validate ,
  obscureText: obscure,
  cursorColor: Colors.purpleAccent  ,
  onTap: onTap,
  enabled: isClickable,
  style: TextStyle(
    color: Colors.white
  ),
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color:  Colors.purpleAccent), // Border color when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purpleAccent), // Border color when focused
    ),
    labelText: label,
    labelStyle: TextStyle(
        color: Colors.purpleAccent
    ),

    suffixIcon: IconButton(
      icon: Icon(suffix),
      onPressed: suffixPressed,
    ),
    prefixIcon: Icon(prefix,color: Colors.purpleAccent,),
    border: OutlineInputBorder(
    ),
  ),
);