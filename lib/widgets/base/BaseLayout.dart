import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/Footer.dart';
import 'package:go_router/go_router.dart';

import '../../services/session.dart';

class BaseLayout extends StatefulWidget {
  Widget body;
  BaseLayout({super.key, required this.body});

  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  late double heightTopBar = 100;
  final List<String> items = [
    'Meus dados',
    'Redefinir senha',
    'Sair',
  ];
  final List<int> indexes = [0, 1, 2];
  String? selectedValue;
  Session session = Session();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        toolbarHeight: heightTopBar,
        backgroundColor: AppColors.primary,
        titleSpacing: 0,
        title: Container(
          color: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/png/logo.png', fit: BoxFit.cover, width: 220,),
              signInOrRegister()
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.whiteSmoke,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 170,
                ),
                child: widget.body,
              ),
              const Footer()
            ],
          ),
        ),
      )
    );
  }

  void selectMenuOptions(int? i) {
    switch(i) {
      case 0:
        context.go('/meus-dados');
        break;
      case 1:
        context.go('/redefinir-senha');
        break;
      case 2:
        session.destroy()
        .then((value) {
          if (value) {
            context.go('/auth/login');
          }
        });
        break;
      default:
        print('valor não identificado: $i');
    }
  }

  Widget signInOrRegister() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: const Text('Entre',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                        color: AppColors.whiteSmoke,
                        offset: Offset(0, -3))
                  ],
                  decorationColor: AppColors.whiteSmoke,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  color: Colors.transparent
              ),
            ),
            onTap: () {
              context.go('/auth/login');
            },
          ),
        ),
        const Text('ou', style: TextStyle(fontSize: 15, color: AppColors.whiteSmoke),),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: const Text('Cadastre-se',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                        color: AppColors.whiteSmoke,
                        offset: Offset(0, -3))
                  ],
                  decorationColor: AppColors.whiteSmoke,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  color: Colors.transparent
              ),
            ),
            onTap: () {
              context.go('/auth/login');
            },
          ),
        ),
      ],
    );
  }

  Widget menuOptions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Bem-vindo de volta,',
          style: TextStyle(fontSize: 15, color: AppColors.whiteSmoke),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            isExpanded: true,
            hint: const Text('NOME DO USUÁRIO AQUI',
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(color: AppColors.whiteSmoke, offset: Offset(0, -3))
                ],
                decorationColor: AppColors.whiteSmoke,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                color: Colors.transparent
              ),
            ),
            items: indexes.map((int i) => DropdownMenuItem<int>(
              alignment: Alignment.center,
              value: i,
              child: Text(
                items[i],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            )).toList(),
            onChanged: (int? i) {
              selectMenuOptions(i);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 0),
              height: 40,
              width: 200,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}