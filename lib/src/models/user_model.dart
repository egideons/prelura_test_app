class UserModel {
  int id;
  String username;
  int numOfStars;
  int numOfRatings;
  String location;
  int numOfStings;
  int numOfFollowings;
  int numOfFollowers;
  int numOfReviews;

  UserModel({
    required this.id,
    required this.username,
    required this.numOfStars,
    required this.numOfRatings,
    required this.location,
    required this.numOfStings,
    required this.numOfFollowers,
    required this.numOfFollowings,
    required this.numOfReviews,
  });
}
