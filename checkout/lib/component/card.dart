import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,
      width: 200,
      margin: const EdgeInsets.all(10.0),
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
            top: -80.0,
            left: -10.0,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
          ),
          Positioned(
            bottom: -50.0,
            right: -20.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
            ),
          ),
          const Positioned.fill(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Visa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Row(
                  children: [
                    Text(
                      "4356",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "3816",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(width: 10.0),
                    Text("1468",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200)),
                    SizedBox(width: 10.0),
                    Text(
                      "2341",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 8,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "VALID",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "12/25",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,
      width: 200,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.greenAccent,
            Colors.green,
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
            top: -80.0,
            left: -10.0,
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Positioned(
            bottom: -50.0,
            right: -20.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
            ),
          ),
          const Positioned.fill(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Visa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                Row(
                  children: [
                    Text(
                      "4356",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "3816",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    SizedBox(width: 10.0),
                    Text("1468",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200)),
                    SizedBox(width: 10.0),
                    Text(
                      "2341",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 8,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "VALID",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 8,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "12/25",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
