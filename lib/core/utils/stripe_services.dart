import 'dart:async';

import 'package:check_out_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/Features/checkout/data/models/payment_intent_respons_model/payment_intent_response_model/payment_intent_response_model.dart';
import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:check_out_app/core/utils/api_services.dart';

class StripeServices {
  // declare object from APi Service
  final ApiServices apiServices = ApiServices();

  // createPaymentIntentMethod
  Future<PaymentIntentResponseModel> createPaymentIntentMethod(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var jsonResponse = await apiServices.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentIntentInputModel.toJson(),
        token: ApiKeys.secretkey);

    // transform jsonData to modelData
    // The purpose of this is to convert the JSON data into an instance of PaymentIntentResponseModel
    var paymentIntentResponseModel =
        PaymentIntentResponseModel.fromJson(jsonResponse.data);

    return paymentIntentResponseModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    // 1
    var paymentIntentResponseModel =
        await createPaymentIntentMethod(paymentIntentInputModel);

    // 2
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentResponseModel.clientSecret!);

    //3
    await displayPaymentSheet();
  }

  /*
   - paymentIntentObjectAsReturnType createPaymentIntentMethod ( amount , currency )
   - initPaymentSheet ( paymentIntentClientSecret )
   - prestPaymentSheet()
  */
}
