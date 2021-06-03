class SessionMusician {
  String imageUrl;
  String name;
  List<String> credits;
  String genre;
  int price;
  int rating;

  SessionMusician.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    credits = data['credits'];
    genre = data['genre'];
    price = data['price'];
    rating = data['rating'];
  }
}
