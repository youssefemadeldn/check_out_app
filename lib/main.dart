import 'package:check_out_app/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCartView(),
    );
  }
}



        /*
         Main Steps:
  1-  Create account => https://dashboard.stripe.com/register
  2- create payment intent (amount , currency)

        */