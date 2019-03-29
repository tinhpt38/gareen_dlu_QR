import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/UI/home_page.dart';
import 'package:gareen_dlu_qr/UI/login_page.dart';



class UpdateProfilePage extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return UpdateProfilePageSate();
  }
  
}

class UpdateProfilePageSate extends State<UpdateProfilePage>{
  
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Update Profile"),
        backgroundColor: Colors.deepOrange,
        
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child: Column(
            children: <Widget>[
              //add avatar user
              Container(
                height:  width *(1/3),
                width: width * (1/3),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2
                  )
                ),
                child:FlatButton(
                    onPressed: (){
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 32,
                        ),
                      ),
                    ))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24.0),
                child: Text("Phan Trung Tính",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
                ),),
              ),
              Container(
                margin: EdgeInsets.only(left: 32),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Text("1610227",
                    style: TextStyle(
                      fontSize: 28
                    ),),
                    Text("tinhpt.38@gmail.com",
                      style: TextStyle(
                          fontSize: 28
                      ),)
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}