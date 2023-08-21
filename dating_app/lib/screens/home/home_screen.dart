import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../models/provider.dart';
import '../../models/user.dart';
import 'user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User(
        age: "17",
        name: "Punit",
        urlImage:
            "https://i.pinimg.com/736x/9d/78/76/9d787605f2ff60329f48726991f7e169.jpg",
        about: "Designer, Adorable Agency");
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [backgroundColor2, backgroundColorLight, Colors.red.shade200],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: MediaQuery.of(context).size.width * .1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLogo(),
                const SizedBox(height: 16),
                Expanded(child: UserCard(user: user)),
                // Expanded(child: buildCards(context)),
                const SizedBox(height: 16),
                buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCards(context) {
    final provider = Provider.of<CardProvider>(context);
    final urlImage = provider.urlImage;

    return Stack(
        children: urlImage
            .map((urlImage) => UserCard(
                user: User(
                    name: "name",
                    age: "age",
                    urlImage: urlImage,
                    about: "about")))
            .toList());
  }

  Widget buildLogo() => const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_fire_department_rounded,
              color: Colors.white, size: 30),
          SizedBox(width: 4),
          Text(
            "Campus Soulmate",
            style: TextStyle(
                fontFamily: "Poppins", color: Colors.white, fontSize: 22),
          ),
        ],
      );

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: backgroundColorLight.withOpacity(.6),
                shape: const CircleBorder(),
                minimumSize: const Size.square(50)),
            onPressed: () {},
            child: const Icon(Icons.clear, color: Colors.amber, size: 25),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.blue.shade400.withOpacity(.9),
                shape: const CircleBorder(),
                minimumSize: const Size.square(70)),
            onPressed: () {},
            child: const Icon(Icons.bolt, color: Colors.white, size: 35),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: backgroundColorLight.withOpacity(.6),
                shape: const CircleBorder(),
                minimumSize: const Size.square(50)),
            onPressed: () {},
            child: const Icon(Icons.favorite, color: Colors.pink, size: 25),
          ),
        ],
      );
}
