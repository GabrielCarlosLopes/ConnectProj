import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/controller/home_controller/home_controller.dart';
import 'package:connect_proj/pages/tabs/chat_tab/chat_tab.dart';
import 'package:connect_proj/pages/tabs/connections_tab/connections_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();

  @override
  void initState() {
    reaction<bool>((_) => _homeController.loading, (isLoading) {
      if (_homeController.loading) {
        Overlay.of(context)?.insert(overlayLoading);
      } else {
        overlayLoading.remove();
      }
    });

    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _homeController.loadCurrentUser(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = <Widget>[
      ConnectionTab(homeController: _homeController),
      ChatTab(homeController: _homeController)
    ];

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: grey,
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
          'assets/logo_completo.png',
          fit: BoxFit.cover,
          height: 45,
        ),
        leading: Observer(builder: (_) {
          return IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/perfil_page').then((value) {
                _homeController.loadCurrentUser(context);
              });
            },
            tooltip: 'Perfil',
            icon: _homeController.user == null
                ? Icon(Icons.people)
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: NetworkImage(_homeController.user!.perfilPhoto!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          );
        }),
      ),
      body: FutureBuilder(
        future: _homeController.loadCurrentUser(context),
        builder: (context, snapshot) {
          if (_homeController.user == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Observer(builder: (_) {
            return Container(child: tabs[_homeController.selectedIndex]);
          });
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            currentIndex: _homeController.selectedIndex,
            backgroundColor: greyBttomBar,
            selectedFontSize: 15,
            selectedItemColor: green,
            iconSize: 20,
            selectedIconTheme: IconThemeData(size: 25),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_outlined),
                label: 'Chat',
              )
            ],
            onTap: (index) {
              _homeController.setIndex(index);
            },
          );
        },
      ),
    );
  }
}
