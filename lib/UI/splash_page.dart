import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/student.dart';
import 'package:gareen_dlu_qr/UI/home_page.dart';
import 'package:gareen_dlu_qr/UI/login_page.dart';
import 'package:http/http.dart' as http;


class SplashPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {

    return SplashPageState();
  }

}

class SplashPageState extends State<SplashPage>{

  Student student;
  var urlData = "https://api.myjson.com/bins/xizcy";
  var urlNull = "https://api.myjson.com/bins/159m82";

  Future<Student> getDataFromJson(String url) async{
    var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    setState((){
      if(res.statusCode == 200){
        var data = json.decode(res.body);
        this.student = Student.fromJson(data["student"]);
      }
    });
  }

  startTime() async {
    var _duration = new Duration(seconds:5);
    this.getDataFromJson(urlData);
    return new Timer(_duration, navigationPage);
  }

  navigationPage(){
    if(this.student != null) {
      Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) => HomePage(student)));
    }else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Container(
      child: Center(
        child: Text("splash"),
      ),
    ),
    );
  }
}

