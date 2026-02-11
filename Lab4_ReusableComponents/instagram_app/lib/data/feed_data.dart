import '../models/feed_model.dart';

List<FeedModel> dummyFeeds = [
  // Existing data...
  FeedModel(
    username: "pixel_master",
    profilePic: "https://i.pravatar.cc/150?img=10",
    isVerified: true,
    postImages: [
      "https://picsum.photos/id/237/600/600",
      "https://picsum.photos/id/238/600/600",
    ],
    likes: "12,405",
    comments: "892",
    caption: "Exploring the mountains today! #nature #adventure",
  ),
  
  // New Carousel Post (3 images)
  FeedModel(
    username: "urban_explorer",
    profilePic: "https://i.pravatar.cc/150?img=33",
    isVerified: false,
    postImages: [
      "https://picsum.photos/id/103/600/600",
      "https://picsum.photos/id/104/600/600",
      "https://picsum.photos/id/106/600/600",
    ],
    likes: "5,621",
    comments: "210",
    caption: "The city lights hit differently at night. Swipe for more views! 🌃",
  ),

  // New Normal Post (1 image)
  FeedModel(
    username: "coffee_vibes",
    profilePic: "https://i.pravatar.cc/150?img=20",
    isVerified: true,
    postImages: ["https://picsum.photos/id/425/600/600"],
    likes: "1,102",
    comments: "45",
    caption: "Monday morning essentials. ☕️✨",
  ),

  FeedModel(
    username: "coding_journey",
    profilePic: "https://i.pravatar.cc/150?img=12",
    postImages: ["https://picsum.photos/id/1/600/600"],
    likes: "3,210",
    comments: "154",
    caption: "Finally finished my new Flutter UI. What do you think?",
  ),
];