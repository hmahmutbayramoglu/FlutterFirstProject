import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camp/Models/Student.dart';
import 'package:flutter_camp/main.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;

  /*
  StudentAdd(List<Student> students){
    this.students = students;
  }
  */
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();

  Student student = Student("", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Öğrenci Takip Sistemi"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Adı", hintText: "Mahmut Hüseyin"),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soyadı", hintText: "Bayramoğlu"),
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Notu", hintText: "85"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return
      Container(
        margin: EdgeInsets.all(20),
        child:RaisedButton(
          child: Text("Kaydet"),
          onPressed: () {
            this.formKey.currentState!.save();
            widget.students.add(student);
            //widget.createState();
            Navigator.pop(context);

          },
        ),
      );
      
  }
}
