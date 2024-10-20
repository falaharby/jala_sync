import 'package:flutter/material.dart';
import 'package:jala_verification/app/utils/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText, labelText;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  labelText ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : const SizedBox(),
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          cursorHeight: 18,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            hintText: hintText,
            isDense: true,
            filled: true,
            fillColor: whiteColor,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: hintColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: borderColor,
                  width: 1.0,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: borderColor,
                  width: 1.0,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                )),
          ),
        ),
      ],
    );
  }
}
