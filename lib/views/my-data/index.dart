import 'package:flutter/material.dart';
import 'package:gestfin_web/services/user_service.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/auth.dart';
import '../../services/config.dart';
import '../../widgets/components/button.dart';
import '../../widgets/components/input.dart';
import '../../widgets/components/select.dart';

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
  String? selectedValue;
  final List<String> genders = [
    'Masculino',
    'Feminino'
  ];

  @override
  void initState() {
    getMyData();
    super.initState();
  }

  Future<void> getMyData() async {
    Response data = await UserService().findMyData();
    User user = User.fromJson(data.response);
    name.text = user.name ?? '';
    gender.text = user.gender ?? '';
    email.text = user.email ?? '';
    cellphone.text = user.cellphone ?? '';
    telephone.text = user.telephone ?? '';
    dateBirth.text = user.dateBirth.toString() ?? '';
  }

  void onTapInputName() {
    setState(() => editName = !editName);
  }

  void onTapInputEmail() {
    setState(() => editEmail = !editEmail);
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

  void onTapSelectGender() {
    setState(() => editGender = !editGender);
  }

  void onChangedSelectGender(String? value) {
    setState(() {
      selectedValue = value;
    });
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Meus dados', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 8,
                              child: Column(
                                children: [
                                  Input(
                                    fillColor: editName ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editName,
                                    controller: name,
                                    hintText: 'Nome completo do usuário',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputName,
                                    suffixIconData: editName ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                  const SizedBox(height: 30,),
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 3,
                                        child: Select(
                                          items: genders,
                                          selectedValue: selectedValue,
                                          hintText: 'Gênero',
                                          onChanged: onChangedSelectGender,
                                          hasSuffix: true,
                                          suffixWithBorder: true,
                                          onTapSuffixIcon: onTapSelectGender,
                                          isEnabled: editGender,
                                          fillColor: AppColors.whiteSmoke,
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
                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                  Input(
                                    fillColor: editDate ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editDate,
                                    controller: dateBirth,
                                    hintText: 'Data de nascimento: DD/MM/AAAA',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputDate,
                                    suffixIconData: editDate ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 30,),
                            Flexible(
                              flex: 4,
                              child: Column(
                                children: [
                                  Input(
                                    fillColor: editEmail ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editEmail,
                                    controller: email,
                                    hintText: 'Email',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputEmail,
                                    suffixIconData: editEmail ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                  const SizedBox(height: 30,),
                                  Input(
                                    fillColor: editTel ? AppColors.whiteSmoke : Colors.black.withOpacity(0.5),
                                    isEnabled: editTel,
                                    controller: telephone,
                                    hintText: '(00) 0000-0000',
                                    hasSuffix: true,
                                    suffixWithBorder: true,
                                    onTapSuffixIcon: onTapInputTel,
                                    suffixIconData: editTel ? MdiIcons.checkAll : MdiIcons.pencil,
                                  ),
                                  const SizedBox(height: 30,),
                                  const Button(
                                    title: 'Redefinir minha senha'
                                  ),
                                ],
                              ),
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