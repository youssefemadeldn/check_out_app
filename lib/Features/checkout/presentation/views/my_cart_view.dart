import 'package:check_out_app/Features/checkout/data/repos/checkout_repo.dart';
import 'package:check_out_app/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:check_out_app/Features/checkout/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:check_out_app/core/widgets/custom_app_bar_widget.dart';
import 'package:check_out_app/core/widgets/custom_button.dart';
import 'package:check_out_app/core/widgets/payment_method_bottom_sheet.dart';
import 'package:check_out_app/widgets/order_info_item.dart';
import 'package:check_out_app/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(child: Image.asset('assets/images/item_in_basket.png')),
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
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              text: 'Complete Payment',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const PaymentDetailsView();
                //     },
                //   ),
                // );
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => StripePaymentCubit(CheckoutImpl()),
                        child: const PaymentMethodBottomSheet(),
                      );
                    });
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
