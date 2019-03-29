import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/student.dart';
import 'package:gareen_dlu_qr/UI/home_page.dart';
import 'package:gareen_dlu_qr/UI/login_page.dart';
import 'package:gareen_dlu_qr/UI/splash_page.dart';
import "package:http/http.dart" as http;


void main(){
  var url = "https://api.myjson.com/bins/ypmuq";
//  Future<Student> student = getDataFromJson(url);

  runApp(MaterialApp(home: SplashPage()));

}

//https://api.myjson.com/bins/ypmuq



