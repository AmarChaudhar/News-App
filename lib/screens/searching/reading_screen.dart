import 'package:flutter/material.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  String _selectedLanguage = '';
  bool _isMicOpen = false;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
          _buildHeader(context),
          const SizedBox(height: 5),
          Expanded(
            child: _buildNewsContent(),
          ),
          const SizedBox(height: 10),
          _buildTranslateOptions(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'News Title',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildNewsContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' e text content in a ListView or SingleChildScrollView with a specific height and make sure the mic button and translate options are outside of this scrolling view. HereTo achieve the desired behavior where only the text content scrolls while the mic button and translate options stay fixed, you can wrap the text content in a ListView or SingleChildScrollView with a specific height and make sure the mic button and translate options are outside of this scrolling view. Heres the modified code to achieve this:',
              style: const TextStyle(fontSize: 18),
              overflow: TextOverflow.fade,
              maxLines: _isExpanded ? null : 13, // Limit to 2 lines initially
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded; // Toggle _isExpanded
                });
              },
              child: Container(
                height: 30,
                color: const Color.fromARGB(255, 74, 68, 68),
                child: Center(
                  child: Text(
                    _isExpanded ? 'Read Less Content' : 'Read More Content',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTranslateOptions() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IconButton(
              icon: _isMicOpen
                  ? const Icon(Icons.pause, color: Colors.red, size: 30)
                  : const Icon(Icons.mic_off, color: Colors.grey, size: 30),
              onPressed: () {
                setState(() {
                  _isMicOpen = !_isMicOpen;
                });
                // Implement mic toggle functionality here
              },
            ),
          ),
          const SizedBox(width: 2),
          Expanded(
            child: DropdownButton<String>(
              items: [
                const DropdownMenuItem(
                  value: 'en',
                  child: Text('English', style: TextStyle(fontSize: 16)),
                ),
                const DropdownMenuItem(
                  value: 'Hindi',
                  child: Text('Hindi', style: TextStyle(fontSize: 16)),
                ),
                const DropdownMenuItem(
                  value: 'Punjabi',
                  child: Text('Punjabi', style: TextStyle(fontSize: 16)),
                ),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                  print('Translate to $value');
                }
              },
              hint: const Text(
                'Translate',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              icon: const Icon(Icons.translate, color: Colors.blue, size: 30),
              style: const TextStyle(color: Colors.blue, fontSize: 16),
              underline: Container(),
              isExpanded: true,
            ),
          ),
          const SizedBox(width: 55),
          if (_selectedLanguage.isNotEmpty)
            Text(
              '$_selectedLanguage',
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }
}
