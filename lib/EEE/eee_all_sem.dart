import 'package:flutter/material.dart';
import 'package:pub_booklist/EEE/eee_1y_1s.dart';
import 'package:pub_booklist/EEE/eee_1y_2s.dart';
import 'package:pub_booklist/EEE/eee_2y_1s.dart';
import 'package:pub_booklist/EEE/eee_2y_2s.dart';
import 'package:pub_booklist/EEE/eee_3y_1s.dart';
import 'package:pub_booklist/EEE/eee_3y_2s.dart';
import 'package:pub_booklist/EEE/eee_4y_1s.dart';
import 'package:pub_booklist/EEE/eee_4y_2sem.dart';



class eee_all_sem extends StatefulWidget {
  const eee_all_sem({Key? key}) : super(key: key);

  @override
  State<eee_all_sem> createState() => _eee_all_semState();
}

class _eee_all_semState extends State<eee_all_sem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B.Sc. in EEE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
      body: ListView.builder(
        itemCount: 8,
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
                  "1st Year 1st Semester Book List"
                      :index==1?
                  "1st Year 2nd Semester Book List"
                      :index==2?
                  "2nd Year 1st Semester Book List"
                      :index==3?
                  "2nd Year 2nd Semester Book List"
                      :index==4?
                  "3rd Year 1st Semester Book List"
                      :index==5?
                  "3rd Year 2nd Semester Book List"
                      :index==6?
                  "4th Year 1st Semester Book List"
                      :"4th Year 2nd Semester Book List",
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
                        :index==3?
                    "4"
                        :index==4?
                    "5"
                        :index==5?
                    "6"
                        :index==6?
                    "7"
                        :"8",
                    style: TextStyle(color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.bold),),
                ),
                onTap: (){
                  if(index==0){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_1y_1s()));}
                  if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_1y_2s()));}
                  if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_2y_1s()));}
                  if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_2y_2s()));}
                  if(index==4){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_3y_1s()));}
                  if(index==5){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_3y_2s()));}
                  if(index==6){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_4y_1s()));}
                  if(index==7){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>eee_4y_2se()));}
                },
              ),
            ),
          );
        },

      ),
    );
  }
}
