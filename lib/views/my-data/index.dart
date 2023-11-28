import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gestfin_web/services/user_service.dart';
import 'package:gestfin_web/utils/alerts.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:intl/intl.dart';
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
  var maskCell = MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var maskTel = MaskTextInputFormatter(
      mask: '(##) ####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  var maskDateBirth = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );


  @override
  void initState() {
    getMyData();
    super.initState();
  }

  Future<void> getMyData() async {
    Response data = await UserService().findMyData();
    User user = User.fromJson(data.response);
    name.text = user.name ?? '';
    if (user.gender?.toUpperCase() == 'M') {
      gender.text = 'M';
      selectedValue = 'Masculino';
    } else if (user.gender?.toUpperCase() == 'F') {
      gender.text = 'F';
      selectedValue = 'Feminino';
    }
    email.text = user.email ?? '';
    cellphone.text = user.cellphone ?? '';
    telephone.text = user.telephone ?? '';
    dateBirth.text = user.dateBirth != null ? DateFormat('dd/MM/yyyy').format(user.dateBirth!) : '';
  }

  Future<void> onTapInputName() async {
    if (editName) {
      String? message = validateDateBirth();
      if (message != null) {
        Alert.show(context, message, type: TypeAlert.error);
        setState(() => editName = false);
      } else {
        await UserService().updateUserByColumn("NAME", name.text).then((res) {
          if (res.type == TypeResponse.error) {
            Alert.show(context, res.response, type: TypeAlert.error);
          } else {
            Alert.show(context, "Nome editado!", type: TypeAlert.success);
          }
        });
        setState(() => editName = false);
      }
    } else {
      setState(() => editName = true);
    }
  }

  Future<void> onTapInputEmail() async {
    if (editEmail) {
      String? message = validateDateBirth();
      if (message != null) {
        Alert.show(context, message, type: TypeAlert.error);
        setState(() => editEmail = false);
      } else {
        await UserService().updateUserByColumn("EMAIL", email.text).then((res) {
          if (res.type == TypeResponse.error) {
            Alert.show(context, res.response, type: TypeAlert.error);
          } else {
            Alert.show(context, "Endereço de email editado!", type: TypeAlert.success);
          }
        });
        setState(() => editEmail = false);
      }
    } else {
      setState(() => editEmail = true);
    }
  }

  Future<void> onTapInputTel() async {
    if (editTel) {
      String? message = validateDateBirth();
      if (message != null) {
        Alert.show(context, message, type: TypeAlert.error);
        setState(() => editTel = false);
      } else {
        await UserService().updateUserByColumn("TEL", telephone.text).then((res) {
          if (res.type == TypeResponse.error) {
            Alert.show(context, res.response, type: TypeAlert.error);
          } else {
            Alert.show(context, "Número do telefone editado!", type: TypeAlert.success);
          }
        });
        setState(() => editTel = false);
      }
    } else {
      setState(() => editTel = true);
    }
  }

  Future<void> onTapInputCell() async {
    if (editCell) {
      String? message = validateDateBirth();
      if (message != null) {
        Alert.show(context, message, type: TypeAlert.error);
        setState(() => editCell = false);
      } else {
        await UserService().updateUserByColumn("CELL", cellphone.text).then((res) {
          if (res.type == TypeResponse.error) {
            Alert.show(context, res.response, type: TypeAlert.error);
          } else {
            Alert.show(context, "Número do celular editado!", type: TypeAlert.success);
          }
        });
        setState(() => editCell = false);
      }
    } else {
      setState(() => editCell = true);
    }
  }

  Future<void> onTapInputDate() async {
    if (editDate) {
      String? message = validateDateBirth();
      if (message != null) {
        Alert.show(context, message, type: TypeAlert.error);
        setState(() => editDate = false);
      } else {
        await UserService().updateUserByColumn("DATE_BIRTH", dateBirth.text).then((res) {
          if (res.type == TypeResponse.error) {
            Alert.show(context, res.response, type: TypeAlert.error);
          } else {
            Alert.show(context, "Data de nascimento editada!", type: TypeAlert.success);
          }
        });
        setState(() => editDate = false);
      }
    } else {
      setState(() => editDate = true);
    }
  }

  Future<void> onTapSelectGender() async {
    if (editGender) {
      String? message = validateDateBirth();
      if (message != null) {
        Alert.show(context, message, type: TypeAlert.error);
        setState(() => editGender = false);
      } else {
        await UserService().updateUserByColumn("GENDER", gender.text).then((res) {
          if (res.type == TypeResponse.error) {
            Alert.show(context, res.response, type: TypeAlert.error);
          } else {
            Alert.show(context, "Gênero editado!", type: TypeAlert.success);
          }
        });
        setState(() => editGender = false);
      }
    } else {
      setState(() => editGender = true);
    }
  }

  String? validateDateBirth() {
    if (dateBirth.text == null || dateBirth.text.isEmpty) {
      return 'Por favor, informe sua data de nascimento.';
    }
    final components = dateBirth.text.split("/");
    if (components.length == 3) {
      final day = int.tryParse(components[0]);
      final month = int.tryParse(components[1]);
      final year = int.tryParse(components[2]);
      if (day != null && month != null && year != null) {
        final date = DateTime(year, month, day);
        if (date.year == year && date.month == month && date.day == day) {
          return null;
        }
      }
    }
    return "Data de nascimento inválida.";
  }

  void onChangedSelectGender(String? value) {
    setState(() {
      if (value == 'Masculino') {
        gender.text = 'M';
        selectedValue = value;
      } else if (value == 'Feminino') {
        gender.text = 'F';
        selectedValue = value;
      } else {
        gender.text = '';
        selectedValue = value;
      }
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
                                          inputFormatters: [maskCell],
                                          type: TextInputType.phone,
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
                                    inputFormatters: [maskDateBirth],
                                    type: TextInputType.datetime,
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
                                    inputFormatters: [maskTel],
                                    type: TextInputType.phone,
                                  ),
                                  const SizedBox(height: 30,),
                                  Button(
                                    onPressed: () {
                                      context.go('/redefinir-senha');
                                    },
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