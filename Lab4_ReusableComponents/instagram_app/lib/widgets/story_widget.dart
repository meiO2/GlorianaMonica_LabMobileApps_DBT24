import 'package:flutter/material.dart';
import '../models/story_model.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;
  const StoryWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.username == "Your story" 
                ? null 
                : const LinearGradient(
                    colors: [Color(0xFF833AB4), Color(0xFFFD1D1D), Color(0xFFFCAF45)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
            ),
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 31,
                backgroundImage: NetworkImage(story.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            story.username, 
            style: const TextStyle(fontSize: 11, color: Colors.white)
          ),
        ],
      ),
    );
  }
}