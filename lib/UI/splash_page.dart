import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/student.dart';
import 'package:gareen_dlu_qr/Store/LoginStore.dart';
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
  var urlTinh = "https://api.myjson.com/bins/w1eci";
  var urlLam = "https://api.myjson.com/bins/h3f2a";
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
    var _duration = new Duration(seconds:3);
    this.getDataFromJson(urlTinh);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("Grageen DLU QR Code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.black
              ),),
            ),
            Container(
              alignment: Alignment.center,
              child: IconButton(
                splashColor: Colors.transparent,
                  icon: Icon(Icons.restore_from_trash,color: Colors.green[500],),
                  iconSize: 100,
                  onPressed: null),
            ),
            Container(
              child: Text("Loading ...",
              style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    ),
    );
  }
}

