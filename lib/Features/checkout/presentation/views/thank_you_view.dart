import 'package:check_out_app/core/widgets/custom_app_bar_widget.dart';
import 'package:check_out_app/core/widgets/thank_you_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: const ThankYouBody(),
    );
  }
}
