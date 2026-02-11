import 'package:flutter/material.dart';
import '../data/story_data.dart';
import '../data/feed_data.dart';
import '../widgets/story_widget.dart';
import '../widgets/feed_widget.dart';
import 'chat_screen.dart'; // Import your ChatScreen file

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  // 0 is Home, 2 is Chat
  int _selectedIndex = 0;

  // This list holds the different views for each tab
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomeFeed(), // Index 0: The main feed
      const Center(child: Text('Reels', style: TextStyle(color: Colors.white))), // Index 1
      const ChatScreen(), // Index 2: Your Chat Screen
      const Center(child: Text('Search', style: TextStyle(color: Colors.white))), // Index 3
      const Center(child: Text('Profile', style: TextStyle(color: Colors.white))), // Index 4
    ];
  }

  // The original feed layout moved to a helper method
  Widget _buildHomeFeed() {
    return ListView(
      children: [
        // Stories Section
        SizedBox(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyStories.length,
            itemBuilder: (context, index) => StoryWidget(story: dummyStories[index]),
          ),
        ),
        const Divider(color: Colors.white10, height: 1),
        // Feeds Section
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dummyFeeds.length,
          itemBuilder: (context, index) => FeedWidget(feed: dummyFeeds[index]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // We only want the AppBar to show when we are on the Home Feed
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _selectedIndex == 0 
          ? AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              leading: const Icon(Icons.add, size: 28, color: Colors.white),
              centerTitle: true,
              title: const Text(
                'Instagram',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.favorite_border, size: 28, color: Colors.white),
                ),
              ],
            )
          : null, // AppBar is hidden for ChatScreen since it has its own
      
      body: _pages[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Highlights the current tab
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Changes the screen when tapped
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30), 
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_outlined, size: 30), 
            label: 'Reels'
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('8', style: TextStyle(fontSize: 10)),
              backgroundColor: Colors.red,
              child: Icon(Icons.send_outlined, size: 30), 
            ),
            label: 'Direct',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30), 
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white24,
              child: CircleAvatar(
                radius: 13,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}