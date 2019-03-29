
import 'package:gareen_dlu_qr/Model/student.dart';

class LoginStore{
  static final LoginStore instance = LoginStore._internal();
  Student student;

  factory LoginStore(){
    return instance;
  }

  LoginStore._internal();

  setStudentTemp(Student student){
    this.student = student;
  }

  getStudentTemp(){
    return this.student;
  }

}