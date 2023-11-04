import 'package:flutter/material.dart';
import 'package:pub_booklist/Searching/About.dart';
import 'package:pub_booklist/Searching/PrivacyPolicy.dart';
import 'package:pub_booklist/Searching/Termsconditions.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/home_page.dart';


class settings_page extends StatefulWidget {
  const settings_page({Key? key}) : super(key: key);

  @override
  State<settings_page> createState() => _settings_pageState();
}

bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nightlight;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
      brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.yellow,
  brightness: Brightness.dark,
);

class _settings_pageState extends State<settings_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              _iconBool = !_iconBool;
            });
            }, icon: Icon(_iconBool ? _iconDark : _iconLight), ),
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
      body: ListView(
        children: [
          Card(
            elevation: 8,
            child: ListTile(
              title: Text("Themes"),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){
              },
              child: ListTile(
                title: Text("+8801797-459078"),
              ),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text("jannatulpub@gmail.com"),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
