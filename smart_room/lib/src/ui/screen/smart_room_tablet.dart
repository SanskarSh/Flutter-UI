import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:smart_room/src/ui/screen/smart_room_mobile.dart';

class SmartRoomTablet extends StatelessWidget {
  const SmartRoomTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Column(
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
                              "006",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
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
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
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
                                color: Theme.of(context).colorScheme.onPrimary,
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
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: DeviceFrame(
                  device: Devices.ios.iPhone13ProMax,
                  isFrameVisible: true,
                  orientation: Orientation.portrait,
                  screen: const SmartRoomMobile(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
