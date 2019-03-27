import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/user.dart';
import 'package:gareen_dlu_qr/UI/login_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';



class HomePage extends StatefulWidget{
  final User usr;


  const HomePage(@required this.usr);

  @override
  State<StatefulWidget> createState() {

    return HomePageState(usr);
  }
}


class HomePageState extends State<HomePage>{

  final User user;

  HomePageState(@required this.user);

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
            accountName: Text(user.userName),
              accountEmail: Text(user.userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.blue
                    : Colors.white,
                child: Text(user.userName.substring(0,1), style:
                  TextStyle(
                    fontSize: 48
                  ),),
              ),
            ),
            ListTile(
              title: Text("Update Profile",
                  style: TextStyle(
                    fontSize: 16
                  ),),
              leading: Icon(Icons.update,color: Colors.blue,),
            ),
            ListTile(
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
            data: user.userToString(),
            size: width *(2/3),
          ),
        )
      ),
    );
  }
}