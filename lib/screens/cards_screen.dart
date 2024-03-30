import 'package:flutter/material.dart';
import 'package:news_app/screens/searching/reading_screen.dart';
// import 'package:news_app/utils/media_query.dart';

class ShortBreakingCard extends StatelessWidget {
  final String title;
  final String description;

  const ShortBreakingCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ReadingScreen(),
          ),
        );
      },
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 0.88,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Make column wrap content
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8), // Adjust spacing as needed
              Flexible(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                  maxLines: 2, // Limit to 2 lines to prevent excessive height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchinCard extends StatelessWidget {
  final String title;
  final String description;

  const SearchinCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(
        horizontal: 9,
        // vertical: 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(85),
        width: MediaQuery.of(context).size.width * 0.88,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Make column wrap content
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // Adjust spacing as needed
            Flexible(
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis, // Handle overflow
                maxLines: 2, // Limit to 2 lines to prevent excessive height
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingTopicsCards extends StatelessWidget {
  final String title;
  final String description;

  const TrendingTopicsCards({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width * 0.82,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Make column wrap content
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis, // Handle overflow
                maxLines: 3, // Limit to 3 lines to prevent excessive height
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final String title;
  final String imageName;

  const CategoriesCard({
    Key? key,
    required this.title,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to dynamically calculate card width based on screen size.
    double cardWidth = MediaQuery.of(context).size.width * 0.25;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: SizedBox(
        width: cardWidth,
        height: 110, // Maintain the fixed height of the card.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Stretch column children horizontally.
          children: <Widget>[
            Expanded(
              // Image takes as much space as it can, maintaining the aspect ratio.
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    imageName,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis, // Prevent text overflow.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
