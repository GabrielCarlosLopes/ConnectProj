import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/edit_infos_controller/edit_infos_controller.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:connect_proj/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class EditInfosPage extends StatefulWidget {
  EditInfosPage({
    Key? key,
  }) : super(key: key);

  @override
  _EditInfosPageState createState() => _EditInfosPageState();
}

class _EditInfosPageState extends State<EditInfosPage> {
  final _editInfosController = EditInfosController();

  @override
  void initState() {
    super.initState();
    reaction((_) => _editInfosController.error, (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_editInfosController.error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    });

    reaction<bool>((_) => _editInfosController.loading, (isLoading) {
      if (_editInfosController.loading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      var teste = ModalRoute.of(context)?.settings.arguments as UserModel;
      var json = teste.toJson();
      var editedUser = RegisterFormModel.fromJson(json);
      _editInfosController.setUser(editedUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: green,
        title: Text('Editar Informações'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: new Text('Salvar alterações?'),
                  actions: <Widget>[
                    new TextButton(
                      child: new Text("Não"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                    new TextButton(
                      child: new Text("Sim"),
                      onPressed: () {
                        _editInfosController.updateData().then((value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 15, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //NOME
                Text(
                  'Nome',
                  style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: green,
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
                      controller: _editInfosController.nameController,
                      decoration: InputDecoration(
                        hintText: 'Seu Nome',
                        hintStyle: TextStyle(color: white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //GENERO
                Text(
                  'Gênero',
                  style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .45,
                      child: ElevatedButton(
                        onPressed: () => _editInfosController.setGender(),
                        style: ElevatedButton.styleFrom(
                          primary:
                              _editInfosController.gender ? green : greyLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.male,
                                color: white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Masculino',
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .45,
                      child: ElevatedButton(
                        onPressed: () => _editInfosController.setGender(),
                        style: ElevatedButton.styleFrom(
                          primary:
                              !_editInfosController.gender ? green : greyLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.female,
                                color: white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Feminino',
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                //GITHUB
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/github.svg',
                      width: 25,
                      color: white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Nome no GitHub',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: white,
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
                    color: green,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: white,
                        ),
                      ),
                      cursorColor: Colors.white,
                      controller: _editInfosController.githubController,
                      decoration: InputDecoration(
                        hintText: 'Seu nome exato no github',
                        hintStyle: TextStyle(color: white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                //Linkedin
                SizedBox(height: 10),
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
                          color: white,
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
                    color: green,
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
                      controller: _editInfosController.linkedinController,
                      decoration: InputDecoration(
                        hintText: 'Seu nome no linkedin totalmente junto',
                        hintStyle: TextStyle(color: white),
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
                      color: white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Fale sobre você e seus objetivos',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: white,
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
                    color: green,
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
                      controller: _editInfosController.descriptionController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: white),
                      ),
                    ),
                  ),
                ),

                //DATA DE NASCIMENTO
                SizedBox(height: 10),
                Text(
                  'Data de nascimento',
                  style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: _editInfosController.birthDate!,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        locale: Locale('pt', 'BR'),
                      ).then((pickedDate) {
                        if (pickedDate == null) {
                          return;
                        }

                        _editInfosController.setBirthDate(pickedDate);
                      });
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
                    child: Container(
                      child: _editInfosController.birthDate?.year == null
                          ? Center(
                              child: Text(
                                'Selecione uma data',
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  _editInfosController.birthDate!.day
                                      .toString(),
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 2,
                                  color: white,
                                ),
                                Text(
                                  _editInfosController.birthDate!.month
                                      .toString(),
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 2,
                                  color: white,
                                ),
                                Text(
                                  _editInfosController.birthDate!.year
                                      .toString(),
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),

                //Ideas and Skills
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      _editInfosController.userEdited?.definition == 0
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.center,
                  children: [
                    _editInfosController.userEdited!.definition == 0
                        ? Container(
                            height: 120,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/definition_ideas',
                                arguments: _editInfosController.userEdited,
                              ).then(
                                (value) {
                                  _editInfosController
                                      .setUserList(value as RegisterFormModel);
                                },
                              ),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/ideia.svg',
                                    width: 55,
                                    color: white,
                                  ),
                                  Text(
                                    'Ideias',
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: TextStyle(
                                        color: white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    Container(
                      height: 120,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                                context, '/definition_skills',
                                arguments: _editInfosController.userEdited)
                            .then(
                          (value) {
                            _editInfosController.setUserList(
                              value as RegisterFormModel,
                            );
                          },
                        ),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/coding.svg',
                              width: 55,
                              color: white,
                            ),
                            Text(
                              'Skills',
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
