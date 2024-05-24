import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:sign_up/mobile/entry_screen_mobile.dart';

class WebEntryScreen extends StatelessWidget {
  const WebEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(37, 58, 66, 1),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Background image.avif',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(37, 58, 66, 1)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            color: const Color.fromRGBO(37, 58, 66, .9),
            child: Text(
              "#",
              style: TextStyle(
                color: Colors.white.withOpacity(.5),
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: FittedBox(
                                child: Text(
                                  '001',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: FittedBox(
                                child: Text(
                                  'Daily UI',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                'assets/images/Logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          child: Text(
                            'Sign Up Page',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: DeviceFrame(
                    device: Devices.ios.iPhone13ProMax,
                    isFrameVisible: true,
                    orientation: Orientation.portrait,
                    screen: const MobileEntryScreen(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
