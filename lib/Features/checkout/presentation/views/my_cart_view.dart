import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/widgets/order_info_item.dart';
import 'package:check_out_app/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
        centerTitle: true,
        title: const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Image.asset('assets/images/item_in_basket.png'),
            const SizedBox(
              height: 25,
            ),
            const OrderInfoItem(
              title: 'Order Subtotal',
              value: '\$42.97',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Discount',
              value: '\$0',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Shipping',
              value: '\$8',
            ),
            const SizedBox(
              height: 3,
            ),
            const Divider(
              height: 34,
              thickness: 2,
              color: Color(0xffC7C7C7),
            ),
            const TotalPriceWidget(title: 'Total', value: '\$50.97'),
          ],
        ),
      ),
    );
  }
}
