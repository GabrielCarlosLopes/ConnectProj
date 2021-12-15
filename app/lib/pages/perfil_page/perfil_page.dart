import 'dart:io';

import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/perfil_controller/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _perfilController = PerfilController();
  File? image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    reaction((_) => _perfilController.error, (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_perfilController.error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    });

    reaction<bool>((_) => _perfilController.loading, (isLoading) {
      if (_perfilController.loading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _perfilController.loadCurrentUser());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: grey,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _perfilController.loadCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: green),
          );
        }

        return Observer(builder: (context) {
          final date = (DateTime.now().year -
                  int.parse(
                    _perfilController.user!.birthDate!.substring(6, 10),
                  ))
              .toString();
          return ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: size.width,
              height: size.height * 0.50,
              decoration: BoxDecoration(color: green, boxShadow: [
                BoxShadow(
                  color: white.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: image == null
                            ? _perfilController.user!.perfilPhoto != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                      _perfilController.user!.perfilPhoto!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(image!),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(_perfilController.user!.name! + ", " + date,
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/settings_page');
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: grey,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'SETTINGS',
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => getImage(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 85,
                                  height: 85,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                gradient1,
                                                gradient2,
                                                gradient3
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: grey.withOpacity(0.1),
                                                spreadRadius: 10,
                                                blurRadius: 15,
                                                // changes position of shadow
                                              ),
                                            ]),
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 45,
                                          color: white,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 0,
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: grey.withOpacity(0.1),
                                                  spreadRadius: 10,
                                                  blurRadius: 15,
                                                  // changes position of shadow
                                                ),
                                              ]),
                                          child: Center(
                                            child:
                                                Icon(Icons.add, color: green),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'EDITAR FOTO',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit_infos_page',
                                    arguments: _perfilController.user)
                                .then((value) {
                              _perfilController.loadCurrentUser();
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.edit,
                                  size: 35,
                                  color: grey,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'EDIT INFO',
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Future getImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);

      _perfilController.changePhoto(image.path.toString()).then((value) {
        _perfilController.loadCurrentUser();
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
