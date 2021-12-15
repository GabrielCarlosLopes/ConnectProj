import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/ideas_list_controller/ideas_list_controller.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:connect_proj/pages/definition_screen/axillary_pages/widgets/new_idea_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class IdeasList extends StatefulWidget {
  const IdeasList({Key? key}) : super(key: key);

  @override
  _IdeasListState createState() => _IdeasListState();
}

class _IdeasListState extends State<IdeasList> {
  final _controller = IdeasListController();

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
      var user =
          ModalRoute.of(context)?.settings.arguments as RegisterFormModel;
      _controller.setUser(user);
      if (user.ideas != null) {
        _controller.setList(user.ideas);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => _controller.newIdea
          ? newIdea(
              _controller,
              ideaModel: _controller.idea == null ? null : _controller.idea,
              index: _controller.index == -1 ? null : _controller.index,
            )
          : Scaffold(
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
                    _controller.addList();
                    Navigator.pop(context, _controller.user);
                  },
                ),
                backgroundColor: green,
                centerTitle: true,
                title: const Text('Adicionar Ideias'),
              ),
              body: Container(
                child: listIdeas(),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _controller.setNewIdea(),
                backgroundColor: green,
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              ),
            ),
    );
  }

  Observer listIdeas() {
    return Observer(builder: (_) {
      if (_controller.ideaList.length == 0) {
        return emptyMessage();
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _controller.ideaList.length,
          itemBuilder: (context, index) {
            final idea = _controller.ideaList[index];
            return GestureDetector(
              onTap: () {
                _controller.setIdea(idea);
                _controller.setIndex(index);
                _controller.setNewIdea();
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Excluir"),
                      content: Text(
                        "Você realmente quer excluir a ideia: ${_controller.ideaList[index].title}?",
                        style: GoogleFonts.nunitoSans(color: grey),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'voltar',
                            style: GoogleFonts.nunitoSans(),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _controller.removeIdea(index);
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Excluir',
                            style: GoogleFonts.nunitoSans(),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Card(
                color: greyBttomBar,
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        idea.title,
                        style: GoogleFonts.nunitoSans(
                          color: white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Center emptyMessage() {
    return Center(
      child: Text(
        'Você ainda não tem\nnenhuma ideia cadastrada',
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: white,
          ),
        ),
      ),
    );
  }
}
