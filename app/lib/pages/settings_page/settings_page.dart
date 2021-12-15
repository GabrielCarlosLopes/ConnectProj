import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _controller = LoginController();

  @override
  void initState() {
    reaction<bool>((_) => _controller.loading, (isLoading) {
      if (_controller.loading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Settings'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              tileColor: greyBttomBar,
              leading: Icon(
                Icons.exit_to_app,
                color: white,
              ),
              title: Text(
                'Sair',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: white,
                  ),
                ),
              ),
              onTap: () {
                _controller.logout().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: white,
              ),
              tileColor: greyBttomBar,
              title: Text(
                'Deletar a conta permanentemente',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: white,
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Excluir conta!'),
                        content: new Text(
                            'Sua conta será excluida caso clique em "SIM", tem certeza disto?'),
                        actions: <Widget>[
                          new TextButton(
                            child: new Text("SIM"),
                            onPressed: () {
                              _controller.deleteAndLogoutUser().then((value) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/login',
                                  (route) => false,
                                );
                              });
                            },
                          ),
                          new TextButton(
                            child: new Text("CANCELAR"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
