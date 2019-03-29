


class Student{
  String lastName;
  String firstName;
  String fullName;
  String id;
  int age;
  String email;
  String factory;
  String objectClass;
  String avatarUrl;
  String password;
  int score;
  Map<String,dynamic> json;

  Student({this.lastName, this.firstName, this.fullName, this.id, this.age,
      this.email, this.factory, this.objectClass, this.avatarUrl,
      this.score});

  factory Student.fromJson(Map<String,dynamic> json){
    return Student(
      lastName: json["last_name"],
      firstName: json["first_name"],
      fullName: json["full_name"],
      id: json["id"],
      age: json["age"],
      email: json["email"],
      factory: json["factory"],
      objectClass: json["object_class"],
      avatarUrl: json["avatar_url"],
      score: json["score"]
    );
  }

  exportDataQR(){
    return "name: $fullName, id: $id, score: $score";
  }

  static cloneStudent(Student student){
    return Student(
        lastName: student.lastName,
        firstName: student.firstName,
        fullName: student.fullName,
        id: student.id,
        age: student.age,
        email: student.email,
        factory: student.factory,
        objectClass: student.objectClass,
        avatarUrl: student.avatarUrl,
        score: student.score);

  }
}