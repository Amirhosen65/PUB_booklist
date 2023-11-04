import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About PUB Book List',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to PUB Book List, your all-in-one companion for accessing and managing your BSC program\'s book resources with ease. Our app is designed to provide a seamless experience for students, making their academic journey smoother and more efficient.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Features:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Sign Up and Log In: Create your personalized account to unlock the full potential of PUB Book List. Seamlessly log in whenever you want to access your study materials and notes.',
            ),
            // Add other feature points similarly
            SizedBox(height: 16.0),
            Text(
              'PUB Book List is committed to providing a user-friendly platform that empowers students to excel in their studies. Our mission is to make education accessible and enjoyable, fostering a positive impact on learning outcomes.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Got questions, feedback, or suggestions? We\'d love to hear from you! Reach out to our support team at [contact@email.com] or visit our website at [www.appwebsite.com].',
            ),
            // Add social media icons with links
          ],
        ),
      ),
    );
  }
}


