import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';

class AppButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor, textColor;
  final String? text;
  final bool isLoading;
  final double? textSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;
  const AppButtonWidget({
    super.key,
    this.onTap,
    this.buttonColor,
    this.text,
    this.textColor,
    this.isLoading = false,
    this.textSize = 18,
    this.fontWeight,
    this.padding,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading || isDisabled ? null : onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: isDisabled ? borderColor : buttonColor ?? primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: padding ?? const EdgeInsets.all(8),
        child: Center(
          child: isLoading
              ? Container(
                  padding: const EdgeInsets.all(4),
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  text ?? '',
                  style: TextStyle(
                    color: isDisabled ? disabledColor:  textColor ?? whiteColor,
                    fontSize: textSize,
                    fontWeight: fontWeight ?? FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
