// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class ErrorPageWeb extends StatelessWidget {
  const ErrorPageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [
                  /// Logo
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.surface,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            "asset/images/Logo.png",
                            scale: 2.8,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "JAP",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),

                  /// Search Bar
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(
                          Icons.search,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.2),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Search your outfits..",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.2),
                              ),
                        )
                      ],
                    ),
                  ),

                  /// Tabs
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Top",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          "Bottom",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          "Bag",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        Text(
                          "Shoes",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),

                        /// Divider
                        Container(
                          width: 2,
                          height: 32,
                          color: Theme.of(context).colorScheme.surface,
                        ),

                        /// Sign In
                        Text(
                          "Sign In",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),

                        /// Login
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(24)),
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Error Message and Image
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Lottie.asset("asset/lottie/404.json"),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "404",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                                fontSize: 64,
                              ),
                        ),
                        SizedBox(height: 24),
                        Text(
                          "Oops! We can't find the page..",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Make sure your URL is correct.",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.5),
                              ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Ionicons.arrow_back,
                                size: 16,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Go Back",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Footer
            Container(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "© Copyright - JAP, All right reserved 2019",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Ionicons.logo_facebook,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 24),
                      Icon(
                        Ionicons.logo_instagram,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 24),
                      Icon(
                        Ionicons.logo_twitter,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 24),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
