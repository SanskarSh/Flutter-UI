import 'package:flutter/material.dart';
import 'package:ticket_machine/src/domain/entities/bank_cards.dart';
import 'package:ticket_machine/src/ui/widget/custome_animate_transition.dart';
import 'package:ticket_machine/src/ui/widget/custom_bank_card.dart';
import 'package:ticket_machine/src/ui/widget/draggable_bank_card.dart';

class TicketMachineMobile extends StatelessWidget {
  const TicketMachineMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: DraggableBankCardCarousel(
        ctx: context,
        itemCount: BankCards.fakeBankCards.length,
        itemBuilder: (context, index) {
          return AnimateTransition(
            tag: BankCards.fakeBankCards[index].cvv,
            child: CustomBackCard(
              bankName: BankCards.fakeBankCards[index].bankName,
              cardType: BankCards.fakeBankCards[index].cardType,
              cvv: BankCards.fakeBankCards[index].cvv,
              colors: BankCards.fakeBankCards[index].colors,
            ),
          );
        },
      ),
    );
  }
}
