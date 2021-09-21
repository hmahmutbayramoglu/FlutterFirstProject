import 'package:flutter/material.dart';
import 'package:flutter_camp/Models/Student.dart';
import 'package:flutter_camp/screens/student_add.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cupertiono
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student("Mahmut Hüseyin", "Bayramoğlu", 45),
    Student.withId(1, "Alican", "Arslan", 71),
    Student.withId(1, "Murat", "Bayram", 35),
    Student.withId(1, "Murat", "Bayram", 35),
  ];

  Student selectedStudent = Student.withId(0, "---", "---", 0);

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80"),
                ),
                title: Text(students[i].firstName + " " + students[i].lastName),
                tileColor: Color.fromARGB(25, 25, 25, 255),
                subtitle: Text("Aldığı Not: " +
                    " " +
                    students[i].grade.toString() +
                    " [" +
                    students[i].getStatus +
                    "]"),
                trailing: buildStatusIcon(students[i].grade),
                onTap: () => {
                  setState(() {
                    this.selectedStudent = students[i];
                  })
                },
                onLongPress: () => {
                  setState(() {
                    this.selectedStudent = students[i];
                  })
                },
              );
            },
          ),
        ),
        Text("Toplam Öğrenci Sayısı : " + students.length.toString()),
        Text("Seçilen Öğrenci : " + this.selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[Icon(Icons.add),SizedBox(width: 5.0,), Text("Ekle")],
                  ),
                  onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                  },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.green,
                  child: Row(
                    children: <Widget>[Icon(Icons.update),SizedBox(width: 5.0,), Text("Güncelle")],
                  ),
                  onPressed: () { print("Güncelle"); },
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.red,
                  child: Row(
                    children: <Widget>[Icon(Icons.delete),SizedBox(width: 5.0,), Text("Sil")],
                  ),
                  onPressed: () { print("Sil"); },
                ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Öğrenci Takip Sistemi"),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade > 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
