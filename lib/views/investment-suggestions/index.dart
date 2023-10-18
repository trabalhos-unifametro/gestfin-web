import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';

class InvestmentSuggestionsPage extends StatefulWidget {
  const InvestmentSuggestionsPage({super.key});

  @override
  State<InvestmentSuggestionsPage> createState() => _InvestmentSuggestionsPageState();
}

class _InvestmentSuggestionsPageState extends State<InvestmentSuggestionsPage> {

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
                  image: AssetImage('images/png/banner-investimentos.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Sugestões de investimento', style: TextStyle(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Aqui vamos nos basear no seu perfil para encontrarmos os melhores investimentos', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('de acordo com o seu gosto.', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),),
                ],
              ),
            ),
          ],
        )
    );
  }
}