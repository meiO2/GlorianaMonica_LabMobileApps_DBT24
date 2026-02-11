import 'package:flutter/material.dart';
import '../models/feed_model.dart';
import '../widgets/carousel_widget.dart'; // Import the new widget

class FeedWidget extends StatelessWidget {
  final FeedModel feed;
  const FeedWidget({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          leading: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(feed.profilePic),
          ),
          title: Row(
            children: [
              Text(feed.username, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              if (feed.isVerified)
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(Icons.verified, color: Colors.blue, size: 14),
                ),
            ],
          ),
          trailing: const Icon(Icons.more_horiz, color: Colors.white),
        ),
        
        // Use the new CarouselWidget here
        CarouselWidget(images: feed.postImages),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, size: 28),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, size: 26),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined, size: 26),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${feed.likes} likes', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  children: [
                    TextSpan(text: "${feed.username} ", style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: feed.caption),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'View all ${feed.comments} comments',
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}