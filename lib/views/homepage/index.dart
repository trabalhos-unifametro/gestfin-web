import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool hoverBtn1 = false;
  bool hoverBtn2 = false;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      body: Column(
        children: [
          Container(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Olá, bem-vindo a ', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke),),
                    Text('GESTFIN!', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),)
                  ],
                ),
                Text('Seu novo caminho para se organizar', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke),),
                Text('financeiramente de maneira simples e grátis.', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (hover) {
                          setState(() {
                            hoverBtn1 = true;
                          });
                        },
                        onExit: (exit) {
                          setState(() {
                            hoverBtn1 = false;
                          });
                        },
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops:  const [0.05, 0.05,],
                                  colors: [AppColors.yellowGold, hoverBtn1 ? AppColors.primary.withOpacity(0.95) : AppColors.primary]
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Conhecer GESTFIN', style: GoogleFonts.poppins(color: AppColors.whiteSmoke, fontSize: 18),),
                                    Text('Aqui você irá conhecer melhor como a GestFin', style: GoogleFonts.poppins(color: AppColors.whiteSmoke, fontSize: 15),),
                                    Text('pode ajudar você a gerir suas despesas.', style: GoogleFonts.poppins(color: AppColors.whiteSmoke, fontSize: 15),),
                                  ],
                                ),
                                const Icon(Icons.chevron_right_outlined, size: 40, color: AppColors.whiteSmoke,)
                              ],
                            ),
                          ),
                          onTap: () {
                            context.go('/sobre');
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (hover) {
                          setState(() {
                            hoverBtn2 = true;
                          });
                        },
                        onExit: (exit) {
                          setState(() {
                            hoverBtn2 = false;
                          });
                        },
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops:  const [0.05, 0.05,],
                                  colors: [AppColors.yellowGold, hoverBtn2 ? AppColors.primary.withOpacity(0.95) : AppColors.primary]
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Preços de ações, criptos e variações', style: GoogleFonts.poppins(color: AppColors.whiteSmoke, fontSize: 18),),
                                    Text('Aqui você irá poder ver as pirncipais ações, criptos e as', style: GoogleFonts.poppins(color: AppColors.whiteSmoke, fontSize: 15),),
                                    Text('variações em tempo real.', style: GoogleFonts.poppins(color: AppColors.whiteSmoke, fontSize: 15),),
                                  ],
                                ),
                                const Icon(Icons.chevron_right_outlined, size: 40, color: AppColors.whiteSmoke,)
                              ],
                            ),
                          ),
                          onTap: () {
                            context.go('/mercado-de-investimento');
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Nossos serviços', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('images/png/bkg-card-service-1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Organizar despesas',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.whiteSmoke,
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Text('Aqui você irá definir suas despesas do mês, e terá uma visão e dicas de como se organizar melhor.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14,
                                      color: AppColors.whiteSmoke
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.go('/organizar-despesas');
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('images/png/bkg-card-service-2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Meus objetivos',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.whiteSmoke,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text('Aqui você irá definir seus objetivos financeiros, e de acordo com seu perfil, vamos calcular o melhor caminho para alcançá-lo.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14,
                                      color: AppColors.whiteSmoke
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.go("/meus-objetivos");
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('images/png/bkg-card-service-3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sugestões de investimento',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.whiteSmoke,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text('Aqui vamos nos basear no seu perfil para encontrarmos os melhores investimentos de acordo com o seu gosto.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14,
                                      color: AppColors.whiteSmoke
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.go('/investimentos');
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            height: 200,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('images/png/bkg-card-service-4.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('50%, 30% e 20%',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.whiteSmoke,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text('Conheça aqui o método 50, 30, 20, que serve para auxiliar na organização do seu orçamento.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 14,
                                      color: AppColors.whiteSmoke
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.go('/metodo-basico');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}