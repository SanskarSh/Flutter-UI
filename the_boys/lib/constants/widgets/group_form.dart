// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:the_boys/constants/widgets/animated_button.dart';

// ignore: must_be_immutable
class GroupForm extends StatelessWidget {
  String hintTextF1, hintTextF2, btnText;
  dynamic tapOperation;
  GroupForm({
    Key? key,
    required this.tapOperation,
    required this.hintTextF1,
    required this.hintTextF2,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(
          minRadius: 40,
          backgroundColor: Color.fromRGBO(49, 49, 49, 1),
          child: Icon(
            Icons.person_4_rounded,
            color: Colors.white38,
            size: 60,
          ),
        ),
        buildField(hintTextF1),
        buildField(hintTextF2),
        const Divider(
          thickness: 2,
          color: Color.fromRGBO(49, 49, 49, 1),
        ),
        AnimButton(tapOperation: tapOperation, title: btnText),
      ],
    );
  }

  Container buildField(hintText) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 70,
      width: 200,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(49, 49, 49, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
