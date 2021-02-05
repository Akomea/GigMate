class SoloMusician {
  String name;
  String role;
  String description;
  List<dynamic> media;
  String style;
  String location;
  List<dynamic> credits;
  List reviews;
  bool availability;
  String secondaryInstruments;
  bool isPremium;

  SoloMusician.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    role = data['role'];
    description = data['description'];
    media = data['media'];
    location = data['location'];
    credits = data['credits'];
    availability = data['availability'];
    secondaryInstruments = data['secondaryInstruments'];
    reviews = data['reviews'];
    isPremium = data['isPremium'];
    style = data['style'];
  }
}
