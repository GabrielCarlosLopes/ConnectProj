import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/definition_controller/definition_controller.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class DefinitionDirector extends StatefulWidget {
  const DefinitionDirector({Key? key}) : super(key: key);

  @override
  _DefinitionDirectorState createState() => _DefinitionDirectorState();
}

class _DefinitionDirectorState extends State<DefinitionDirector> {
  final _controller = DefinitionController();
  TextEditingController githubController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    githubController.dispose();
    linkedinController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
      _controller.setUser(
          ModalRoute.of(context)?.settings.arguments as RegisterFormModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: grey),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Text(
                'Como um realizador\nQuais s??o suas ideias?',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: grey,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 28.0, right: 28.0, top: 18.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                                    context, '/definition_skills',
                                    arguments: _controller.userData)
                                .then(
                              (value) {
                                _controller.setUser(
                                  value as RegisterFormModel,
                                );
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/coding.svg',
                                  width: 65,
                                ),
                                Text(
                                  'Skills',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    //GITHUB
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/github.svg',
                          width: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Nome no GitHub',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8),
                        child: TextFormField(
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: white,
                            ),
                          ),
                          cursorColor: Colors.white,
                          controller: githubController,
                          decoration: InputDecoration(
                            hintText: 'Seu nome no github',
                            hintStyle: GoogleFonts.nunitoSans(color: greyLight),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    //LINKEDIN
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/linkedin.svg',
                          width: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Nome no Linkedin',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8),
                        child: TextFormField(
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: white,
                            ),
                          ),
                          cursorColor: Colors.white,
                          controller: linkedinController,
                          decoration: InputDecoration(
                            hintText: 'Seu nome no linkedin totalmente junto',
                            hintStyle: GoogleFonts.nunitoSans(color: greyLight),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    //Info
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/info.svg',
                          width: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Fale sobre voc?? e seus objetivos',
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8),
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                              color: white,
                            ),
                          ),
                          cursorColor: Colors.white,
                          controller: descriptionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 28.0,
                right: 28.0,
                bottom: 10.0,
                top: 10,
              ),
              child: Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    var user = _controller.userData;
                    user = user!.copyWith(
                      github: githubController.text,
                      linkedin: linkedinController.text,
                      description: descriptionController.text,
                      definition: 1,
                    );
                    _controller.saveFirebase(user.toMap()).then((value) {
                      if (value) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Salvar',
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
            ),
          ],
        ),
      ),
    );
  }
}
