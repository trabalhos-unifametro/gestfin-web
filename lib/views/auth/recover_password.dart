import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            if (indexTab == 0) Step0()
            else if (indexTab == 1) Step1()
            else if (indexTab == 2) Step2()
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

  Widget Step0() {
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
          const Text('Recuperação de senha', style: TextStyle(color: Colors.white, fontSize: 20),),
          const SizedBox(height: 30,),
          const Text('Informe seu email abaixo e enviaremos um código de verificação para recuperar sua senha.', style: TextStyle(color: Colors.white, fontSize: 15),),
          const SizedBox(height: 30,),
          Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black54,
                  controller: email,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                  decoration: InputDecoration(
                    hintText: 'Informe seu email',
                    hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('Próximo', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                    onTap: () {
                      nextStep();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Step1() {
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
          const Text('Verificação do código', style: TextStyle(color: Colors.white, fontSize: 20),),
          const SizedBox(height: 30,),
          const Text('Informe abaixo o código de verificação que enviamos ao seu email. Confira na caixa de entrada e spam.', style: TextStyle(color: Colors.white, fontSize: 15),),
          const SizedBox(height: 30,),
          Form(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 5,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black54,
                  controller: code,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 20,
                    color: AppColors.primary,
                  ),
                  decoration: InputDecoration(
                    hintText: '_ _ _ _ _',
                    hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: 20),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('Próximo', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                    onTap: () {
                      nextStep();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Step2() {
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
          const Text('Redefinir senha', style: TextStyle(color: Colors.white, fontSize: 20),),
          const SizedBox(height: 30,),
          const Text('Informe abaixo sua nova senha e confirme ela antes de salvar.', style: TextStyle(color: Colors.white, fontSize: 15),),
          const SizedBox(height: 30,),
          Form(
            child: Column(
              children: [
                TextFormField(
                  obscureText: toggleNewPassword,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.black54,
                  controller: newPassword,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                  decoration: InputDecoration(
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Icon(toggleNewPassword ? MdiIcons.eyeOff : MdiIcons.eye, size: 20, color: Colors.black54,),
                        onTap: () {
                          changeTogglePassword();
                        },
                      ),
                    ),
                    hintText: 'Nova senha',
                    hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  obscureText: toggleConfirmNewPassword,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.black54,
                  controller: confirmNewPassword,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                  decoration: InputDecoration(
                    suffixIcon: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Icon(toggleConfirmNewPassword ? MdiIcons.eyeOff : MdiIcons.eye, size: 20, color: Colors.black54,),
                        onTap: () {
                          changeToggleConfirmPassword();
                        },
                      ),
                    ),
                    hintText: 'Confirme sua senha',
                    hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                    fillColor: Colors.white.withOpacity(0.5),
                    filled: true,
                    counterText: '',
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('Salvar', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                    onTap: () {
                      nextStep();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}