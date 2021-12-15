import 'package:connect_proj/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:connect_proj/models/idea_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class IdeaPage extends StatelessWidget {
  final IdeaModel idea;
  const IdeaPage({
    Key? key,
    required this.idea,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(idea);

    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: green,
        title: Text(idea.title),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sobre a ideia',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: greyLight,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                idea.description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: greyLight,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Existem outras pessoas no projeto',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    color: greyLight,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              idea.peoples == '0'
                  ? Text(
                      'Não',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: greyLight,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Text(
                      'Sim, ${idea.peoples!} pessoas',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: greyLight,
                          fontSize: 18,
                        ),
                      ),
                    ),
              SizedBox(height: 10),
              idea.github != ''
                  ? TextButton.icon(
                      onPressed: () async {
                        final url = idea.github!;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Erro ao tentar abrir o link'),
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
                      label: Text('Github do projeto'),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
