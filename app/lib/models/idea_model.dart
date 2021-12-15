import 'dart:convert';

class IdeaModel {
  String title;
  String description;
  String? peoples;
  String? github;
  IdeaModel({
    required this.title,
    required this.description,
    this.peoples,
    this.github,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'peoples': peoples,
      'github': github,
    };
  }

  factory IdeaModel.fromMap(Map<String, dynamic> map) {
    return IdeaModel(
      title: map['title'],
      description: map['description'],
      peoples: map['peoples'] != null ? map['peoples'] : null,
      github: map['github'] != null ? map['github'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IdeaModel.fromJson(String source) =>
      IdeaModel.fromMap(json.decode(source));

  IdeaModel copyWith({
    String? title,
    String? description,
    String? peoples,
    String? github,
  }) {
    return IdeaModel(
      title: title ?? this.title,
      description: description ?? this.description,
      peoples: peoples ?? this.peoples,
      github: github ?? this.github,
    );
  }

  @override
  String toString() {
    return 'IdeaModel(title: $title, description: $description, peoples: $peoples, github: $github)';
  }
}

class PeoplesInProject {
  String name;
  String? github;
  String? linkedin;
  PeoplesInProject({
    required this.name,
    this.github,
    this.linkedin,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'github': github,
      'linkedin': linkedin,
    };
  }

  factory PeoplesInProject.fromMap(Map<String, dynamic> map) {
    return PeoplesInProject(
      name: map['name'],
      github: map['github'],
      linkedin: map['linkedin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PeoplesInProject.fromJson(String source) =>
      PeoplesInProject.fromMap(json.decode(source));

  PeoplesInProject copyWith({
    String? name,
    String? github,
    String? linkedin,
  }) {
    return PeoplesInProject(
      name: name ?? this.name,
      github: github ?? this.github,
      linkedin: linkedin ?? this.linkedin,
    );
  }

  @override
  String toString() =>
      'PeoplesInProject(name: $name, github: $github, linkedin: $linkedin)';
}
