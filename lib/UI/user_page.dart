import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/user.dart';



class UserPage extends StatefulWidget{

  final User usr;

  UserPage(@required this.usr);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserPageState(this.usr);
  }

}


class UserPageState extends State<UserPage>{

  final User user;

  UserPageState(@required this.user);


   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("User Page"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                  margin: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.green,
                  ),
                  child: Text(this.user.userId,style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                  margin: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.green,
                  ),
                  child: Text(this.user.password,style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                ),
              ],
          ),
        ),
      ),
    );
  }
}