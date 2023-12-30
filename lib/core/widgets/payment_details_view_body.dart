import 'package:check_out_app/core/widgets/custom_button.dart';
import 'package:check_out_app/core/widgets/custom_credit_card.dart';
import 'package:check_out_app/core/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(child: PaymentMethodsListView()),
      SliverToBoxAdapter(
          child: CustomCreditCard(
        formKey: formKey,
        autovalidateMode: autovalidateMode,
      )),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: const Alignment(1, .1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              onTap: () {
                // if  is specific to the formKey and validate
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  // else  is specific to the autovalidateMode
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Pay',
            ),
          ),
        ),
      ),
    ]);
  }
}
