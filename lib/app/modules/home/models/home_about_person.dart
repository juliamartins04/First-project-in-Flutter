class HomeAboutPerson {
  String? description;

  HomeAboutPerson({required this.description});

  factory HomeAboutPerson.fromMap(Map<String, dynamic> map) => HomeAboutPerson(
        description: map["description"],
      );
}
