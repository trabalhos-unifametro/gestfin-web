import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';

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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Meus objetivos', style: TextStyle(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Adicione objetivos, metas ou projeções que você deseja alcançar e informe o valor', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('que deseja reservar por mês para este objetivo, e veja em quanto tempo você irá', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),),
                  Text('realizá-lo.', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),)
                ],
              ),
            ),
          ],
        )
    );
  }
}