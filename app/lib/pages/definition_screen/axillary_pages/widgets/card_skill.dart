import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/controller/skills_controller/skills_controller.dart';

class CardItem extends StatefulWidget {
  final String skill;
  final SkillsController controller;
  const CardItem({
    Key? key,
    required this.skill,
    required this.controller,
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Observer(
        builder: (_) {
          checked = widget.controller.user?.skills == null ||
                  widget.controller.user?.skills?.length == 0
              ? false
              : widget.controller.listSkills?.contains(widget.skill) == true
                  ? true
                  : false;

          return CheckboxListTile(
            activeColor: green,
            tileColor: greyBttomBar,
            title: Text(
              widget.skill,
              style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: white,
                ),
              ),
            ),
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = !checked;
              });
              if (checked == true) {
                widget.controller.addInList(widget.skill);
              } else {
                widget.controller.removeInList(widget.skill);
              }
            },
          );
        },
      ),
    );
  }
}
