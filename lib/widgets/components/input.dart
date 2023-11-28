import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final bool hasSuffix;
  final bool suffixWithBorder;
  final String hintText;
  final bool isEnabled;
  final Color fillColor;
  final Color fontColor;
  final TextInputType type;
  final bool isObscure;
  final double fontSize;
  final IconData? suffixIconData;
  final Function? onTapSuffixIcon;
  final int? maxLength;
  final double? textHintLetterSpacing;
  final double? textLetterSpacing;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;

  const Input({
    super.key,
    required this.controller,
    this.hasSuffix = false,
    this.suffixWithBorder = false,
    this.hintText = '',
    this.isEnabled = true,
    this.fillColor = AppColors.whiteSmoke,
    this.fontColor = AppColors.primary,
    this.type = TextInputType.text,
    this.isObscure = false,
    this.fontSize = 15,
    this.suffixIconData,
    this.onTapSuffixIcon,
    this.maxLength,
    this.textHintLetterSpacing,
    this.textLetterSpacing,
    this.textAlign = TextAlign.start,
    this.inputFormatters
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          textAlign: widget.textAlign,
          maxLength: widget.maxLength,
          obscureText: widget.isObscure,
          enabled: widget.isEnabled,
          keyboardType: widget.type,
          cursorColor: Colors.black54,
          controller: widget.controller,
          style: GoogleFonts.poppins(fontSize: widget.fontSize, fontWeight: FontWeight.w400, color: AppColors.primary, letterSpacing: widget.textLetterSpacing),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(fontSize: widget.fontSize, fontWeight: FontWeight.w400, color: widget.fontColor, letterSpacing: widget.textHintLetterSpacing),
            fillColor: widget.fillColor,
            filled: true,
            counterText: '',
            contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: widget.hasSuffix ? (widget.suffixWithBorder ? 60 : 40) : 20),
            labelStyle: GoogleFonts.poppins(color: widget.fontColor, fontWeight: FontWeight.w400, letterSpacing: widget.textLetterSpacing),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                )
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                )
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                )
            ),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  color: Colors.transparent,
                )
            ),
          ),
          inputFormatters: widget.inputFormatters,
        ),
        if (widget.hasSuffix) Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: suffixIcon(),
        )
      ],
    );
  }

  Widget suffixIcon() {
    if (widget.suffixWithBorder) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteSmoke,
          border: Border(
            top: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
            left: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
            right: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
            bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
          ),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5)
          ),
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              widget.onTapSuffixIcon!();
            },
            child: Icon(widget.suffixIconData, size: 20, color: Colors.black54,),
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        color: Colors.transparent,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              widget.onTapSuffixIcon!();
            },
            child: Icon(widget.suffixIconData, size: 20, color: Colors.black54,),
          ),
        ),
      );
    }
  }
}