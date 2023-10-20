import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {

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
                  image: AssetImage('images/png/banner-despesas.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Organizar despesas', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Adicione primeiro a média de dinheiro que você recebe todo mês e logo após,', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('adicione as despesas mensais, tais como, conta de luz, água, telefone e etc.', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),)
                ],
              ),
            ),
          ],
        )
    );
  }
}