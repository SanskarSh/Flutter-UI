import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/provider.dart';
import '../../models/user.dart';

class UserCard extends StatefulWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  // @override
  // void initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     final size = MediaQuery.of(context).size;
  //     final provider = Provider.of<CardProvider>(context);
  //     provider.setScreen(size);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return buildFrontCard();
    return buildCard();
  }

  Widget buildFrontCard() => GestureDetector(
        onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context);
          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context);
          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context);
          provider.endPosition();
        },
        child: LayoutBuilder(builder: (context, constraints) {
          final center = constraints.smallest.center(Offset.zero);
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = provider.isDragging ? 0 : 400;
          final angle = provider.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);
          return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: milliseconds),
              transform: rotatedMatrix..translate(position.dx, position.dy),
              child: buildCard());
        }),
      );

  ClipRRect buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade200.withOpacity(.5),
          image: DecorationImage(
            image: NetworkImage(widget.user.urlImage),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 0),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 1]),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                buildName(),
                buildStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName() => Row(
        children: [
          Text(
            "${widget.user.name},",
            style: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 14),
          Text(
            widget.user.age,
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
        ],
      );

  Widget buildStatus() => Text(
        widget.user.about,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      );
}
