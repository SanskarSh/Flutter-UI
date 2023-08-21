import 'package:flutter/material.dart';

import '../../config.dart';
import '../../models/flutter_secure.dart';
import '../splash_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List hobbies = [
      ['Sports', Color.fromRGBO(0, 191, 255, 0), '🏃‍♂️'],
      ['Arts', Color.fromRGBO(255, 215, 0, 0), '🎨'],
      ['Cooking', const Color(0x00ffa500), '🍳'],
      ['Gaming', const Color(0x00800080), '🎮'],
      ['Reading', const Color(0x00228b22), '📚'],
      ['Travel', const Color(0x00ff6347), '🗺️'],
      ['Dancing', const Color(0x00ff69b4), '🕺'],
      ['Outdoor Activities', const Color(0x00228b22), '🏕️'],
      ['Music', const Color(0x00ffc0cb), '🎶'],
      ['Technology', const Color(0x00808080), '🤖'],
      ['Collecting', const Color(0x00800000), '🧩'],
      ['Fashion ', const Color(0x00ff1493), '🧥'],
      ['Learning', const Color(0x004169e1), '🧠'],
      ['Pets', const Color(0x00ffd700), '🐾'],
    ];
    void _showLogoutDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to log out?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  FlutterSecure().clearData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashScreen()));
                },
                child: const Text('Logout'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColorLight,
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.more_vert_outlined,
            color: backgroundColor2,
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 15,
            color: backgroundColor2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipOval(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.shade200.withOpacity(.5),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://i.pinimg.com/736x/30/b3/ca/30b3ca742dabfdc50c5f07ba9eb1631a.jpg",
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment(0, -1),
                    ),
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Text('Lorem Ipsum dolor sit',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
              const Icon(
                Icons.mode_edit_outlined,
                color: backgroundColor2,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .085),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 15),
                // Text(
                //   'About',
                //   style: TextStyle(
                //       color: backgroundColor2,
                //       fontSize: 12,
                //       fontWeight: FontWeight.bold),
                // ),
                // SizedBox(height: 15),
                // Text(
                //   'Ipsum aliquip fugiat veniam aliqua. Reprehenderit ad laborum nulla sint officia amet ad.',
                //   style: TextStyle(color: shadowColorLight),
                // ),
                // SizedBox(height: 15),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Divider(color: backgroundColor2),
                // ),
                const SizedBox(height: 40),
                const Text(
                  'Additional Information',
                  style: TextStyle(
                      color: backgroundColor2,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hobbies.length,
                      itemBuilder: (BuildContext context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                  '${hobbies[index][2]} ${hobbies[index][0]}'),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Account',
                  style: TextStyle(
                      color: backgroundColor2,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Switch to Other Account',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
