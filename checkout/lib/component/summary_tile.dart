import 'package:checkout/component/card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SummaryTile extends StatelessWidget {
  const SummaryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Summary",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: const Text("Item Chart"),
                children: const [
                  Divider(),
                  ListTile(
                    title: Text("Item 1"),
                    trailing: Text("1 x \$100"),
                  ),
                  ListTile(
                    title: Text("Item 2"),
                    trailing: Text("1 x \$200"),
                  ),
                  ListTile(
                    title: Text("Item 3"),
                    trailing: Text("1 x \$300"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: const Text("Shipping Address"),
                children: const [
                  Divider(),
                  ListTile(
                    title: Text("John Doe"),
                    subtitle: Text("123 Main Street Los Angeles, CA 90001"),
                    isThreeLine: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: const Text("Payment Method"),
                children: const [
                  Divider(),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Ionicons.card,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text("Credit Card"),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        CreditCard(),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Ionicons.card,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text("Debit Card"),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        DebitCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
