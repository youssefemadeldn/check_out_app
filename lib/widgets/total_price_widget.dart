import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
  final String title, value;
  const TotalPriceWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ],
    );
  }
}
