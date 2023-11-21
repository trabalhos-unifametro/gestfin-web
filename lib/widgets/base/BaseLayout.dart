import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/Footer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/index.dart';
import '../../services/session.dart';
import '../../utils/alerts.dart';

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
  bool isLoggedIn = false;
  late AppState appState;

  @override
  void initState() {
    appState = Provider.of<AppState>(context, listen: false);
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
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Image.asset('images/png/logo.png', fit: BoxFit.cover, width: 220,),
                  onTap: () {
                    context.go('/');
                  },
                ),
              ),
              if (appState.isLoggedIn == true) menuOptions()
              else signInOrRegister()
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
        Session.destroy()
        .then((value) {
          if (value) {
            appState.setIsLoggedIn(false);
            context.go('/auth/login');
          } else {
            Alert.show(context, 'Ocorreu um erro ao tentar encerrar essa sessão.', type: TypeAlert.error);
          }
        }).catchError((_) {
          Alert.show(context, 'Ocorreu algum erro ao tentar encerrar essa sessão.', type: TypeAlert.error);
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
            child: Text('Entre',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    const Shadow(
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
        Text('ou', style: GoogleFonts.poppins(fontSize: 15, color: AppColors.whiteSmoke),),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Text('Cadastre-se',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    const Shadow(
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
        Text('Bem-vindo de volta,',
          style: GoogleFonts.poppins(fontSize: 15, color: AppColors.whiteSmoke),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            alignment: Alignment.center,
            isExpanded: true,
            hint: Text(appState.username,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(overflow: TextOverflow.ellipsis,),
                fontSize: 15,
                fontWeight: FontWeight.w700,
                shadows: [
                  const Shadow(color: AppColors.whiteSmoke, offset: Offset(0, -3))
                ],
                decorationColor: AppColors.whiteSmoke,
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                color: Colors.transparent,
              ),
            ),
            items: indexes.map((int i) => DropdownMenuItem<int>(
              alignment: Alignment.center,
              value: i,
              child: Text(
                items[i],
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
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
              width: 180,
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