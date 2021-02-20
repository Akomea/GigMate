class Producer {
  String imageUrl;
  String name;
  List<String> credits;
  String genre;
  int price;
  int rating;

  Producer(
      {this.imageUrl,
      this.name,
      this.credits,
      this.genre,
      this.price = 10,
      this.rating});
}
