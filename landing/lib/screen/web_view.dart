import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebView extends StatelessWidget {
  const WebView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: -80,
            right: -80,
            child: FittedBox(
              child: Text(
                "The Subtle Art of\nNot Giving a F*ck",
                style: GoogleFonts.playfairDisplay(
                  height: 1.83,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..color =
                        Theme.of(context).colorScheme.secondary.withOpacity(.4),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: size.height / 1.3,
            child: Container(
              color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
            ),
          ),
          Positioned(
            left: 0,
            right: size.width / 1.7,
            bottom: size.height / 7,
            top: size.height / 1.4,
            child: Container(
              height: 150,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "20:38",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      const Spacer(
                        flex: 14,
                      ),
                      Text(
                        "32:17",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Slider(
                    activeColor: Theme.of(context).colorScheme.secondary,
                    inactiveColor: Theme.of(context).colorScheme.surface,
                    max: 100,
                    value: 75,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: buildAppBar(context),
              body: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              child:
                                  Text("The Subtle Art of\nNot Giving a F*ck",
                                      style: GoogleFonts.playfairDisplay(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      )),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            child: Stack(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    elevation: 0,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16.0, 16.0, 64.0, 16.0),
                                    child: Text(
                                      "Buy Audio",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Spacer(),
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              "assets/images/Book.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "01",
                                    style: GoogleFonts.playfairDisplay(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 55,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "/ 04",
                                    style: GoogleFonts.playfairDisplay(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(.5),
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 4,
                                child: VerticalDivider(
                                  indent: 28,
                                  endIndent: 28,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  thickness: 2,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              const SizedBox(height: 16),
                              CircleAvatar(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(.2),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * .14,
            bottom: size.height * .25,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      width: 2.5,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.skip_previous,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    border: Border.all(
                      width: 3,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    size: 44,
                    Icons.pause,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      width: 2.5,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.skip_next,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      title: Row(
        children: [
          Image.asset("assets/images/Logo.png", width: 45),
          const SizedBox(width: 10),
          Text(
            "Audio",
            style: TextStyle(
              fontSize: 28,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            "Book",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Text(
            "SIGN UP",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        const SizedBox(width: 32),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(
              "LOGIN",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 32),
      ],
    );
  }
}
