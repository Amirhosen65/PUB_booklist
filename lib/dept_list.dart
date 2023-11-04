import 'package:flutter/material.dart';
import 'package:pub_booklist/BBA/bba_all_sem.dart';
import 'package:pub_booklist/CIVIl/civil_all_sem.dart';
import 'package:pub_booklist/CSE/cse_semester.dart';
import 'package:pub_booklist/EEE/eee_all_sem.dart';
import 'package:pub_booklist/English/eng_all_sem.dart';
import 'package:pub_booklist/Searching/About.dart';
import 'package:pub_booklist/Searching/PrivacyPolicy.dart';
import 'package:pub_booklist/Searching/Termsconditions.dart';
import 'package:pub_booklist/Searching/searchPage2.dart';
import 'package:pub_booklist/home_page.dart';
import 'package:pub_booklist/islamic_state/islamic_state_all.dart';

class techlist extends StatefulWidget {
  const techlist({Key? key}) : super(key: key);

  @override
  _techlistState createState() => _techlistState();
}

class _techlistState extends State<techlist> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Department List", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: size.width*1.0,
                height: 60,
                decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(4,0),
                          blurRadius: 5,
                          spreadRadius: 5
                      )]),
                child: ListTile(
                  title: Text(
                      index==0?
                      "B.Sc. in CSE"
                          :index==1?
                      "B.Sc. in Civil Engineering"
                          :index==2?
                      "B.A Hons. in English"
                          :index==3?
                      "B.Sc. in EEE"
                          :index==4?
                      "BBA"
                          :"B.A Hons. in Islamic Studies",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    index==0?
                    Icons.computer
                        :index==1?
                    Icons.house
                        :index==2?
                    Icons.abc
                        :index==3?
                    Icons.electrical_services
                        :index==4?
                    Icons.tour
                        :Icons.shield_moon_outlined,
                  color: Colors.white,
                  ),


                  onTap: (){
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>cse_all_sem()));}
                    if(index==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>civil_all_sem()));}
                    if(index==2){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>eng_all_sem()));}
                    if(index==3){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_all_sem()));}
                    if(index==4){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>bba_all_sem()));}
                    if(index==5){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>islamic_state_all()));}

                  },
                ),
              ),
            );
          }

      ),
    );
  }
}

