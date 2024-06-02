import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class SmartRoomMobile extends StatelessWidget {
  const SmartRoomMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    'Smart',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    'Room',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 2,
                              child: FittedBox(
                                child: Icon(
                                  Icons.format_list_bulleted_rounded,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            const Spacer(flex: 3)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: -size.width * 1.2,
              child: CircleAvatar(
                radius: size.height * .4,
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 72.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselChild(
                        title: 'Lamp',
                        subtitle: 'Bathroom',
                        image: "asset/image/Light Bulb Icon.png",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SmartDeviceDetails(
                                title: 'Lamp',
                                subtitle: 'Bathroom',
                                image: "asset/image/Light Bulb Icon.png",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      CarouselChild(
                        title: 'AC',
                        subtitle: 'Bedroom',
                        image: "asset/image/Air conditioner icon.png",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SmartDeviceDetails(
                                title: 'Air Conditioner',
                                subtitle: 'Bedroom',
                                image: "asset/image/Air conditioner icon.png",
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselChild(
                        title: 'Add',
                        subtitle: 'Device',
                        image: "asset/image/plus icon.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselChild extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Function()? onTap;
  const CarouselChild({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Colors.blue,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Image.asset(
              image,
              scale: 6,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                color: Colors.white60,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SmartDeviceDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const SmartDeviceDetails(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          /// Semi Circle Decoration
          Positioned(
            top: -size.height * 0.8,
            left: -size.width * 0.5,
            child: Container(
              height: size.height * 1.5,
              width: size.width * 2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          //Body
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    /// App Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 32,
                          ),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 32,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ],
                    ),

                    /// Title
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(.6),
                        fontSize: 20,
                      ),
                    ),

                    /// Subtitle
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),

                    /// Icon
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      width: size.width * .6,
                      height: size.width * .6,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.tertiary,
                            Colors.blue,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: FittedBox(
                        child: Image.asset(
                          image,
                        ),
                      ),
                    ),

                    /// Temperature Data
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Temperature Value
                        Text(
                          "23º",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 80,
                          ),
                        ),

                        /// Temperature Text
                        Column(
                          children: [
                            const SizedBox(height: 32),
                            Text(
                              "Temperature",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(.6),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// Slider
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.5),
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: 60,
                            thumbColor: Theme.of(context).colorScheme.tertiary,
                            activeColor: Theme.of(context).colorScheme.tertiary,
                            inactiveColor:
                                Theme.of(context).colorScheme.secondary,
                            max: 100,
                            onChanged: (_) {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.5),
                          ),
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Divider
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 2,
                    ),

                    const SizedBox(height: 16),

                    /// Swing Switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Swing Text
                        Text(
                          "Swing Mode",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        /// Swing Switch
                        Switch(
                          value: true,
                          onChanged: (_) {},
                          activeColor: Theme.of(context).colorScheme.tertiary,
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Divider
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 2,
                    ),

                    const SizedBox(height: 20),

                    /// Segmented Button
                    SizedBox(
                      width: size.width,
                      child: MaterialSegmentedControl(
                        children: {
                          0: Text("COOL",
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onPrimary,
                              )),
                          1: Text(
                            "COMFORT",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          2: Text(
                            "DRY",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        },
                        selectionIndex: 0,
                        borderColor: Theme.of(context).colorScheme.secondary,
                        borderWidth: 4,
                        selectedColor: Colors.blue.shade500.withOpacity(.8),
                        unselectedColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.6),
                        borderRadius: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
