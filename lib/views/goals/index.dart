import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              constraints: const BoxConstraints(
                minHeight: 300,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/png/banner-objetivos.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Meus objetivos', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Adicione objetivos, metas ou projeções que você deseja alcançar e informe o valor', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('que deseja reservar por mês para este objetivo, e veja em quanto tempo você irá', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('realizá-lo.', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),)
                ],
              ),
            ),
          ],
        )
    );
  }
}