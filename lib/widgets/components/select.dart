import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Select extends StatefulWidget {
  final List<String> items;
  final bool hasSuffix;
  final bool suffixWithBorder;
  final String hintText;
  final bool isEnabled;
  final Color fillColor;
  final Color fontColor;
  final double fontSize;
  final Alignment alignment;
  final IconData? suffixIconData;
  final Function? onTapSuffixIcon;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  const Select({
    super.key,
    required this.items,
    this.hasSuffix = false,
    this.suffixWithBorder = false,
    this.hintText = '',
    this.isEnabled = true,
    this.fillColor = AppColors.whiteSmoke,
    this.fontColor = AppColors.primary,
    this.fontSize = 15,
    this.alignment = Alignment.centerLeft,
    this.suffixIconData,
    this.onTapSuffixIcon,
    this.selectedValue,
    this.onChanged
  });

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropdownButton2<String>(
          isExpanded: true,
          underline: const SizedBox(),
          customButton: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 48,
            padding: EdgeInsets.only(left: 20, right: widget.hasSuffix ? (widget.suffixWithBorder ? 60 : 40) : 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: widget.isEnabled ? widget.fillColor : Colors.black.withOpacity(0.5),
            ),
            child: Text(widget.selectedValue ?? widget.hintText,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: widget.fontSize,
                color: widget.fontColor,
              ),
            ),
          ),
          value: widget.selectedValue,
          items: widget.isEnabled ? widget.items.map((String item) => DropdownMenuItem<String>(
            enabled: widget.isEnabled,
            alignment: widget.alignment,
            value: item,
            child: Text(
              item,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: widget.fontSize,
                color: AppColors.primary
              ),
            ),
          )).toList() : null,
          onChanged: widget.onChanged,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 0),
            height: 50,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 50,
          ),
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
        height: 48,
        width: 48,
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
        height: 48,
        width: 48,
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