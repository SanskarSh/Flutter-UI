import 'package:flutter/material.dart';
import 'package:ticket_machine/src/ui/screen/card_detail_screen.dart';

class CustomBackCard extends StatelessWidget {
  const CustomBackCard({
    super.key,
    required this.bankName,
    required this.cardType,
    required this.cvv,
    required this.colors,
  });

  final String bankName;
  final String cardType;
  final String cvv;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CardDetailScreen(
              bankName: bankName,
              cardType: cardType,
              cvv: cvv,
              colors: colors,
            ),
          ),
        );
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.03,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: size.width * 0.3,
                          maxWidth: size.width * 0.3,
                        ),
                        child: FittedBox(
                          child: Text(
                            bankName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: size.width * 0.1,
                        ),
                        child: FittedBox(
                          child: Text(
                            cardType,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.15,
                          maxHeight: size.height * 0.2,
                        ),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  height: size.height * 0.038,
                                  width: size.width * 0.09,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(.7),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  height: size.height * 0.038,
                                  width: size.width * 0.09,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
