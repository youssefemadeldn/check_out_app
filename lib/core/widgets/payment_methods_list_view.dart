import 'package:check_out_app/core/widgets/payment_methode_item_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatelessWidget {
  final List<String> paymentMethodsItemList = const [
    'assets/images/master_card.svg',
    'assets/images/paypal.svg',
  ];
  const PaymentMethodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItemList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: PaymentMethodItemWidget(
              isActive: false,
              image: paymentMethodsItemList[index],
            ),
          );
        },
      ),
    );
  }
}
