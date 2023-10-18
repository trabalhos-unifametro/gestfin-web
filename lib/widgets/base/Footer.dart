import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.whiteSmoke,
        border: Border(
            top: BorderSide(
                color: Colors.black.withOpacity(0.3),
                width: 1
            )
        ),
      ),
      height: 70,
      child: const Text('Copyright © 2023 GestFin', style: TextStyle(color: AppColors.primary, fontSize: 15),),
    );
  }
}