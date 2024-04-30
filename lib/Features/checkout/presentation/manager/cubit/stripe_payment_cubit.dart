import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:check_out_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/Features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter/material.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final CheckoutRepo checkoutRepo;
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());

  Future mackPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (l) => emit(StripePaymentFailure(l.errMessage)),
      (r) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
