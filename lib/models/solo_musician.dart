class SoloMusician {
  String name;
  String role;
  String description;
  List<dynamic> media;
  String style;
  String location;
  List<dynamic> credits;
  List reviews;
  int ratingScore;
  int totalRatingVotes;
  bool availability;
  String secondaryInstruments;

  SoloMusician.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    role = data['role'];
    description = data['description'];
    media = data['media'];
    location = data['location'];
    credits = data['credits'];
    ratingScore = data['ratingScore'];
    totalRatingVotes = data['totalRatingVotes'];
    availability = data['availability'];
    secondaryInstruments = data['secondaryInstruments'];
    reviews = data['reviews'];
  }
}
