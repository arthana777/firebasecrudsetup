class Items {
  late String studentName;
  late String studentID;
  late String studyProgramID;
  late double studentCGPA;

  Items({
    required this.studentName,
    required this.studentCGPA,
    required this.studyProgramID,
    required this.studentID
  });
  Map<String, dynamic> toMap() {
    return {
      'studentName': studentName,
      'studentID': studentID,
      'studyProgramID': studyProgramID,
      'studentCGPA': studentCGPA,
    };
  }
  }



//   getStudentName(name){
//     this.studentName=name;
//   }
//   getStudentID(id){
//     this.studentID=id;
//   }
//   getstudyProgramID(ProgramID){
//     this.studyProgramID=ProgramID;
//   }
//
//   getStudentCGPA(CGPA){
//     this.studentCGPA=double.parse(CGPA);
//   }
// }
