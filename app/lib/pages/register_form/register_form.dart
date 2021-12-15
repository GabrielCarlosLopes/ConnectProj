import 'package:connect_proj/pages/register_form/steps/step_one.dart';
import 'package:connect_proj/pages/register_form/steps/step_three.dart';
import 'package:connect_proj/pages/register_form/steps/step_two.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var navKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPopNavRegister = navKey.currentState?.canPop() ?? false;
        if (canPopNavRegister) {
          navKey.currentState?.pop();
          return false;
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
          await GoogleSignIn().disconnect();
          FirebaseAuth.instance.signOut();
          return true;
        }
      },
      child: Scaffold(
        body: Navigator(
          key: navKey,
          initialRoute: '/one',
          onGenerateRoute: (settings) {
            var route = settings.name;
            Widget page;

            switch (route) {
              case '/one':
                page = StepOne();
                break;
              case '/two':
                page = StepTwo();
                break;
              case '/three':
                page = StepThree();
                break;
              default:
                return null;
            }

            return MaterialPageRoute(
              builder: (context) => page,
              settings: settings,
            );
          },
        ),
      ),
    );
  }
}
