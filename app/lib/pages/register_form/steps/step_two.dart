import 'dart:io';

import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  late RegisterFormModel registerModel;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      registerModel =
          ModalRoute.of(context)?.settings.arguments as RegisterFormModel;
    });
  }

  @override
  void dispose() {
    super.dispose();
    registerModel = RegisterFormModel(
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
    );
  }

  final ImagePicker picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: green,
        centerTitle: true,
        title: Text(
          'Adicionar uma foto',
          style: GoogleFonts.nunitoSans(color: white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 42.0,
            left: 12,
            right: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(200),
                        image: image == null
                            ? FirebaseAuth.instance.currentUser?.photoURL !=
                                    null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      FirebaseAuth
                                          .instance.currentUser!.photoURL
                                          .toString(),
                                    ),
                                  )
                                : null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(image!),
                              ),
                      ),
                      child: FirebaseAuth.instance.currentUser?.photoURL == null
                          ? Icon(
                              Icons.add_a_photo_rounded,
                              color: white,
                              size: 68,
                            )
                          : Container(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () => getImage(),
                                icon: Icon(
                                  Icons.add,
                                  color: white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              buttonFinish(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Por favor, escolha uma imagem da sua galeria\npara uma melhor qualidade',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: greyLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonFinish() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/three',
                arguments: image != null
                    ? {
                        'model': registerModel.copyWith(
                            perfilPhoto: image!.path.toString()),
                        'photo': true,
                      }
                    : {
                        'model': registerModel,
                        'photo': false,
                      },
              );
            },
            style: ElevatedButton.styleFrom(
              primary: green,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Próximo',
                  style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future getImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
