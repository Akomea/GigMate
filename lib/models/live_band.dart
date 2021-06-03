class LiveBand {
  String name;
  String genre;
  String description;
  String location;
  List instruments;
  List credits;
  List reviews;
  int ratingScore;
  int totalRatingVotes;
  bool availability;
  dynamic datesUnavailable;
  List musicType;
  int charge;
  List media;
  bool isPremium;
  String style;

  LiveBand.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    genre = data['genre'];
    description = data['description'];
    location = data['location'];
    instruments = data['instruments'];
    credits = data['credits'];
    reviews = data['reviews'];
    ratingScore = data['ratingScore'];
    availability = data['availability'];
    datesUnavailable = data['datesUnavailable'];
    musicType = data['musicType'];
    charge = data['charge'];
    media = data['media'];
    isPremium = data['isPremium'];
    style = data['style'];
  }
}
