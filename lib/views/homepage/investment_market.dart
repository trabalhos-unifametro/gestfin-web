import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';

class InvestmentmarketPage extends StatefulWidget {
  const InvestmentmarketPage({super.key});

  @override
  State<InvestmentmarketPage> createState() => _InvestmentmarketPageState();
}

class _InvestmentmarketPageState extends State<InvestmentmarketPage> {

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
                  image: AssetImage('images/png/banner-criptos.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Criptomoedas e Ações', style: TextStyle(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Aqui você irá poder ver as pirncipais ações, criptos e as variações em tempo real.', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),),
                ],
              ),
            ),
          ],
        )
    );
  }
}