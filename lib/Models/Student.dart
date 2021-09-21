class Student {

  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String _status = "";

  Student(String firstName,String lastName,int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }

  //named constructor
  Student.withId(int id, String firstName,String lastName,int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus {
    String status = "";

    if (this.grade >= 50) {
      status = "Geçti";
    } else if (this.grade > 40) {
      status = "Bütünlemeye Kaldı";
    }else{
      status = "kaldı";
    }
    this._status = status;
    return this._status;

  }
}
