import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/student.dart';
import 'package:gareen_dlu_qr/UI/home_page.dart';
import 'package:gareen_dlu_qr/UI/login_page.dart';
import "package:http/http.dart" as http;


void main(){
  var url = "https://api.myjson.com/bins/ypmuq";
  Future<Student> student = getDataFromJson(url);

  runApp(MaterialApp(home: LoginPage()));

}

//https://api.myjson.com/bins/ypmuq



Future<Student> getDataFromJson(String url) async{
  var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  if(res.statusCode == 200){
    var data  = json.decode(res.body);
    var student = data["student"] as Student;
    return student;
  }
  return null;
}