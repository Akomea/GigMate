class Rating {
  String reviewerName;
  String reviewerImageUrl;
  String eventType;
  int numStars;
  String summary;
  String review;

  Rating.fromMap(Map<String, dynamic> data) {
    reviewerName = data['reviewerName'];
    reviewerImageUrl = data['reviewerImageUrl'];
    eventType = data['eventType'];
    numStars = data['numStars'];
    summary = data['summary'];
    review = data['review'];
  }
}
