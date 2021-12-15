import 'package:connect_proj/constants/colors.dart';
import 'package:connect_proj/constants/overlay.dart';
import 'package:connect_proj/constants/skills.dart';
import 'package:connect_proj/controller/skills_controller/skills_controller.dart';
import 'package:connect_proj/models/register_form_model.dart';
import 'package:connect_proj/pages/definition_screen/axillary_pages/widgets/card_skill.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class SkillsList extends StatefulWidget {
  const SkillsList({Key? key}) : super(key: key);

  @override
  _SkillsListState createState() => _SkillsListState();
}

class _SkillsListState extends State<SkillsList> {
  final _controller = SkillsController();

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
      user.skills != null || user.skills?.length == 0
          ? _controller.setList()
          : print('nun');
    });
  }

  @override
  Widget build(BuildContext context) {
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
            _controller.addSkills();
            Navigator.pop(context, _controller.user);
          },
        ),
        backgroundColor: green,
        centerTitle: true,
        title: const Text('Skills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: skills.length,
          itemBuilder: (context, index) {
            final skill = skills[index];

            return CardItem(skill: skill, controller: _controller);
          },
        ),
      ),
    );
  }
}
