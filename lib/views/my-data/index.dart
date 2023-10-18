import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/components/input.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController telephone = TextEditingController();
  final TextEditingController cellphone = TextEditingController();
  final TextEditingController dateBirth = TextEditingController();
  bool hoverBtn = false;
  bool editEmail = false;
  bool editName = false;
  bool editGender = false;
  bool editTel = false;
  bool editCell = false;
  bool editDate = false;

  void onTapInputName() {
    setState(() => editName = !editName);
  }

  void onTapInputEmail() {
    setState(() => editEmail = !editEmail);
  }

  void onTapInputGender() {
    setState(() => editGender = !editGender);
  }

  void onTapInputTel() {
    setState(() => editTel = !editTel);
  }

  void onTapInputCell() {
    setState(() => editCell = !editCell);
  }

  void onTapInputDate() {
    setState(() => editDate = !editDate);
  }

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
                  image: AssetImage('images/png/banner-homepage.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Meus dados', style: TextStyle(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 7,
                                  child: Input(
                                    fillColor: editName ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editName,
                                    controller: name,
                                    hintText: 'Nome completo do usuário',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputName,
                                    suffixIconData: editName ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                ),
                                const SizedBox(width: 30,),
                                Flexible(
                                  flex: 5,
                                  child: Input(
                                    fillColor: editEmail ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editEmail,
                                    controller: email,
                                    hintText: 'Email',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputEmail,
                                    suffixIconData: editEmail ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Input(
                                    fillColor: editGender ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editGender,
                                    controller: gender,
                                    hintText: 'Gênero',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputGender,
                                    suffixIconData: editGender ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                ),
                                const SizedBox(width: 30,),
                                Flexible(
                                  flex: 4,
                                  child: Input(
                                    fillColor: editCell ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editCell,
                                    controller: cellphone,
                                    hintText: '(00) 0 0000-0000',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputCell,
                                    suffixIconData: editCell ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                ),
                                const SizedBox(width: 30,),
                                Flexible(
                                  flex: 5,
                                  child: Input(
                                    fillColor: editTel ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editTel,
                                    controller: telephone,
                                    hintText: '(00) 0000-0000',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputTel,
                                    suffixIconData: editTel ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}