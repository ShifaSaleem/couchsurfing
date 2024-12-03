class Review {
  final String reviewerName;
  final String comment;

  Review({
    required this.reviewerName,
    required this.comment,
  });
}

class Host {
  final String name;
  final String location;
  final String photo;
  final double rating;
  final String? bio;
  final List<DateTime> availableDates;
  final List<Review> reviews;

  Host({
    required this.name,
    required this.location,
    required this.photo,
    required this.rating,
    this.bio,
    this.availableDates = const [],
    this.reviews = const [],
  });
}
