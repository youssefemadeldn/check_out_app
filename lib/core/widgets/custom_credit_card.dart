import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  // must initialize those variables
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (creditCardBrand) {},
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            expiryDate = creditCardModel.expiryDate;
            cardHolderName = creditCardModel.cardHolderName;
            cvvCode = creditCardModel.cvvCode;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: formKey,
        ),
      ],
    );
  }
}
