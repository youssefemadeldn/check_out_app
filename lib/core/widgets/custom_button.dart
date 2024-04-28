import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff34a853),
          borderRadius: BorderRadius.circular(15),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Center(
                child: Text(
                  text,
                  style: Styles.style22,
                ),
              ),
      ),
    );
  }
}
