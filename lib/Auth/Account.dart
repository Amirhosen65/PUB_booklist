import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pub_booklist/Auth/LogInPage.dart';
import 'package:pub_booklist/Auth/change_password.dart';
import 'package:pub_booklist/Auth/forgot_password.dart';
import 'package:pub_booklist/Searching/About.dart';
import 'package:pub_booklist/Searching/PrivacyPolicy.dart';
import 'package:pub_booklist/Searching/Termsconditions.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.deepPurple,
          content: Text(
            'Verification mail has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) =>[
                PopupMenuItem(child: Column(
                  children: [
                    ListTile(
                      title: Text("Home"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>home_page()));
                      },
                    ),
                    ListTile(
                      title: Text("Privacy Policy"),
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyPage()));

                      },
                    ),
                    ListTile(
                        title: Text("Terms&Conditions"),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditionsPage()));

                        }
                    ),
                    ListTile(
                      title: Text("Search"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                      },
                    ),
                    ListTile(
                      title: Text("About"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
                      },
                    ),
                  ],
                ))
              ])
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('User ID',
              style: TextStyle(fontSize: 18.0),),
            subtitle: SelectableText('$uid'),
            leading: Icon(Icons.all_inclusive),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Email',
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: SelectableText('$email'),
            leading: Icon(Icons.mail),
            trailing: user!.emailVerified
                ? Text(
              'Verified',
              style: TextStyle(fontSize: 18.0, color: Colors.green.shade700),
            )
                : TextButton(
                  onPressed: () => {verifyEmail()},
                  child: Text('Verify',
                style: TextStyle(color: Colors.red),)),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Created Time',
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: SelectableText('$creationTime'),
            leading: Icon(Icons.access_time),
          ),
          Divider(),
          SizedBox(height: 5,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
            },
            child: Text('Change Password'),
            style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () async => {
              await FirebaseAuth.instance.signOut(),
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                      (route) => false)
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(primary: Colors.red),
          ),
        ],
      ),
    );
  }
}
