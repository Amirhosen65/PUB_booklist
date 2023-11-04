import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pub_booklist/splash_screen.dart';
import 'package:pub_booklist/Auth/LogInPage.dart'; // Import your Login page

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.deepPurple, // Set your desired color here
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
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


class _MyAppState extends State<MyApp> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    // Check if a user is already logged in
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      home: _user != null ? SplashScreen() : Login(), // Show SplashScreen if user is logged in, otherwise show Login page
    );
  }
}




class settings_page extends StatefulWidget {
  const settings_page({Key? key}) : super(key: key);

  @override
  State<settings_page> createState() => _settings_pageState();
}


class _settings_pageState extends State<settings_page> {

  final uid = FirebaseAuth.instance.currentUser!.uid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 8,
            child: ListTile(
              title: Text("Themes"),
              subtitle: Text("Dark/Light"),
              trailing: IconButton(onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                });
                }, icon: Icon(_iconBool ? _iconDark : _iconLight), ),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){
              },
              child: ListTile(
                title: Text("Active Status"),
                subtitle: Text("On/Off"),
              ),
            ),
          ),
          Card(
            elevation: 8,
            child: InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text('User ID',
                  style: TextStyle(fontSize: 18.0),),
                subtitle: SelectableText('$uid'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
