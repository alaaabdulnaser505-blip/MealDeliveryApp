
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final Icon prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obsc;

  const CustomTextFormField({
    super.key,
    required this.validator,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.obsc = false,
  });

  @override
  State<CustomTextFormField> createState() =>
      _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obsc;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObscure,

      decoration: InputDecoration(
        hintText: widget.hint,

        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff6A6A6A),
        ),

        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.obsc
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                ),
              )
            : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff4F969B),
            width: 1.5,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
