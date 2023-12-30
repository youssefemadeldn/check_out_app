import 'package:flutter/material.dart';

class BackgroundOfThankYouCard extends StatelessWidget {
  const BackgroundOfThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
