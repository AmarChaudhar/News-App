import 'package:flutter/material.dart';
import 'package:news_app/screens/searching/reading_screen.dart';

class SlidingCard extends StatelessWidget {
  final String title;
  final String description;

  const SlidingCard({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ReadingScreen when the card is tapped
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ReadingScreen(),
          ),
        );
        print("taped card");
      },
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.only(
          bottom: 15,
          left: 10,
          right: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
