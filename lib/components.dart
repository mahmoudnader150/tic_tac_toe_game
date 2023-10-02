import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextButton({
  required VoidCallback? function,
  required String text
})=>TextButton(onPressed: function, child: Text(text.toUpperCase(),style: TextStyle(color: Colors.teal),),);


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
  cursorColor: Colors.teal,
  onTap: onTap,
  enabled: isClickable,
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal), // Border color when not focused
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal), // Border color when focused
    ),
    labelText: label,
    labelStyle: TextStyle(
        color:  Colors.teal
    ),

    suffixIcon: IconButton(
      icon: Icon(suffix),
      onPressed: suffixPressed,
    ),
    prefixIcon: Icon(prefix,color: Colors.teal,),
    border: OutlineInputBorder(
    ),
  ),
);