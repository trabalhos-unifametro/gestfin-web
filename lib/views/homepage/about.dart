import 'package:flutter/material.dart';
import 'package:gestfin_web/utils/app_colors.dart';
import 'package:gestfin_web/widgets/base/BaseLayout.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width,
              constraints: const BoxConstraints(
                minHeight: 300,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/png/banner-sobre.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Sobre a GESTFIN', style: GoogleFonts.poppins(fontSize: 25, color: AppColors.whiteSmoke, fontWeight: FontWeight.bold),),
                  Text('Aqui você irá conhecer melhor quem é a GestFin e qual é a nossa missão.', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.whiteSmoke),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quem somos?', style: GoogleFonts.poppins(fontSize: 22),),
                  const SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('A GestFIn é uma plataforma web de fácil acesso que oferece serviços abrangentes de educação financeira e investimento, direcionados especialmente para aqueles que estão dando os primeiros passos no mundo das finanças. A plataforma capacita os usuários a gerenciar suas despesas com simplicidade, fornecendo uma visão completa de seu perfil financeiro, orientando-os sobre a aplicação da regra clássica 50-30-20 e oferecendo sugestões de investimento adaptadas ao perfil individual de cada usuário.', style: GoogleFonts.poppins(fontSize: 15),),
                  ),
                  const SizedBox(height: 15,),
                  Text('Nossa missão', style: GoogleFonts.poppins(fontSize: 22),),
                  const SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('A missão da plataforma GestFIn é proporcionar a todos, em especial aqueles que estão no início de sua jornada no mundo das finanças, uma ferramenta de educação financeira e investimento acessível e completa. Através de nossa plataforma web amigável, capacitamos os usuários a gerenciarem suas finanças com facilidade. Oferecemos uma visão detalhada de seu perfil financeiro, orientação sobre a aplicação da regra clássica 50-30-20 e apresentamos sugestões de investimento personalizadas, alinhadas com o perfil financeiro de cada indivíduo. Com a GestFIn, a educação financeira e o caminho para o sucesso financeiro estão ao alcance de todos.', style: GoogleFonts.poppins(fontSize: 15),),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}