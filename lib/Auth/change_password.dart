import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pub_booklist/Auth/LogInPage.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/home_page.dart';
import 'package:url_launcher/url_launcher.dart';


class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Your Password has been Changed. Login again !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
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
                        final url=("https://www.app-privacy-policy.com/live.php?token=2xMfhXognKmGXQCfd249Xqsg7UBOlpWX");
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceWebView: true,
                            enableJavaScript: true,
                          );
                        }
                      },
                    ),
                    ListTile(
                        title: Text("Terms&Conditions"),
                        onTap: () async {
                          final url = ("https://www.app-privacy-policy.com/live.php?token=y4WbeKYClIwOTkrAfS4GBUkLGKTCuPDy");
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceWebView: true,
                              enableJavaScript: true,
                            );
                          }
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
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                      },
                    ),
                  ],
                ))
              ])
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'New Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      newPassword = newPasswordController.text;
                    });
                    changePassword();
                  }
                },
                child: Text(
                  'Change Password',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
