import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pub_booklist/Auth/Account.dart';
import 'package:pub_booklist/Auth/LogInPage.dart';
import 'package:pub_booklist/Auth/UserInformation.dart';
import 'package:pub_booklist/NoteScreen.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/dept_list.dart';
import 'package:pub_booklist/developer.dart';
import 'package:pub_booklist/main.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final value= await
        showDialog<bool>(context: context, builder: (builder){
          return AlertDialog(
            title: Text("PUB Booklist"),
            content: Text("Do you want to Exit?"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop(false);
                }, child: Text("No")),
              TextButton(onPressed: (){
                Navigator.of(context).pop(true);
                }, child: Text("Yes"))
            ],
          );
        });
        if(value!= null){
          return Future.value(value);
        }else{
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.purple.shade900,
          title: Center(child: Text("PUB Book List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SearchPage()),
              );
              }, icon: Icon(Icons.search_rounded))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(accountName: Text("PUB",style: TextStyle(fontSize: 20),),
                accountEmail: Text("PUB Book List",style: TextStyle(fontSize: 16),),
                decoration: BoxDecoration(color: Colors.purple.shade900),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/pub_logo.png"),
                ),
              ),
              ListTile(
                title: Text("Home", style: TextStyle(color: Colors.purple.shade700,fontWeight: FontWeight.bold,fontSize: 20),),
                leading: Icon(Icons.home, color: Colors.purple.shade700,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home_page()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Settings", style: TextStyle(color: Colors.purple.shade700,fontWeight: FontWeight.bold,fontSize: 20),),
                leading: Icon(Icons.settings, color: Colors.purple.shade700,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>settings_page()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Account", style: TextStyle(color: Colors.purple.shade700,fontWeight: FontWeight.bold,fontSize: 20),),
                leading: Icon(Icons.info, color: Colors.purple.shade700,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Contact Us", style: TextStyle(color: Colors.purple.shade700,fontWeight: FontWeight.bold,fontSize: 20),),
                leading: Icon(Icons.contact_support, color: Colors.purple.shade700,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>developer()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Write Note", style: TextStyle(color: Colors.purple.shade700,fontWeight: FontWeight.bold,fontSize: 20),),
                leading: Icon(Icons.note_alt_outlined, color: Colors.purple.shade700,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteScreen()));
                },
              ),
              Divider(),
              ListTile(
                title: Text("Logout", style: TextStyle(color: Colors.purple.shade700,fontWeight: FontWeight.bold,fontSize: 20),),
                leading: Icon(Icons.logout, color: Colors.purple.shade700,),
                onTap: () async => {
                  await FirebaseAuth.instance.signOut(),
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Login(),
                  ),
                  (route) => false)
                },
              ),
              Divider(),
            ],
          ),
        ),
        body: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),

                Image.asset("images/book_library.jpg", height: 287,width: 332,)
              ],
            ),
            SizedBox(height: 10,),
            Center(
              child: GestureDetector (
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>techlist()));
                },
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade700,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Start", style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
