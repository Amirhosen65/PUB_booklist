import 'package:flutter/material.dart';
import 'package:pub_booklist/BBA/BBA_1st_sem.dart';
import 'package:pub_booklist/BBA/BBA_2nd_sem.dart';
import 'package:pub_booklist/BBA/BBA_3rd_sem.dart';
import 'package:pub_booklist/BBA/BBA_5th_sem.dart';
import 'package:pub_booklist/BBA/BBA_6th_sem.dart';
import 'package:pub_booklist/BBA/BBA_7th_sem.dart';
import 'package:pub_booklist/BBA/BBA_8th_sem.dart';
import 'package:pub_booklist/BBA/bba_4th_sem.dart';

class bba_all_sem extends StatefulWidget {
  const bba_all_sem({Key? key}) : super(key: key);

  @override
  State<bba_all_sem> createState() => _bba_all_semState();
}

class _bba_all_semState extends State<bba_all_sem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BBA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
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
                  "1st Semester Book List"
                      :index==1?
                  "2nd Semester Book List"
                      :index==2?
                  "3rd Semester Book List"
                      :index==3?
                  "4th Semester Book List"
                      :index==4?
                  "5th Semester Book List"
                      :index==5?
                  "6th Semester Book List"
                      :index==6?
                  "7th Semester Book List"
                      :"8th Semester Book List",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_1st_SEM()));}
                  if(index==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_2nd_SEM()));}
                  if(index==2){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_3rd_SEM()));}
                  if(index==3){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_4th_SEM()));}
                  if(index==4){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_5th_SEM()));}
                  if(index==5){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_6th_SEM()));}
                  if(index==6){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_7th_SEM()));}
                  if(index==7){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BBA_8th_SEM()));}
                },
              ),
            ),
          );
        },

      ),
    );
  }
}
