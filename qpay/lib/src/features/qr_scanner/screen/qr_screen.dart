import 'package:flutter/material.dart';
import 'package:qpay/src/features/qr_scanner/widget/animated_qr.dart';
import 'package:qpay/src/features/qr_scanner/widget/build_bottom_sheet.dart';
import 'package:qpay/src/features/qr_scanner/widget/custom_app_bar.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: AnimatedQR(),
          ),
          Expanded(
            flex: 4,
            child: BuildBottomSheet(),
          ),
        ],
      ),
    );
  }
}
