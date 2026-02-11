class FeedModel {
  final String username;
  final String profilePic;
  final List<String> postImages; 
  final String likes;
  final String comments;
  final String caption;
  final bool isVerified;

  FeedModel({
    required this.username,
    required this.profilePic,
    required this.postImages,
    required this.likes,
    required this.comments,
    required this.caption,
    this.isVerified = false,
  });
}