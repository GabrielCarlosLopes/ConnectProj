import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_proj/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (_) async {
        try {
          final user = FirebaseAuth.instance.currentUser;
          var response = await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();

          response.exists
              ? Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false)
              : Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
        } catch (e) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
    );

    return Scaffold(
      body: Container(
        color: green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: CircularProgressIndicator(
                color: white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
