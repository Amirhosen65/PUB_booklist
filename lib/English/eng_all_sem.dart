import 'package:flutter/material.dart';
import 'package:pub_booklist/English/eng_1st.dart';
import 'package:pub_booklist/English/eng_2nd.dart';
import 'package:pub_booklist/English/eng_3rd.dart';
import 'package:pub_booklist/English/eng_4th.dart';

class eng_all_sem extends StatefulWidget {
  const eng_all_sem({Key? key}) : super(key: key);

  @override
  State<eng_all_sem> createState() => _eng_all_semState();
}

class _eng_all_semState extends State<eng_all_sem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B.A Hons. in English", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2,0),
                        blurRadius: 5,
                        spreadRadius: 5
                    )]),
              child: ListTile(
                title: Text(
                  index==0?
                  "English 1st Year Book List"
                      :index==1?
                  "English 2nd Year Book List"
                      :index==2?
                  "English 3rd Year Book List"
                      :"English 4th Year Book List",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    index==0?
                    "1"
                        :index==1?
                    "2"
                        :index==2?
                    "3"
                        :"4",
                    style: TextStyle(color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                onTap: (){
                  if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eng_1st()));}
                  if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eng_2nd()));}
                  if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eng_3rd()));}
                  if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eng_4th()));}
                },
              ),
            ),
          );
        },

      ),
    );
  }
}


