import 'package:flutter/material.dart';
import 'package:gestfin_web/providers/index.dart';
import 'package:gestfin_web/router/index.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gestfin_web/services/session.dart';
import 'package:provider/provider.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  String? username = '';
  late AppState appState;

  @override
  void initState() {
    appState = Provider.of<AppState>(context, listen: false);
    loadSession();
    super.initState();
  }

  Future<void> loadSession() async {
    isLoggedIn = await Session.isLoggedIn();
    username = await Session.getUsername();
    appState.setUsername(username ?? '');
    appState.setIsLoggedIn(isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GestFin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
