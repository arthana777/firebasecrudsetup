

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller= TextEditingController();

  late String studentName;
  late String studentID;
  late String studyProgramID;
  late double studentCGPA;

  getStudentName(name){
    this.studentName=name;
  }
  getStudentID(id){
    this.studentID=id;
  }
  getstudyProgramID(ProgramID){
    this.studyProgramID=ProgramID;
  }

  getStudentCGPA(CGPA){
    this.studentCGPA=double.parse(CGPA);
  }
  Future createData(String studentName)async{
    print('created');
    final docUser=FirebaseFirestore.instance.collection("mycollection").doc(studentName);
    //   DocumentReference documentReference=
    //   Firebase.instance.collection("Mystudents").document(studentName);

    Map<String,dynamic>students= {
      "studentName" : studentName,
      "student id":studentID,
      "studentprogramid":studyProgramID,
      "cgpa":studentCGPA,

    };
    docUser.set(students).whenComplete((){
      print("student name created");
    });

  }
  Future<void> readData() async {
    print("readed");
    final docUser = FirebaseFirestore.instance.collection("mycollection").doc(studentName);

    try {
      final value = await docUser.get();
      final data = value.data();
      print(data);
    } catch (error) {
      print("Error: $error");
    }
  }
  updatedData(){
    print('updated');
  }
  deleteData(){
    print("delete");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My University'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'name',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(

                  )
              ),
              onChanged: (String name){
                getStudentName(name);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Student id',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(

                  )
              ),
              onChanged: (String id){
                getStudentID(id);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'program id',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(

                  )
              ),
              onChanged: (String programID){
                getstudyProgramID(programID);

              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'CGPA',
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(

                  )
              ),
              onChanged: (String CGPA){
                getStudentCGPA(CGPA);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  createData(studentName);
                },
                child: Text('create'),
              ),
              ElevatedButton(
                onPressed: (){
                  readData();
                },
                child: Text('read'),
              ),
              ElevatedButton(
                onPressed: (){
                  updatedData();
                },
                child: Text('update'),
              ),
              ElevatedButton(
                onPressed: (){
                  deleteData();
                },
                child: Text('delete'),
              ),
            ],
          )
        ],
      ),

    );
  }
}
