import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/controller/ideas_list_controller/ideas_list_controller.dart';
import 'package:connect_proj/models/idea_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget newIdea(IdeasListController _controller,
    {IdeaModel? ideaModel, int? index}) {
  if (ideaModel != null) {
    _controller.titleIdeaController.text = ideaModel.title;
    _controller.descriptionIdeaController.text = ideaModel.description;
    _controller.githubIdeiaController.text =
        ideaModel.github == null ? '' : ideaModel.github!;
    _controller.github = ideaModel.github != '' ? true : false;
    _controller.selectedIndex = int.parse(ideaModel.peoples!);
    _controller.participantes =
        int.parse(ideaModel.peoples!) > 0 ? true : false;
  }

  return Scaffold(
    backgroundColor: grey,
    appBar: AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          _controller.disposeControllers();
          _controller.setIdeaNull();
          _controller.setIndexNull();
          _controller.setNewIdea();
        },
      ),
      backgroundColor: green,
      centerTitle: true,
      title: ideaModel == null
          ? Text(
              'Cadastrar ideia',
              style: GoogleFonts.nunitoSans(color: white),
            )
          : Text(
              'Alterar ideia',
              style: GoogleFonts.nunitoSans(color: white),
            ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (context) {
                return ListView(
                  children: [
                    Text(
                      'De um título para a idea',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    simpleInput(context, _controller.titleIdeaController),
                    SizedBox(height: 20),
                    Text(
                      'Fale um pouco sobre a ideia',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    extendedInput(
                        context, _controller.descriptionIdeaController),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/github.svg',
                                    fit: BoxFit.cover,
                                    height: 20,
                                    color: white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Github',
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
                            Checkbox(
                              side: BorderSide(color: white),
                              activeColor: green,
                              value: _controller.github,
                              onChanged: (value) {
                                _controller.github = !_controller.github;
                              },
                            )
                          ],
                        ),
                        _controller.github
                            ? simpleInput(
                                context,
                                _controller.githubIdeiaController,
                                hint:
                                    'Link no Github. ex: https://github.com/project',
                              )
                            : Container(),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 20,
                                    color: white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Participantes no projeto',
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
                            Checkbox(
                              side: BorderSide(color: white),
                              activeColor: green,
                              value: _controller.participantes,
                              onChanged: (value) {
                                _controller.participantes =
                                    !_controller.participantes;
                              },
                            ),
                          ],
                        ),
                        _controller.participantes
                            ? Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    tileMembers('00', 0, _controller),
                                    tileMembers('01', 1, _controller),
                                    tileMembers('02', 2, _controller),
                                    tileMembers('03', 3, _controller),
                                    tileMembers('04', 4, _controller),
                                    tileMembers('05+', 5, _controller),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(height: 35),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_controller.titleIdeaController.text != '' &&
                                  _controller.descriptionIdeaController.text !=
                                      '') {
                                final idea = IdeaModel(
                                  title: _controller.titleIdeaController.text,
                                  description: _controller
                                      .descriptionIdeaController.text,
                                  github: _controller.github
                                      ? _controller.githubIdeiaController.text
                                      : '',
                                  peoples: _controller.participantes
                                      ? _controller.selectedIndex.toString()
                                      : '0',
                                );
                                if (ideaModel == null) {
                                  _controller.addIdea(idea);
                                } else {
                                  _controller.updateIdea(
                                    index!,
                                    IdeaModel(
                                      title:
                                          _controller.titleIdeaController.text,
                                      description: _controller
                                          .descriptionIdeaController.text,
                                      github: _controller.github
                                          ? _controller
                                              .githubIdeiaController.text
                                          : '',
                                      peoples: _controller.participantes
                                          ? _controller.selectedIndex.toString()
                                          : '0',
                                    ),
                                  );
                                }
                                _controller.disposeControllers();
                                _controller.setIndexNull();
                                _controller.setIdeaNull();
                                _controller.setNewIdea();
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: new Text(
                                          'Você não pode criar uma ideia sem um título e uma descrição.',
                                        ),
                                        actions: <Widget>[
                                          new TextButton(
                                            child: new Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              }
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
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Observer tileMembers(String text, int? index, IdeasListController _controller) {
  return Observer(builder: (_) {
    return Container(
      height: 55,
      width: 55,
      child: ListTile(
        selected: index == _controller.selectedIndex,
        tileColor:
            index == _controller.selectedIndex ? Colors.green : Colors.grey,
        selectedTileColor:
            index == _controller.selectedIndex ? Colors.green : Colors.grey,
        leading: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              color: index == _controller.selectedIndex ? white : grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          _controller.setIndexMembers(index);
        },
      ),
    );
  });
}

Container extendedInput(
    BuildContext context, TextEditingController controller) {
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: white,
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
            color: grey,
          ),
        ),
        cursorColor: grey,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Container simpleInput(BuildContext context, TextEditingController controller,
    {String? hint}) {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: TextFormField(
        style: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            color: grey,
          ),
        ),
        cursorColor: grey,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}
