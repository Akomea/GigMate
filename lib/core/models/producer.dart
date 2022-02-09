class Producer {
  String imageUrl;
  String name;
  List credits;
  String genre;
  int price;
  int rating;

  Producer.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    credits = data['credits'];
    genre = data['genre'];
    price = data['price'];
    rating = data['rating'];
    imageUrl = data['imageUrl'];
  }
}
