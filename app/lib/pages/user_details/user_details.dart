import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/controller/user_details_controller/user_details_controller.dart';
import 'package:connect_proj/pages/idea_page/idea_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatefulWidget {
  final String userUid;
  const UserDetails({
    Key? key,
    required this.userUid,
  }) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _userController = UserDetailsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: FutureBuilder(
        future: _userController.loadUser(widget.userUid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Observer(builder: (_) {
            final date = (DateTime.now().year -
                    int.parse(
                        _userController.user!.birthDate!.substring(6, 10)))
                .toString();

            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 320,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  _userController.user!.perfilPhoto!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios, color: white),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        _userController.user!.name! + ', ' + date,
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                            color: white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    //DESCRIPTION
                    _userController.user!.description == ''
                        ? Container()
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sobre mim',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  _userController.user!.description!,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: greyLight,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: 20),
                    //SKILLS
                    _userController.user!.skills!.length != 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  'Skills',
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                      color: white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 18, top: 10),
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      childAspectRatio: 20,
                                      maxCrossAxisExtent: 58,
                                      mainAxisExtent: 20,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 5,
                                    ),
                                    itemCount:
                                        _userController.user!.skills!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: greyLight,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          _userController.user!.skills![index],
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 8,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    //SOCIAIS
                    Row(
                      mainAxisAlignment: _userController.user!.github == '' ||
                              _userController.user!.linkedin == ''
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceAround,
                      children: [
                        _userController.user!.github != ''
                            ? TextButton.icon(
                                onLongPress: () {
                                  Clipboard.setData(
                                    new ClipboardData(
                                        text: 'https://github.com/search?q=' +
                                            _userController.user!.github! +
                                            '&type=users'),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Link copiado!'),
                                    ),
                                  );
                                },
                                onPressed: () async {
                                  final url = 'https://github.com/search?q=' +
                                      _userController.user!.github! +
                                      '&type=users';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Erro ao tentar abrir o link, tente segurar para copiar o link.'),
                                      ),
                                    );
                                  }
                                },
                                icon: SvgPicture.asset(
                                  'assets/github.svg',
                                  fit: BoxFit.cover,
                                  width: 30,
                                  color: white,
                                ),
                                label: Text(_userController.user!.github!),
                              )
                            : Container(),
                        _userController.user!.linkedin != ''
                            ? TextButton.icon(
                                onLongPress: () {
                                  Clipboard.setData(
                                    new ClipboardData(
                                      text:
                                          'https://www.linkedin.com/in/${_userController.user!.linkedin}',
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Link copiado!'),
                                    ),
                                  );
                                },
                                onPressed: () async {
                                  final url =
                                      'https://www.linkedin.com/in/${_userController.user!.linkedin}';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('Erro ao tentar abrir o link'),
                                      ),
                                    );
                                  }
                                },
                                icon: SvgPicture.asset(
                                  'assets/linkedin.svg',
                                  fit: BoxFit.cover,
                                  width: 30,
                                ),
                                label: Text(_userController.user!.linkedin!),
                              )
                            : Container(),
                      ],
                    ),

                    _userController.user!.definition == 0
                        ? Container(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _userController.user!.ideas!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: greyBttomBar,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.all(8),
                                        title: Text(
                                          _userController
                                              .user!.ideas![index].title,
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: TextStyle(
                                              color: greyLight,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: greyLight,
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => IdeaPage(
                                              idea: _userController
                                                  .user!.ideas![index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
