import 'package:connect_proj/models/register_form_model.dart';
import 'package:mobx/mobx.dart';
part 'skills_controller.g.dart';

class SkillsController = _SkillsControllerBase with _$SkillsController;

abstract class _SkillsControllerBase with Store {
  @observable
  Exception? error;

  @observable
  bool loading = false;

  @observable
  RegisterFormModel? user;

  void setUser(RegisterFormModel newUser) {
    user = newUser;
  }

  @observable
  List<String>? listSkills = <String>[];

  @action
  void addInList(String skill) {
    listSkills?.add(skill);
  }

  @action
  void setList() {
    listSkills = user?.skills;
  }

  @action
  void removeInList(String skill) {
    for (var item in listSkills!) {
      if (item == skill) {
        listSkills?.remove(item);
        break;
      }
    }
  }

  @action
  void addSkills() {
    user = user?.copyWith(skills: listSkills);
  }
}
