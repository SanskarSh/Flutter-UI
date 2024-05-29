import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/src/ui/screen/user_profile_mobile.dart';

class UserProfileWeb extends StatelessWidget {
  const UserProfileWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("asset/images/Background.jpeg", fit: BoxFit.cover),
        Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(.9),
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 125,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              height: double.infinity,
                              child: FittedBox(
                                child: Text(
                                  "005",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              children: [
                                const Spacer(flex: 3),
                                Expanded(
                                  flex: 4,
                                  child: FittedBox(
                                    child: Text(
                                      "Daily UI",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer()
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FittedBox(
                                child: Text(
                                  "User Profile",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(flex: 2)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: DeviceFrame(
                    device: Devices.ios.iPhone13ProMax,
                    isFrameVisible: true,
                    orientation: Orientation.portrait,
                    screen: const UserProfileMobile(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
