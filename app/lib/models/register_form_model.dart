import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:connect_proj/models/idea_model.dart';

class RegisterFormModel {
  String? uid;
  String? name;
  bool? gender;
  String? birthDate;
  String? perfilPhoto;
  int? definition;
  List<IdeaModel>? ideas;
  List<String>? skills;
  String? description;
  String? github;
  String? linkedin;
  List<String>? likes;
  List<String>? unlikes;

  RegisterFormModel(
    this.uid,
    this.name,
    this.gender,
    this.birthDate,
    this.perfilPhoto,
    this.definition,
    this.ideas,
    this.skills,
    this.description,
    this.github,
    this.linkedin,
    this.likes,
    this.unlikes,
  );

  RegisterFormModel copyWith({
    String? uid,
    String? name,
    bool? gender,
    String? birthDate,
    String? perfilPhoto,
    int? definition,
    List<IdeaModel>? ideas,
    List<String>? skills,
    String? description,
    String? github,
    String? linkedin,
    List<String>? likes,
    List<String>? unlikes,
  }) {
    return RegisterFormModel(
      uid ?? this.uid,
      name ?? this.name,
      gender ?? this.gender,
      birthDate ?? this.birthDate,
      perfilPhoto ?? this.perfilPhoto,
      definition ?? this.definition,
      ideas ?? this.ideas,
      skills ?? this.skills,
      description ?? this.description,
      github ?? this.github,
      linkedin ?? this.linkedin,
      likes ?? this.likes,
      unlikes ?? this.unlikes,
    );
  }

  RegisterFormModel.fromDocument(DocumentSnapshot document) {
    uid = document.get('uid');
    name = document.get('name');
    gender = document.get('gender');
    birthDate = document.get('birthDate');
    perfilPhoto = document.get('perfilPhoto');
    definition = document.get('definition');
    ideas = document.get('ideas');
    skills = document.get('skills');
    description = document.get('description');
    github = document.get('github');
    linkedin = document.get('linkedin');
    likes = document.get('likes');
    unlikes = document.get('unlikes');
  }

  @override
  String toString() {
    return 'RegisterFormModel(name: $name, gender: $gender, birthDate: $birthDate, perfilPhoto: $perfilPhoto, definition: $definition, ideas: $ideas, skills: $skills, description: $description, github: $github, linkedin: $linkedin)';
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'birthDate': birthDate,
      'perfilPhoto': perfilPhoto,
      'definition': definition,
      'ideas': ideas?.map((x) => x.toMap()).toList(),
      'skills': skills,
      'description': description,
      'github': github,
      'linkedin': linkedin,
      'likes': likes,
      'unlikes': unlikes,
    };
  }

  factory RegisterFormModel.fromMap(Map<String, dynamic> map) {
    return RegisterFormModel(
      map['uid'] != null ? map['uid'] : null,
      map['name'] != null ? map['name'] : null,
      map['gender'] != null ? map['gender'] : null,
      map['birthDate'] != null ? map['birthDate'] : null,
      map['perfilPhoto'] != null ? map['perfilPhoto'] : null,
      map['definition'] != null ? map['definition'] : null,
      map['ideas'] != null
          ? List<IdeaModel>.from(map['ideas']?.map((x) => IdeaModel.fromMap(x)))
          : null,
      map['skills'] != null ? List<String>.from(map['skills']) : null,
      map['description'] != null ? map['description'] : null,
      map['github'] != null ? map['github'] : null,
      map['linkedin'] != null ? map['linkedin'] : null,
      map['likes'] != null ? List<String>.from(map['likes']) : null,
      map['unlikes'] != null ? List<String>.from(map['unlikes']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterFormModel.fromJson(String source) =>
      RegisterFormModel.fromMap(json.decode(source));
}
