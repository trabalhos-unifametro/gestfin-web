import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final String title;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final Color? foregroundColor;
  final Color? disabledForegroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final void Function()? onPressed;
  final bool disabled;

  const Button({
    super.key,
    required this.title,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.foregroundColor,
    this.disabledForegroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 18),
    this.onPressed,
    this.disabled = false
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: widget.padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: widget.backgroundColor ?? AppColors.primary.withOpacity(0.9),
            foregroundColor: widget.foregroundColor ?? AppColors.primary,
            surfaceTintColor: widget.surfaceTintColor ?? AppColors.primary,
            shadowColor: widget.shadowColor ?? AppColors.primary.withOpacity(0.5),
            disabledBackgroundColor: widget.disabledBackgroundColor ?? AppColors.primary.withOpacity(0.4),
            disabledForegroundColor: widget.disabledForegroundColor ?? AppColors.primary.withOpacity(0.4)
          ),
          onPressed: widget.disabled == true ? null : (widget.onPressed ?? () {}),
          child: Text(widget.title, style: widget.textStyle ?? GoogleFonts.poppins(fontSize: 20, color: AppColors.whiteSmoke),)
      ),
    );
  }
}