import 'package:check_out_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/Features/checkout/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:check_out_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:check_out_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        //  2
        if (state is StripePaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
        }

        if (state is StripePaymentFailure) {
          SnackBar snackBar = SnackBar(
            content: Text(state.errMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      //  1
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(amount: '100', currency: "USD");
              BlocProvider.of<StripePaymentCubit>(context).mackPayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is StripePaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }
}
