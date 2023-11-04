import 'package:flutter/material.dart';
import 'package:pub_booklist/Searching/About.dart';
import 'package:pub_booklist/Searching/PrivacyPolicy.dart';
import 'package:pub_booklist/Searching/Termsconditions.dart';
import 'package:pub_booklist/home_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:pub_booklist/BBA/bba_all_sem.dart';
import 'package:pub_booklist/CIVIl/civil_all_sem.dart';
import 'package:pub_booklist/CSE/cse_semester.dart';
import 'package:pub_booklist/EEE/eee_all_sem.dart';
import 'package:pub_booklist/English/eng_all_sem.dart';
import 'package:pub_booklist/islamic_state/islamic_state_all.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  List<String> data = [
    'BSc In CSE',
    'BSc In Civil',
    'BA Hons. Englsih',
    'BSc In EEE',
    'BBA',
    'BA Hons In Islamic Studies',
  ];

  List<String> searchResults = [];

  TextEditingController _searchController = TextEditingController();

  void search(String query) {
    setState(() {
      searchResults = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (result) => setState(() {
            _searchController.text = result.recognizedWords;
          }),
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Here'),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) => search(query),
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform search based on the current value in the _searchController
                        search(_searchController.text);
                      },
                    ),
                    IconButton(
                      icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
                      onPressed: toggleListening,
                    ),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final result = searchResults[index];
                return ListTile(
                  title: Text(result),
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cse_all_sem()));
                    }
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => civil_all_sem()));
                    }
                    if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => eng_all_sem()));
                    }
                    if (index == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => eee_all_sem()));
                    }
                    if (index == 4) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bba_all_sem()));
                    }
                    if (index == 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => islamic_state_all()));
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



