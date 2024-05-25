import 'package:checkout/wrapper/responsive_wrapper.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PresenterScreen extends StatelessWidget {
  const PresenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Check it out",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DeviceWrapper();
          }));
        },
        child: const Icon(Ionicons.arrow_forward),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00AEFF),
                  Color(0xFF0076FF),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0.0, 0.0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -screenSize.width * 0.4,
                  left: -screenSize.width * 0.05,
                  child: Container(
                    width: screenSize.width * 0.7,
                    height: screenSize.width * 0.7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -screenSize.width * 0.25,
                  right: -screenSize.width * 0.1,
                  child: Container(
                    width: screenSize.width * 0.5,
                    height: screenSize.width * 0.5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "#",
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: screenSize.width * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 40.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        child: Text(
                                          '002',
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
                              const SizedBox(height: 16),
                              const SizedBox(
                                width: double.infinity,
                                child: FittedBox(
                                  child: Text(
                                    'Checkout Page',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DeviceFrame(
                                  device: Devices.ios.iPhone13ProMax,
                                  isFrameVisible: true,
                                  orientation: Orientation.portrait,
                                  screen: const DeviceWrapper(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 40.0),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            child: Text(
                                              '002',
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
                                  Spacer(
                                    flex: 5,
                                  ),
                                  SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    child: FittedBox(
                                      child: Text(
                                        'Checkout Page',
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
                            SizedBox(width: 16),
                            Expanded(
                              flex: 4,
                              child: DeviceFrame(
                                device: DeviceInfo.genericDesktopMonitor(
                                  platform: TargetPlatform.windows,
                                  name: 'Wide',
                                  id: 'wide',
                                  screenSize: const Size(1280, 720),
                                  windowPosition: Rect.fromCenter(
                                    center: const Offset(
                                      1280 * 0.5,
                                      720 * 0.5,
                                    ),
                                    width: 1280,
                                    height: 720,
                                  ),
                                ),
                                isFrameVisible: true,
                                orientation: Orientation.portrait,
                                screen: const DeviceWrapper(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
