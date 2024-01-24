import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_in_form.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClose}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 590,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white.withOpacity(.94)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Whether you're looking for a flirty date or a serious relationship, Campus Soulmates is the go-to app for college students.",
                        style: TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SignInForm(),
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text("OR",
                              style: TextStyle(color: Colors.black26)),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text("Sign up with Email, Apple or Google",
                          style: TextStyle(color: Colors.black54)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/email_box.svg",
                              height: 60, width: 60),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/apple_box.svg",
                              height: 60, width: 60),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/google_box.svg",
                              height: 60, width: 60),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -40,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
              // const SizedBox()
            ],
          ),
        ),
      ),
    ),
  ).then(onClose);
}
