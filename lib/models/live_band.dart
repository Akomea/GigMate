import 'rating.dart';

class LiveBand {
  String _name;
  String _genre;
  String _description;
  String _location;
  List<String> _instruments;
  List<String> _credits;
  List<Rating> _ratings;
  int _ratingScore;
  int _totalRatingVotes;
  bool _availability;
  DateTime _datesUnavailable;
  List musicType;
  int priceRange;
  List<String> media;

  DateTime get datesUnavailable => _datesUnavailable;

  bool get availability => _availability;

  int get totalRatingVotes => _totalRatingVotes;

  int get ratingScore => _ratingScore;

  List<Rating> get ratings => _ratings;

  List<String> get credits => _credits;

  List<String> get instrumentsList => _instruments;

  String get location => _location;

  String get description => _description;

  String get genre => _genre;

  String get name => _name;
}
