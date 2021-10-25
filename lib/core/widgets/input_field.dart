import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final bool isObscure;
  final TextInputType inputType;
  final TextEditingController controller;
  const CustomInputField({Key? key, required this.label, required this.isObscure, required this.inputType, required this.controller}) : super(key: key);
  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 2.06,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 2.06,
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 0, bottom: 24),
      padding: const EdgeInsets.only(left: 15, top: 7, bottom: 7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Label
          Text(
            widget.label,
            //TODO: Move TextStyle to constants.dart
            style: TextStyle(fontFamily: 'Poppins', fontSize: 16, color: Colors.black.withOpacity(0.87)),
            textAlign: TextAlign.left,
          ),
          //Input Field
          TextField(
            style: const TextStyle(fontFamily: 'Poppins', fontSize: 18, color: Color(0xFFC4C4C4)),
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              isDense: true,
            ),
            keyboardType: widget.inputType,
            obscureText: widget.isObscure,
            controller: widget.controller,
          )
        ],
      ),
    );
  }
}
