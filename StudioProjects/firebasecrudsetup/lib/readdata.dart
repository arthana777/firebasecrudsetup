import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrudsetup/model/studentmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  List<Items>student=[];
  @override
  void initState(){
    fetchRecords();
    super.initState();
  }
  Future<void> fetchRecords() async {
    try {
      final records =
      await FirebaseFirestore.instance.collection('student').get();
      mapRecords(records);
    } catch (error) {
      print("Error fetching records: $error");
    }
  }
  void mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    setState(() {
      student = records.docs.map((studentDoc) {
        return Items(
          studentName: studentDoc['student name'],
          studentCGPA: studentDoc['student cgpa'],
          studyProgramID: studentDoc['program id'],
          studentID: studentDoc.id,
        );
      }).toList();
    });
  }


  final CollectionReference store=FirebaseFirestore.instance.collection('store');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('read data'),),
      body: ListView.builder(
        itemCount: student.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(student[index].studentName),
              subtitle: Text(student[index].studentID),
            );
          }),

    );
  }
}