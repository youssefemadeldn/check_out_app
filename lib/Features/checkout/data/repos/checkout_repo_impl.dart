import 'package:check_out_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/Features/checkout/data/repos/checkout_repo.dart';
import 'package:check_out_app/core/errors/failures.dart';
import 'package:check_out_app/core/utils/stripe_services.dart';
import 'package:dartz/dartz.dart';

class CheckoutImpl extends CheckoutRepo {
  final StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeServices.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
