import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/components/button.dart';
import '../../widgets/components/input.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();
  bool toggleNewPassword = true;
  bool toggleConfirmNewPassword = true;
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    code.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    super.dispose();
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
              child:
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Image.asset('images/png/logo.png', fit: BoxFit.cover, width: 220,),
                  onTap: () {
                    context.go('/');
                  },
                ),
              ),
            ),
            const SizedBox(height: 80,),
            if (indexTab == 0) stepZero()
            else if (indexTab == 1) stepOne()
            else if (indexTab == 2) stepTwo()
          ],
        ),
      ),
    );
  }

  void nextStep() {
    setState(() {
      switch(indexTab) {
        case 0:
          indexTab = 1;
          break;
        case 1:
          indexTab = 2;
          break;
        case 2:
          indexTab = 0;
          break;
      }
    });
  }

  void changeTogglePassword() {
    setState(() {
      toggleNewPassword = !toggleNewPassword;
    });
  }

  void changeToggleConfirmPassword() {
    setState(() {
      toggleConfirmNewPassword = !toggleConfirmNewPassword;
    });
  }

  Widget stepZero() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      constraints: const BoxConstraints(
          maxWidth: 450
      ),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text('Recuperação de senha', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),),
          const SizedBox(height: 30,),
          Text('Informe seu email abaixo e enviaremos um código de verificação para recuperar sua senha.', style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
          const SizedBox(height: 30,),
          Form(
            child: Column(
              children: [
                Input(
                  fillColor: Colors.white.withOpacity(0.5),
                  controller: email,
                  hintText: 'Informe seu email',
                  fontColor: AppColors.whiteSmoke,
                  type: TextInputType.emailAddress
                ),
                const SizedBox(height: 40,),
                Button(
                  title: 'Próximo',
                  onPressed: nextStep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stepOne() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      constraints: const BoxConstraints(
          maxWidth: 450
      ),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text('Verificação do código', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),),
          const SizedBox(height: 30,),
          Text('Informe abaixo o código de verificação que enviamos ao seu email. Confira na caixa de entrada e spam.', style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
          const SizedBox(height: 30,),
          Form(
            child: Column(
              children: [
                Input(
                  textAlign: TextAlign.center,
                  fillColor: Colors.white.withOpacity(0.5),
                  controller: code,
                  hintText: '_ _ _ _ _',
                  fontColor: AppColors.whiteSmoke,
                  type: TextInputType.text,
                  fontSize: 18,
                  textLetterSpacing: 20,
                  textHintLetterSpacing: 20,
                  maxLength: 5,
                ),
                const SizedBox(height: 40,),
                Button(
                  title: 'Próximo',
                  onPressed: nextStep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stepTwo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      constraints: const BoxConstraints(
          maxWidth: 450
      ),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Text('Redefinir senha', style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),),
          const SizedBox(height: 30,),
          Text('Informe abaixo sua nova senha e confirme ela antes de salvar.', style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),),
          const SizedBox(height: 30,),
          Form(
            child: Column(
              children: [
                Input(
                  isObscure: toggleNewPassword,
                  fillColor: Colors.white.withOpacity(0.5),
                  controller: newPassword,
                  hintText: 'Nova senha',
                  fontColor: AppColors.whiteSmoke,
                  type: TextInputType.visiblePassword,
                  hasSuffix: true,
                  onTapSuffixIcon: changeTogglePassword,
                  suffixIconData: toggleNewPassword ? MdiIcons.eyeOff : MdiIcons.eye,
                ),
                const SizedBox(height: 30,),
                Input(
                  isObscure: toggleConfirmNewPassword,
                  fillColor: Colors.white.withOpacity(0.5),
                  controller: confirmNewPassword,
                  hintText: 'Confirme sua nova senha',
                  fontColor: AppColors.whiteSmoke,
                  type: TextInputType.visiblePassword,
                  hasSuffix: true,
                  onTapSuffixIcon: changeToggleConfirmPassword,
                  suffixIconData: toggleConfirmNewPassword ? MdiIcons.eyeOff : MdiIcons.eye,
                ),
                const SizedBox(height: 30,),
                Button(
                  title: 'Salvar',
                  onPressed: nextStep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}