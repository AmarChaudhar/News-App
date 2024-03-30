import 'package:flutter/material.dart';

class FeedbackModalTopSheet extends StatelessWidget {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Feedback',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 25),
            SingleChildScrollView(
              // Wrap the TextField inside SingleChildScrollView
              scrollDirection: Axis.vertical,
              child: TextField(
                controller: _feedbackController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter your feedback here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitFeedback(context);
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  void _submitFeedback(BuildContext context) {
    String feedback = _feedbackController.text;
    print('Feedback submitted: $feedback');
    Navigator.pop(context);
  }
}
