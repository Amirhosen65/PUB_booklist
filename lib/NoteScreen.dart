import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:pub_booklist/Searching/About.dart';
import 'package:pub_booklist/Searching/PrivacyPolicy.dart';
import 'package:pub_booklist/Searching/Termsconditions.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/home_page.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _currentUser;
  late CollectionReference _noteCollection;
  List<String> notes = [];
  late Future<void> _fetchNotesFuture;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  bool _isConnected = true;
  bool _showInternetSnackbar = false;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser!;
    _noteCollection =
        FirebaseFirestore.instance.collection('user_notes').doc(_currentUser.uid).collection('notes');
    _fetchNotesFuture = _fetchNotes();

    // Start listening for connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _isConnected = (result != ConnectivityResult.none);
      if (_isConnected) {
        // If connected and Snackbar is pending to show, display it now
        if (_showInternetSnackbar) {
          _showSnackbar('Internet connected!');
          _showInternetSnackbar = false;
        }
      } else {
        // When disconnected, set flag to show Snackbar when connected again
        _showInternetSnackbar = true;
      }
    });
  }

  Future<void> _fetchNotes() async {
    try {
      QuerySnapshot querySnapshot = await _noteCollection.get();
      List<String> fetchedNotes = querySnapshot.docs.map((doc) => doc['note'] as String).toList();

      setState(() {
        // Reverse the order of the fetched notes so that new ones appear at the top
        notes = fetchedNotes.reversed.toList();
      });
    } catch (e) {
      print('Error fetching notes: $e');
    }
  }


  void _addNote(String note) async {
    try {
      await _noteCollection.add({'note': note});
      setState(() {
        notes.add(note);
      });
      _showSnackbar('Note added successfully!');
    } catch (e) {
      print('Error adding note: $e');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showNoteDialog() async {
    String note = await showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _controller = TextEditingController();
        return AlertDialog(
          title: Text('Add Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                maxLines: 8,
                decoration: InputDecoration(hintText: 'Enter your note here'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            ),
          ],
        );
      },
    );

    if (note != null && note.isNotEmpty) {
      _addNote(note);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
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
      body: _isConnected ? _buildNotesListView() : _buildNoInternetView(),
      floatingActionButton: _isConnected ? _buildAddNoteButton() : null,
    );
  }

  Widget _buildNotesListView() {
    return FutureBuilder(
      future: _fetchNotesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching notes'),
          );
        } else {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(notes[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red,),
                      onPressed: () => _deleteNote(index),
                    ),
                  ),
                  Divider(), // Add a Divider below each ListTile
                ],
              );
            },
          );
        }
      },
    );
  }



  void _deleteNote(int index) async {
    try {
      String noteToDelete = notes[index];
      await _noteCollection.where('note', isEqualTo: noteToDelete).get().then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });

      setState(() {
        notes.removeAt(index);
      });

      _showSnackbar('Note deleted successfully!');
    } catch (e) {
      print('Error deleting note: $e');
    }
  }



  Widget _buildNoInternetView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
          SizedBox(height: 16),
          Text('No Internet. Waiting for connection!', style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildAddNoteButton() {
    return FloatingActionButton(
      onPressed: _showNoteDialog,
      tooltip: 'Add Note',
      child: Icon(Icons.add),
    );
  }
}
