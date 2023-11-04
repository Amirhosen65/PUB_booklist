import 'package:flutter/material.dart';
import 'package:pub_booklist/Searching/About.dart';
import 'package:pub_booklist/Searching/PrivacyPolicy.dart';
import 'package:pub_booklist/Searching/Termsconditions.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class developer extends StatefulWidget {
  const developer({Key? key}) : super(key: key);

  @override
  _developerState createState() => _developerState();
}

class _developerState extends State<developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple.shade900,
        title: Text("Developer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
      body: ListView(
        children: [
          Card(
            elevation: 8,
            child: ListTile(
              title: Text("Jannatul Ferdause"),
              subtitle: Text("Developer"),
              leading: CircleAvatar(
                // backgroundImage: AssetImage("image/ajamir.jpg"),
              ),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){
                launch("tell://+8801797-459078");
              },
              child: ListTile(
                title: SelectableText("+8801797-459078"),
                subtitle: Text("Phone"),
                leading: Icon(Icons.phone),
              ),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){
                launch("jannatulpub@gmail.com");
              },
              child: ListTile(
                title: SelectableText("jannatulpub@gmail.com"),
                subtitle: Text("Contact Mail"),
                leading: Icon(Icons.mail_outline),
              ),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){
                launch("https://www.facebook.com/jannatulferdause.jannatulferdause.90");
              },
              child: ListTile(
                title: SelectableText("facebook.com/jannatulferdause.jannatulferdause.90"),
                subtitle: Text("Facebook"),
                leading: Icon(Icons.facebook),
              ),
            ),
          )
        ],
      ),

    );
  }
}
