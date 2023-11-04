import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  final String termsAndConditionsText = '''
    Terms and Conditions
    
    Welcome to PUB Book List! These terms and conditions outline the rules and regulations for the use of our app.
    
    By accessing this app, you accept these terms and conditions in full. Do not continue to use PUB Book List if you do not accept all of the terms and conditions stated on this page.
    
    The following terminology applies to these Terms and Conditions: "User," "You," and "Your" refers to you, the person accessing this app and accepting these terms and conditions.
    
    - Use of the App: The content of this app is for your general information and use only. It is subject to change without notice.
    
    - Privacy: Your use of PUB Book List is also governed by our Privacy Policy. Please review our Privacy Policy to understand our practices.
    
    - Account: When you create an account with us, you must provide accurate and complete information. You are responsible for maintaining the confidentiality of your account and password.
    
    - Intellectual Property: All trademarks, service marks, and trade names used in the app are the property of their respective owners. The app and its original content are protected by copyright, trademark, and other intellectual property laws.
    
    - Prohibited Activities: You are prohibited from using the app for any unlawful purpose or any activity that may damage the app's functionality or interfere with others' use.
    
    - Limitation of Liability: PUB Book List shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.
    
    These terms and conditions are subject to change without notice. By continuing to use this app, you agree to be bound by the updated terms and conditions.
    
    If you have any questions or concerns regarding these terms and conditions, please contact us at [contact@email.com].
    ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(termsAndConditionsText),
      ),
    );
  }
}


