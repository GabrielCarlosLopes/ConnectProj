import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/register_form_controller/register_form_controller.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class StepOne extends StatefulWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final _controller = RegisterFormController();

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

    _controller.nameController.text =
        FirebaseAuth.instance.currentUser!.displayName!;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          'Informações básicas',
          style: GoogleFonts.nunitoSans(
            color: white,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              inputName(context),
              SizedBox(height: 10),
              Text(
                'Gênero',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              genderSelect(),
              SizedBox(height: 25),
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
              inputDateBirth(),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_controller.birthDate == null ||
                            _controller.birthDate?.year ==
                                DateTime.now().year) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: new Text(
                                    'Selecione uma data válida!',
                                    style: GoogleFonts.nunitoSans(
                                      color: grey,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    new TextButton(
                                      child: new Text(
                                        "OK",
                                        style: GoogleFonts.nunitoSans(),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else if (_controller.nameController.text == '') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: new Text(
                                    'Você precisa ter um nome',
                                    style: GoogleFonts.nunitoSans(
                                      color: grey,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    new TextButton(
                                      child: new Text(
                                        "OK",
                                        style: GoogleFonts.nunitoSans(),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          var registerModel = RegisterFormModel(
                            FirebaseAuth.instance.currentUser!.uid,
                            _controller.nameController.text,
                            _controller.gender,
                            DateFormat('dd/MM/y')
                                .format(_controller.birthDate!),
                            FirebaseAuth.instance.currentUser?.photoURL,
                            null,
                            [],
                            [],
                            null,
                            null,
                            null,
                            [],
                            [],
                          );
                          Navigator.pushNamed(
                            context,
                            '/two',
                            arguments: registerModel,
                          );
                        }
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Observer inputDateBirth() {
    return Observer(
      builder: (context) => Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              locale: Locale('pt', 'BR'),
            ).then((pickedDate) {
              if (pickedDate == null) {
                return;
              }

              _controller.setBirthDate(pickedDate);
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
            child: _controller.birthDate?.year == null
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
                        _controller.birthDate!.day.toString(),
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
                        _controller.birthDate!.month.toString(),
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
                        _controller.birthDate!.year.toString(),
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
    );
  }

  Observer genderSelect() {
    return Observer(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * .45,
            child: ElevatedButton(
              onPressed: () => _controller.setGender(),
              style: ElevatedButton.styleFrom(
                primary: _controller.gender ? green : greyLight,
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
              onPressed: () => _controller.setGender(),
              style: ElevatedButton.styleFrom(
                primary: !_controller.gender ? green : greyLight,
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
    );
  }

  Observer inputName(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
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
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  color: white,
                ),
              ),
              cursorColor: Colors.white,
              controller: _controller.nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
