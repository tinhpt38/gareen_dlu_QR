


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
}