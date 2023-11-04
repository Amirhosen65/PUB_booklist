import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final String privacyPolicyText = '''
    Your Privacy is Important to Us
    
    PUB Book List is committed to protecting your privacy and ensuring that your personal information is handled safely and securely. This Privacy Policy outlines the types of information we collect, how we use and protect it, and your rights regarding your information.

    Information Collection and Usage
    
    - Personal Information: When you sign up for an account, we collect your name, email address, and other relevant information to provide you with personalized services.
    
    - Usage Data: We may collect information about how you interact with the app, such as the books you access, notes you create, and features you use. This data helps us improve our services and user experience.
    
    Information Sharing
    
    We do not sell, rent, or share your personal information with third parties for marketing purposes. We may share your information with trusted service providers to deliver certain services within the app.
    
    Data Security
    
    We take data security seriously. We implement industry-standard security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction.
    
    Your Choices
    
    You can review, update, or delete your account information at any time. You may also opt out of receiving certain communications from us.
    
    Changes to Privacy Policy
    
    We reserve the right to update this Privacy Policy as our app evolves. We will notify you of any significant changes through the app or other means.
    
    Contact Us
    
    If you have any questions or concerns regarding this Privacy Policy, please contact us at [contact@email.com].
    ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(privacyPolicyText),
      ),
    );
  }
}


