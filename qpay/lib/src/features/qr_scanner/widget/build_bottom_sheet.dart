import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/src/config/constants.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.fromLTRB(180, 16, 180, 0),
              height: 6,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: tertiaryColor.withOpacity(.7),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type name or phone number to send',
                hintStyle: TextStyle(
                  color: tertiaryColor.withOpacity(0.7),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: tertiaryColor,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: tertiaryColor),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: tertiaryColor,
                    child: Icon(
                      FontAwesomeIcons.user,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ' To my\ncontact',
                    style: TextStyle(
                      color: tertiaryColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: tertiaryColor,
                    child: Icon(
                      FontAwesomeIcons.upload,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Upload QR\n    code',
                    style: TextStyle(
                      color: tertiaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: tertiaryColor,
                ),
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: tertiaryColor,
                    child: Icon(
                      FontAwesomeIcons.qrcode,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Check my\n QR code',
                    style: TextStyle(
                      color: tertiaryColor,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
