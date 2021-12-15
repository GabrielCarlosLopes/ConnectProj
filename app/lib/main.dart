import 'package:connect_proj/pages/definition_screen/axillary_pages/ideas_list.dart';
import 'package:connect_proj/pages/definition_screen/axillary_pages/skills_list.dart';
import 'package:connect_proj/pages/definition_screen/definition_director/definition_director.dart';
import 'package:connect_proj/pages/definition_screen/definition_mastermind/definition_mastermind.dart';
import 'package:connect_proj/pages/definition_screen/definition_screen.dart';
import 'package:connect_proj/pages/edit_infos_page/edit_infos_page.dart';
import 'package:connect_proj/pages/home_page/home_page.dart';
import 'package:connect_proj/pages/login_screen/login_screen.dart';
import 'package:connect_proj/pages/perfil_page/perfil_page.dart';
import 'package:connect_proj/pages/register_form/register_form.dart';
import 'package:connect_proj/pages/settings_page/settings_page.dart';
import 'package:connect_proj/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt')],
        title: 'Connect Proj',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/register_form': (context) => RegisterForm(),
          '/definition': (context) => DefinitionScreen(),
          '/definition_director': (context) => DefinitionDirector(),
          '/definition_mastermind': (context) => DefinitionMastermind(),
          '/definition_ideas': (context) => IdeasList(),
          '/definition_skills': (context) => SkillsList(),
          '/home': (context) => HomePage(),
          '/perfil_page': (context) => PerfilPage(),
          '/settings_page': (context) => SettingsPage(),
          '/edit_infos_page': (context) => EditInfosPage(),
        });
  }
}
