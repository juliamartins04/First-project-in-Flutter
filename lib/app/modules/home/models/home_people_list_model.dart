import 'package:my_first_project/app/modules/home/models/home_about_person.dart';

class HomePeopleListModel {
  int age;
  String name;
  String avatar;
  String id;
  String profession;
  bool isOnline;
  HomeAboutPerson? about;

  HomePeopleListModel({
    required this.age,
    required this.avatar,
    required this.name,
    required this.id,
    required this.profession,
    required this.about,
    required this.isOnline,
  });

  factory HomePeopleListModel.fromMap(Map<String, dynamic> map) =>
      HomePeopleListModel(
        age: map["age"],
        name: map["name"],
        avatar: map["avatar"],
        id: map["id"],
        profession: map["profession"],
        isOnline: map["isOnline"],
        about:
            map["about"] != null ? HomeAboutPerson.fromMap(map["about"]) : null,
      );
}
