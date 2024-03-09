import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final TextEditingController textEditingController;
  final bool obscureText;
  const TextInputWidget({
    Key? key,
    required this.type,
    required this.hint,
    required this.textEditingController,
    required this.obscureText,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 225, 225, 225),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: TextField(
          obscureText: true,
          textAlign: TextAlign.left,
          controller: textEditingController,
          keyboardType: type,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff9c9c9c)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xffE0E0E0),
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
