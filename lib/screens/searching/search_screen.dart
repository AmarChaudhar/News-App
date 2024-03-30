// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/cards_screen.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initSpeech();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Initialize animation
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start animation loop
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initSpeech() async {
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundGradient(),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopContent(),
                _buildBottomContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Background gradient of the screen.
  Widget _backgroundGradient() {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        // shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 59, 59, 80),
            // Color.fromARGB(255, 24, 21, 49),
            // Color.fromARGB(255, 24, 21, 49),
            Color.fromRGBO(221, 236, 3, 1),
            Color.fromRGBO(205, 195, 4, 1),
            // Color.fromRGBO(23, 23, 27, 1),
            // Color.fromARGB(255, 24, 21, 49),
          ],
        ),
      ),
    );
  }

  // Building the main content of the screen.
  Widget _buildTopContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        _buildBackButton(),
        const SizedBox(height: 8),
        _buildSearchBar(),
        const SizedBox(height: 30),
        // Show hint text if speech recognition is not active
        _buildVoiceMic(),
      ],
    );
  }

  Widget _buildBottomContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30), // Adjust as needed
          _buildSearchCardList(),
        ],
      ),
    );
  }

  // Custom horizontal line divider.
  Widget _buildCustomHorizontalLine() {
    return Container(
      height: 3,
      color: Colors.yellow,
      margin: const EdgeInsets.only(top: 15),
    );
  }

  // Voice search microphone button.

  Widget _buildVoiceMic() {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_speechToText.isNotListening) {
            _startListening();
          } else {
            _stopListening();
          }
        },
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _speechToText.isNotListening
                    ? Color.fromARGB(255, 22, 62, 102)
                    : Color.fromARGB(255, 73, 220, 19),
                boxShadow: [
                  BoxShadow(
                    color: _speechToText.isNotListening
                        ? Color.fromARGB(255, 113, 115, 117)
                        : Color.fromARGB(255, 26, 144, 235),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 40,
                  ),
                  Opacity(
                    opacity: _animation.value,
                    child: Icon(
                      Icons.mic,
                      color: _speechToText.isNotListening
                          ? Colors.white
                          : Colors.blue,
                      size: 40,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // List of search cards.
  Widget _buildSearchCardList() {
    return SizedBox(
      height: 551,
      child: Flexible(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            SearchinCard(title: 'Card 1', description: 'Description 1'),
            SizedBox(height: 15),
            SearchinCard(title: 'Card 2', description: 'Description 2'),
            SizedBox(height: 15),
            SearchinCard(title: 'Card 3', description: 'Description 3'),
            SizedBox(height: 15),
            SearchinCard(title: 'Card 4', description: 'Description 4'),
          ],
        ),
      ),
    );
  }

  // Back button.
  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
    );
  }

  // Search bar widget.
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Define the action for the search button here.
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: _lastWords.isNotEmpty ? _lastWords : 'Search...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                ),
                // readOnly: true,
                onTap: () {
                  // Define the action when the search field is tapped.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
