import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SocialSharingMobile extends StatelessWidget {
  SocialSharingMobile({super.key});

  final ValueNotifier<bool> isShareButtonPressed = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isShareButtonPressed,
      builder: (context, isPressed, child) {
        return !isPressed
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Scaffold(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    appBar: AppBar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      elevation: 0,
                      leading: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      actions: [
                        IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    body: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pandemic Will End",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Covid-19 May End Up",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          "Three month ago, the World Health Organization declared the outbreak of a new coronavirus disease, COVID-19, to be a public health emergency of international concern. The virus first appeared in the Chinese city of Wuhan in December 2019... ",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Read more",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize: 16,
                                            decoration: TextDecoration
                                                .underline, // Add underline
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const CircleAvatar(
                                        radius: 20,
                                        child: Icon(
                                          Icons.person,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        radius: 20,
                                        child: Text(
                                          "+5",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        size: 35,
                                        Icons.favorite_border,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Divider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(.2),
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "1,155",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "Positive Cases",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 32),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "102",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "Deaths",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "4,729",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "Negative Cases",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 32),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "59",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Text(
                                            "Recovered",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.1),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Image Goes Here",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isShareButtonPressed.value = !isShareButtonPressed.value;
                    },
                    child: Align(
                      alignment: const Alignment(1, .11),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.share_outlined,
                            size: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  Scaffold(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    body: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.1),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                const SizedBox(),
                                Icon(
                                  Ionicons.logo_whatsapp,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text(
                                  "WhatsApp",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(),
                                const SizedBox(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                const SizedBox(),
                                Icon(
                                  Ionicons.logo_instagram,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text(
                                  "Instagram",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(),
                                const SizedBox(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                const SizedBox(),
                                Icon(
                                  Ionicons.logo_twitter,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text(
                                  "Twitter",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(),
                                const SizedBox(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                const SizedBox(),
                                Icon(
                                  Ionicons.logo_facebook,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text(
                                  "Facebook",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(),
                                const SizedBox(),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(),
                                const SizedBox(),
                                Icon(
                                  Ionicons.copy_outline,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                Text(
                                  "Copy Link",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(),
                                const SizedBox(),
                              ],
                            ),
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isShareButtonPressed.value = !isShareButtonPressed.value;
                    },
                    child: Align(
                      alignment: const Alignment(1, .11),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.close_outlined,
                            size: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
