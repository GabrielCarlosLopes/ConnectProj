import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = LoginController();

  @override
  void initState() {
    super.initState();
    reaction((_) => _controller.error, (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _controller.error.toString(),
            style: GoogleFonts.nunitoSans(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    });

    reaction<bool>((_) => _controller.loading, (isLoading) {
      if (_controller.loading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo_completo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _controller.googleLogin().then(
                  (value) {
                    if (value == 'true') {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    } else if (value == 'false') {
                      Navigator.pushNamed(context, '/register_form').then(
                        (value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/definition', (route) => false);
                        },
                      );
                    } else if (value == 'erro') {
                      return;
                    }
                  },
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  primary: white,
                  elevation: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset('assets/google.svg'),
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Entrar com o Google',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: grey,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'Problemas para entrar?',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: greyLight,
                    fontSize: 18,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
