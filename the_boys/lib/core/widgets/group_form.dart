import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:the_boys/core/widgets/animated_button.dart';

// ignore: must_be_immutable
class GroupForm extends StatefulWidget {
  String hintTextF1, hintTextF2, btnText;
  dynamic tapOperation;
  bool onPressed;
  GroupForm({
    Key? key,
    this.onPressed = false,
    required this.tapOperation,
    required this.hintTextF1,
    required this.hintTextF2,
    required this.btnText,
  }) : super(key: key);

  @override
  State<GroupForm> createState() => _GroupFormState();
}

class _GroupFormState extends State<GroupForm> {
  late String avatarKey;
  final Random rnd = Random();
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  void updateAvatar(int length) {
    avatarKey = String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  @override
  void initState() {
    updateAvatar(5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildAvatar(context),
          buildField(widget.hintTextF1, context),
          buildField(widget.hintTextF2, context),
          Divider(
            thickness: 2,
            color: Theme.of(context).colorScheme.background,
          ),
          AnimButton(tapOperation: widget.tapOperation, title: widget.btnText),
        ],
      ),
    );
  }

  CircleAvatar buildAvatar(BuildContext context) {
    return CircleAvatar(
      minRadius: 50,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: GestureDetector(
        onDoubleTapDown: (_) {
          setState(() {
            widget.onPressed = true;
          });
        },
        onDoubleTap: () {
          setState(() {
            updateAvatar(6);
            widget.onPressed = false;
          });
        },
        child: AnimatedContainer(
          duration: Durations.short3,
          curve: Curves.easeIn,
          height: widget.onPressed ? 30 : 100,
          width: widget.onPressed ? 30 : 100,
          child: RandomAvatar(avatarKey),
        ),
      ),
    );
  }

  Container buildField(hintText, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 70,
      width: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary.withOpacity(.7),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
