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
    1. Set up Stripe [Server Side] [Client Side]
      1-  Create account => https://dashboard.stripe.com/register [Server Side] [Client Side]
    
    2. Add an endpoint [Server Side]
      2- create payment intent (amount , currency)
      
    3. Integrate the payment sheet [Client Side]
      3-  initPaymentSheet ( paymentIntentClientSecret )



                  Summary:
  1- Create account => https://dashboard.stripe.com/register 
  2- paymentIntentObjectAsReturnType createPaymentIntentMethod ( amount , currency )
  3- initPaymentSheet ( paymentIntentClientSecret ) 

        */



