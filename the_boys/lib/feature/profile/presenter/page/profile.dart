import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:the_boys/config/routes/app_routes_const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List hobbies = [
      ['Sports', const Color.fromRGBO(0, 191, 255, 0), '🏃‍♂️'],
      ['Arts', const Color.fromRGBO(255, 215, 0, 0), '🎨'],
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
    void showLogoutDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(
              'Confirm Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            content: Text(
              'Are you sure you want to log out?',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed(RouteNames.splash);
                },
                child: Text(
                  'Logout',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          Icon(
            Icons.more_vert_outlined,
            color: Theme.of(context).colorScheme.primary,
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  child: RandomAvatar("SexyAvatar"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    'Lorem Ipsum dolor sit',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              Icon(
                Icons.mode_edit_outlined,
                color: Theme.of(context).colorScheme.primary,
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
                Text(
                  'Additional Information',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                // SizedBox(
                // height: 50,
                // child:
                Wrap(
                  children: List.generate(
                    hobbies.length,
                    (index) => Card(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${hobbies[index][2]} ${hobbies[index][0]}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                ),
                // child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: hobbies.length,
                //     itemBuilder: (BuildContext context, index) {
                //       return Card(
                //         color: Theme.of(context).colorScheme.background,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Center(
                //             child: Text(
                //               '${hobbies[index][2]} ${hobbies[index][0]}',
                //               style: TextStyle(
                //                   color:
                //                       Theme.of(context).colorScheme.primary),
                //             ),
                //           ),
                //         ),
                //       );
                //     }),
                // )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Account',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
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
                    showLogoutDialog(context);
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
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
