import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String fromProperty;
  final Map<String, String> fromValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false, 
    required this.fromProperty, 
    required this.fromValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: (value) {
       // print('value $value');
       fromValues[fromProperty] = value;
      },
      validator: (value) {
        if (value == null) return 'Este valor es requreido';
        return value.length < 3 ? 'minimo de 3 letras ' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        //counterText: '3 caracteres'
        // prefixIcon: Icon(Icons.cabin_sharp) ,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
        /*   focusedBorder: OutlineInputBorder(
          borderSide:BorderSide(
            color: Colors.green
          )
        ),
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            )
         )*/
      ),
    );
  }
}
