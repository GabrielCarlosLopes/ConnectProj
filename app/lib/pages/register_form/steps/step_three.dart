import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/controller/register_form_controller/register_form_controller.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class StepThree extends StatefulWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  late RegisterFormModel registerModel;
  late bool photo;
  final _controller = RegisterFormController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final map = ModalRoute.of(context)?.settings.arguments as Map;

      registerModel = map['model'];
      photo = map['photo'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: green,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sua conta foi criada com sucesso.\nContinue para começar a usar o aplicativo.',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  color: white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 75),
            Observer(
              builder: (context) {
                return !_controller.loading
                    ? Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            final model = registerModel;
                            _controller.saveRegister(model.toMap(), photo).then(
                              (value) {
                                if (value) {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                }
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Continuar',
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                color: green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container();
              },
            ),
            Observer(
              builder: (context) {
                return _controller.loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
