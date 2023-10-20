import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../widgets/components/button.dart';
import '../../widgets/components/input.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();
  bool toggleCurrentPassword = true;
  bool toggleNewPassword = true;
  bool toggleConfirmNewPassword = true;

  void togglePasswordCurrent() {
    setState(() {
      toggleCurrentPassword = !toggleCurrentPassword;
    });
  }

  void toggleNewPasswordFunc() {
    setState(() {
      toggleNewPassword = !toggleNewPassword;
    });
  }

  void toggleConfirmNewPasswordFunc() {
    setState(() {
      toggleConfirmNewPassword = !toggleConfirmNewPassword;
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
                  Text('Redefinir senha', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    constraints: const BoxConstraints(
                      maxWidth: 550
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Input(
                            isObscure: toggleCurrentPassword,
                            controller: currentPassword,
                            hintText: 'Digite sua senha atual',
                            type: TextInputType.visiblePassword,
                            hasSuffix: true,
                            suffixWithBorder: true,
                            onTapSuffixIcon: togglePasswordCurrent,
                            suffixIconData: toggleCurrentPassword ? MdiIcons.eyeOff : MdiIcons.eye,
                          ),
                          const SizedBox(height: 20,),
                          Input(
                            isObscure: toggleNewPassword,
                            controller: newPassword,
                            hintText: 'Digite sua nova senha',
                            type: TextInputType.visiblePassword,
                            hasSuffix: true,
                            suffixWithBorder: true,
                            onTapSuffixIcon: toggleNewPasswordFunc,
                            suffixIconData: toggleNewPassword ? MdiIcons.eyeOff : MdiIcons.eye,
                          ),
                          const SizedBox(height: 20,),
                          Input(
                            isObscure: toggleConfirmNewPassword,
                            controller: confirmNewPassword,
                            hintText: 'Confirme sua nova senha',
                            type: TextInputType.visiblePassword,
                            hasSuffix: true,
                            suffixWithBorder: true,
                            onTapSuffixIcon: toggleConfirmNewPasswordFunc,
                            suffixIconData: toggleConfirmNewPassword ? MdiIcons.eyeOff : MdiIcons.eye,
                          ),
                          const SizedBox(height: 20,),
                          const Button(
                            title: 'Salvar nova senha'
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