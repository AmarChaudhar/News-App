import 'package:flutter/material.dart';
import 'package:news_app/screens/cards_screen.dart';
import 'package:news_app/screens/curve_painter_scrren.dart';
import 'package:news_app/screens/filters/select_drawer_design.dart';
import 'package:news_app/screens/searching/search_screen.dart';
import 'package:news_app/screens/settings/setting_stack_functionality.dart';
import 'package:news_app/utils/media_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSettings = false;

  void _openPartialDrawer() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const FractionallySizedBox(
        heightFactor: 1,
        child: StateSelectionDrawer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 223, 226, 9),
                  Color.fromARGB(255, 174, 203, 11)
                ],
              ),
            ),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 570),
              painter: CurvePainter(),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                _buildTopBar(),
                SizedBox(
                  height: MediaQueryUtils.getHeight(context, 0.05),
                ),
                _buildTitle('Categories'),
                SizedBox(
                  height: MediaQueryUtils.getHeight(context, 0.010),
                ),
                _buildCategoriesList(),
                SizedBox(
                  height: MediaQueryUtils.getHeight(context, 0.020),
                ),
                _buildTitle('Breaking & Shorts'),
                SizedBox(
                  height: MediaQueryUtils.getHeight(context, 0.015),
                ),
                _buildBreakingTopicList(),
                SizedBox(
                  height: MediaQueryUtils.getHeight(context, 0.015),
                ),
                _buildTitle('Trending Topics'),
                SizedBox(
                  height: MediaQueryUtils.getHeight(context, 0.005),
                ),
                _buildTrendingTopics(),
              ],
            ),
          ),
          if (showSettings) _buildSettingsOverlay(),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 54.0, left: 18, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => setState(() => showSettings = true),
            child: const Icon(Icons.settings, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: const Icon(Icons.search, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: _openPartialDrawer,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Filters',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink),
      ),
    );
  }

  Widget _buildBreakingTopicList() {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ShortBreakingCard(title: 'Card 1', description: 'Description 1'),
          ShortBreakingCard(title: 'Card 2', description: 'Description 2'),
          ShortBreakingCard(title: 'Card 3', description: 'Description 3'),
          ShortBreakingCard(title: 'Card 3', description: 'Description 3'),
        ],
      ),
    );
  }

  Widget _buildTrendingTopics() {
    return SizedBox(
      height: 215,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          TrendingTopicsCards(title: 'Card 1', description: 'Description 1'),
          TrendingTopicsCards(title: 'Card 2', description: 'Description 2'),
          TrendingTopicsCards(title: 'Card 3', description: 'Description 3'),
          TrendingTopicsCards(title: 'Card 3', description: 'Description 3'),
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: Row(
          children: [
            SizedBox(width: 1), // Add some space before the first card
            CategoriesCard(
              title: 'Book',
              imageName: 'assets/images/book.jpg',
            ),
            SizedBox(width: 10), // Add space between cards
            CategoriesCard(
              title: 'Business',
              imageName: 'assets/images/businee.jpg',
            ),
            SizedBox(width: 10), // Add space between cards
            CategoriesCard(
              title: 'Sports',
              imageName: 'assets/images/sports.jpg',
            ),
            SizedBox(width: 10),
            CategoriesCard(
              title: 'Entertainment',
              imageName: 'assets/images/entertaiment.jpg',
            ),
            CategoriesCard(
              title: 'Science',
              imageName: 'assets/images/science.png',
            ),
            CategoriesCard(
              title: 'Technology',
              imageName: 'assets/images/technology.jpg',
            ),
            CategoriesCard(
              title: 'Education',
              imageName: 'assets/images/education.jpg',
            ),
            CategoriesCard(
              title: 'Health',
              imageName: 'assets/images/health.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOverlay() {
    return SettingsStackFunctionality(
      showSettings: showSettings,
      onTap: () => setState(() => showSettings = false),
    );
  }
}
