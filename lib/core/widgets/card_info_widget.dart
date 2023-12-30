import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 23,
          ),
          SvgPicture.asset('assets/images/master_card_logo.svg'),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' Credit Card',
                style: Styles.style18,
              ),
              Text(
                '           Mastercard **78',
                style: Styles.style18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
