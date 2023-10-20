import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/components/button.dart';
import '../../widgets/components/input.dart';
import '../../widgets/components/select.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController emailRegister = TextEditingController();
  final TextEditingController genderRegister = TextEditingController();
  final TextEditingController dateBirthRegister = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordRegister = TextEditingController();
  String? selectedValue;
  bool togglePassword = true;
  bool togglePasswordRegister = true;
  bool remember = false;

  final List<String> genders = [
    'Masculino',
    'Feminino'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    emailRegister.dispose();
    genderRegister.dispose();
    dateBirthRegister.dispose();
    passwordRegister.dispose();
    super.dispose();
  }

  void changeTogglePassword() {
    setState(() {
      togglePassword = !togglePassword;
    });
  }

  void changeTogglePasswordRegister() {
    setState(() {
      togglePasswordRegister = !togglePasswordRegister;
    });
  }

  Color getColorCheckbox(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white70;
    }
    return Colors.white60;
  }

  void onChangedSelect(String? value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/png/background-auth.png'),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              color: Colors.transparent,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Image.asset('images/png/logo.png', fit: BoxFit.cover, width: 220,),
                  onTap: () {
                    context.go('/');
                  },
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 900
              ),
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text('Entre', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: Form(
                            child: Column(
                              children: [
                                Input(
                                  fillColor: Colors.white.withOpacity(0.5),
                                  controller: email,
                                  hintText: 'Informe seu email',
                                  fontColor: AppColors.whiteSmoke,
                                  type: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 40,),
                                Input(
                                  isObscure: togglePassword,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  controller: password,
                                  hintText: 'Informe sua senha',
                                  fontColor: AppColors.whiteSmoke,
                                  type: TextInputType.visiblePassword,
                                  hasSuffix: true,
                                  onTapSuffixIcon: changeTogglePassword,
                                  suffixIconData: togglePassword ? MdiIcons.eyeOff : MdiIcons.eye,
                                ),
                                const SizedBox(height: 40,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.resolveWith(getColorCheckbox),
                                          value: remember,
                                          side: const BorderSide(
                                            color: Colors.transparent
                                          ),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              remember = value!;
                                            });
                                          },
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Text('Lembrar de mim.', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),),
                                            onTap: () {
                                              setState(() {
                                                remember = !remember;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        child: Text('Esqueceu sua senha?', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),),
                                        onTap: () {
                                          context.go('/auth/recuperar-senha');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40,),
                                const Button(
                                  title: 'Entrar',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 380,
                    width: 1,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text('Cadastre-se', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(50),
                          child: Form(
                            child: Column(
                              children: [
                                Input(
                                  fillColor: Colors.white.withOpacity(0.5),
                                  controller: emailRegister,
                                  hintText: 'Informe seu email',
                                  fontColor: AppColors.whiteSmoke,
                                  type: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 35,),
                                Input(
                                  isObscure: togglePasswordRegister,
                                  fillColor: Colors.white.withOpacity(0.5),
                                  controller: passwordRegister,
                                  hintText: 'Informe uma senha',
                                  fontColor: AppColors.whiteSmoke,
                                  type: TextInputType.visiblePassword,
                                  hasSuffix: true,
                                  onTapSuffixIcon: changeTogglePasswordRegister,
                                  suffixIconData: togglePasswordRegister ? MdiIcons.eyeOff : MdiIcons.eye,
                                ),
                                const SizedBox(height: 35,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Select(
                                        items: genders,
                                        selectedValue: selectedValue,
                                        hintText: 'Gênero',
                                        onChanged: onChangedSelect,
                                        fillColor: Colors.white.withOpacity(0.5),
                                        fontColor: AppColors.whiteSmoke,
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Flexible(
                                      child: Input(
                                        fillColor: Colors.white.withOpacity(0.5),
                                        controller: dateBirthRegister,
                                        hintText: 'Data de nascimento',
                                        fontColor: AppColors.whiteSmoke,
                                        type: TextInputType.datetime,
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 35,),
                                const Button(
                                  title: 'Cadastrar',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}