import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/components/table_simple.dart';

class InvestmentmarketPage extends StatefulWidget {
  const InvestmentmarketPage({super.key});

  @override
  State<InvestmentmarketPage> createState() => _InvestmentmarketPageState();
}

class _InvestmentmarketPageState extends State<InvestmentmarketPage> {

  final List<String> headerCryptoCurrency = [
    'Moeda',
    'Valor de mercado',
    'Valor de mercado',
    'Preço R\$ (P/ uni.)',
  ];

  final List<List<Widget>> itemsCryptoCurrency = [
    [
      Text('Moeda 1', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 100.000.000,00', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 63,90', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+ 3,76%', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.success),),
          const SizedBox(width: 8,),
          Icon(
            MdiIcons.arrowUpCircle,
            size: 15,
            color: AppColors.success,
          )
        ],
      ),
    ],
    [
      Text('Moeda 1', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 100.000.000,00', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 63,90', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+ 3,76%', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.success),),
          const SizedBox(width: 8,),
          Icon(
            MdiIcons.arrowUpCircle,
            size: 15,
            color: AppColors.success,
          )
        ],
      ),
    ],
    [
      Text('Moeda 1', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 100.000.000,00', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 63,90', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+ 3,76%', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.success),),
          const SizedBox(width: 8,),
          Icon(
            MdiIcons.arrowUpCircle,
            size: 15,
            color: AppColors.success,
          )
        ],
      ),
    ],
    [
      Text('Moeda 1', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 100.000.000,00', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 63,90', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+ 3,76%', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.success),),
          const SizedBox(width: 8,),
          Icon(
            MdiIcons.arrowUpCircle,
            size: 15,
            color: AppColors.success,
          )
        ],
      ),
    ],
    [
      Text('Moeda 1', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 100.000.000,00', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 63,90', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('+ 3,76%', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.success),),
          const SizedBox(width: 8,),
          Icon(
            MdiIcons.arrowUpCircle,
            size: 15,
            color: AppColors.success,
          )
        ],
      ),
    ],
    [
      Text('Moeda 2', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 105.000.000,00', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Text('R\$ 87,11', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primary),),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('- 3,76%', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.danger),),
          const SizedBox(width: 8,),
          Icon(
            MdiIcons.arrowDownCircle,
            size: 15,
            color: AppColors.danger,
          )
        ],
      ),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              constraints: const BoxConstraints(
                minHeight: 300,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/png/banner-criptos.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Criptomoedas e Ações', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Aqui você irá poder ver as pirncipais ações, criptos e as variações em tempo real.', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Principais criptomoedas', style: GoogleFonts.poppins(fontSize: 22),),
                  const SizedBox(height: 10,),
                  TableSimple(
                    sHeaders: headerCryptoCurrency,
                    wItems: itemsCryptoCurrency,
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}