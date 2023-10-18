import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
  bool hoverBtn = false;

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
                  Text('Redefinir senha', style: TextStyle(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
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
                          TextFormField(
                            obscureText: toggleCurrentPassword,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black54,
                            controller: currentPassword,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    left: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    right: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)
                                  ),
                                ),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Icon(toggleCurrentPassword ? MdiIcons.eyeOff : MdiIcons.eye, size: 20, color: Colors.black54,),
                                    onTap: () {
                                      setState(() {
                                        toggleCurrentPassword = !toggleCurrentPassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              hintText: 'Digite sua senha atual',
                              hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                              fillColor: AppColors.whiteSmoke,
                              filled: true,
                              counterText: '',
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                              labelStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w400),
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
                          const SizedBox(height: 20,),
                          TextFormField(
                            obscureText: toggleNewPassword,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black54,
                            controller: newPassword,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    left: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    right: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                  ),
                                ),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Icon(toggleNewPassword ? MdiIcons.eyeOff : MdiIcons.eye, size: 20, color: Colors.black54,),
                                    onTap: () {
                                      setState(() {
                                        toggleNewPassword = !toggleNewPassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              hintText: 'Digite sua nova senha',
                              hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                              fillColor: AppColors.whiteSmoke,
                              filled: true,
                              counterText: '',
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                              labelStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w400),
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
                          const SizedBox(height: 20,),
                          TextFormField(
                            obscureText: toggleConfirmNewPassword,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black54,
                            controller: confirmNewPassword,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                            decoration: InputDecoration(
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    left: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    right: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                    bottom: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5)
                                  ),
                                ),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    child: Icon(toggleConfirmNewPassword ? MdiIcons.eyeOff : MdiIcons.eye, size: 20, color: Colors.black54,),
                                    onTap: () {
                                      setState(() {
                                        toggleConfirmNewPassword = !toggleConfirmNewPassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              hintText: 'Confirme sua nova senha',
                              hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.primary),
                              fillColor: AppColors.whiteSmoke,
                              filled: true,
                              counterText: '',
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                              labelStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w400),
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
                          const SizedBox(height: 20,),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (hover) {
                              setState(() {
                                hoverBtn = true;
                              });
                            },
                            onExit: (exit) {
                              setState(() {
                                hoverBtn = false;
                              });
                            },
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: hoverBtn ? AppColors.primary : AppColors.primary.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text('Salvar nova senha', style: TextStyle(fontSize: 18, color: AppColors.whiteSmoke),),
                              ),
                              onTap: () {},
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