import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/student.dart';
import 'package:gareen_dlu_qr/Store/LoginStore.dart';
import 'package:gareen_dlu_qr/UI/login_page.dart';
import 'package:gareen_dlu_qr/UI/update_profile_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';



class HomePage extends StatefulWidget{
  final Student student;


  const HomePage(@required this.student);

  @override
  State<StatefulWidget> createState() {
    LoginStore.instance.setStudentTemp(student);
    return HomePageState(student);
  }
}


class HomePageState extends State<HomePage>{

  final Student student;

  HomePageState(@required this.student);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        backgroundColor: Colors.green[500],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(

            accountName: Text(student.fullName,
                style: TextStyle(fontSize: 18),),
              accountEmail: Text(student.email),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(student.avatarUrl)
                  )
                ),
              )
            ),
            ListTile(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => UpdateProfilePage()));
              },
              title: Text("Update Profile",
                  style: TextStyle(
                    fontSize: 16
                  ),),
              leading: Icon(Icons.update,color: Colors.blue,),
            ),
            ListTile(
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              title: Text("Logout",
              style: TextStyle(
                fontSize: 16
              ),),
              leading: Icon(Icons.exit_to_app,color: Colors.red,),
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: QrImage(
            data: student.exportDataQR(),
            size: width *(2/3),
          ),
        )
      ),
    );
  }
}


void onSelectedItem(int index){


}