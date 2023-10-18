import 'package:gestfin_web/views/expenses/index.dart';
import 'package:go_router/go_router.dart';
import '../views/auth/login.dart';
import '../views/auth/recover_password.dart';
import '../views/basic-method/index.dart';
import '../views/goals/index.dart';
import '../views/homepage/about.dart';
import '../views/homepage/index.dart';
import '../views/homepage/investment_market.dart';
import '../views/investment-suggestions/index.dart';
import '../views/my-data/change_password.dart';
import '../views/my-data/index.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      name: 'HomePage',
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: 'ExpensesPage',
          path: 'organizar-despesas',
          builder: (context, state) => const ExpensesPage(),
        ),
        GoRoute(
          name: 'GoalsPage',
          path: 'meus-objetivos',
          builder: (context, state) => const GoalsPage(),
        ),
        GoRoute(
          name: 'InvestmentSuggestionsPage',
          path: 'investimentos',
          builder: (context, state) => const InvestmentSuggestionsPage(),
        ),
        GoRoute(
          name: 'BasicMethodPage',
          path: 'metodo-basico',
          builder: (context, state) => const BasicMethodPage(),
        ),
        GoRoute(
          name: 'AboutPage',
          path: 'sobre',
          builder: (context, state) => const AboutPage(),
        ),
        GoRoute(
          name: 'InvestmentmarketPage',
          path: 'mercado-de-investimento',
          builder: (context, state) => const InvestmentmarketPage(),
        ),
        GoRoute(
          name: 'MyDataPage',
          path: 'meus-dados',
          builder: (context, state) => const MyDataPage(),
        ),
        GoRoute(
          name: 'ChangePasswordPage',
          path: 'redefinir-senha',
          builder: (context, state) => const ChangePasswordPage(),
        ),
    ]
    ),
    GoRoute(
      name: 'AuthPages',
      path: '/auth',
      redirect: (context, state) {
        return state.fullPath;
      },
      routes: [
        GoRoute(
          name: 'LoginPage',
          path: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: 'RecoverPasswordPage',
          path: 'recuperar-senha',
          builder: (context, state) => const RecoverPasswordPage(),
        ),
      ]
    ),
  ],
);