import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicMethodPage extends StatefulWidget {
  const BasicMethodPage({super.key});

  @override
  State<BasicMethodPage> createState() => _BasicMethodPageState();
}

class _BasicMethodPageState extends State<BasicMethodPage> {

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
                  image: AssetImage('images/png/banner-metodo-basico.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('50%, 30% e 20%', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Conheça aqui o método 50, 30, 20, que serve para auxiliar na organização do seu', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('orçamento.', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),)
                ],
              ),
            ),
          ],
        )
    );
  }
}