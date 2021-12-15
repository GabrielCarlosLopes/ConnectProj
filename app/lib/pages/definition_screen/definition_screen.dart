import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/definition_controller/definition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class DefinitionScreen extends StatefulWidget {
  const DefinitionScreen({Key? key}) : super(key: key);

  @override
  _DefinitionScreenState createState() => _DefinitionScreenState();
}

class _DefinitionScreenState extends State<DefinitionScreen> {
  final _controller = DefinitionController();

  @override
  void initState() {
    super.initState();
    reaction((_) => _controller.error, (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_controller.error.toString()),
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

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _controller.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Observer(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Você se define\ncomo um?',
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: green,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_controller.indentification != true) {
                              _controller.setIndentification();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _controller.indentification ? green : greyLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Idealizador',
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_controller.indentification != false) {
                              _controller.setIndentification();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _controller.indentification ? greyLight : green,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Realizador',
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.indentification
                            ? Navigator.pushNamed(
                                context,
                                '/definition_mastermind',
                                arguments: _controller.userData!
                                    .copyWith(definition: 0, skills: []),
                              )
                            : Navigator.pushNamed(
                                context,
                                '/definition_director',
                                arguments: _controller.userData!
                                    .copyWith(definition: 1, skills: []),
                              );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: green,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Continuar',
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Isto não poderá ser alterado depois',
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        color: greyLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
