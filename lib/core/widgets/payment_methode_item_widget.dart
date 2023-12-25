import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  final bool isActive;
  const PaymentMethodItemWidget({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.5,
              color: isActive ? const Color(0xFF34A853) : Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xFF34A853) : Colors.grey,
            blurRadius: 4,
            // offset: Offset(0, 0),
            // spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/master_card.svg',
            // height: 24,
          ),
        ),
      ),
    );
  }
}
