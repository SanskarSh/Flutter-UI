import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: SizedBox(
        height: 800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            const Text(
              "Payment Method",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  buildPaymentMethodChip(
                    "Wallet",
                    Ionicons.wallet_outline,
                    Ionicons.wallet,
                  ),
                  const SizedBox(width: 10),
                  buildPaymentMethodChip(
                      "Credit Card", Ionicons.card_outline, Ionicons.card,
                      selected: true),
                  const SizedBox(width: 10),
                  buildPaymentMethodChip(
                      "Debit Card", Ionicons.card_outline, Ionicons.card),
                ],
              ),
            ),
            const Spacer(),
            const Text("You can choose your saved card"),
            const Spacer(),
            Container(
              color: Colors.white.withOpacity(.6),
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.3))),
                      labelText: "Card Number",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.3))),
                      labelText: "Name",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.3))),
                            labelText: "Valid Date",
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.3))),
                            labelText: "CVV",
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      FittedBox(
                        child: Text(
                          "Save Card Information",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(0.0),
                    side: WidgetStateProperty.all(
                      BorderSide(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Finish",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.check,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  Expanded buildPaymentMethodChip(
      String title, IconData iconIdle, IconData iconActive,
      {bool selected = false}) {
    return Expanded(
      child: Card(
        color: Colors.white.withOpacity(.6),
        elevation: 0.0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
          side: BorderSide(
            color: selected ? Colors.blue : Colors.black.withOpacity(0.3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      selected ? iconActive : iconIdle,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    FittedBox(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    IgnorePointer(
                      child: Checkbox(
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
                        value: selected,
                        shape: const CircleBorder(),
                        onChanged: (bool? value) {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
