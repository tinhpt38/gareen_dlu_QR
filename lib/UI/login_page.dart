import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/user.dart';
import 'package:gareen_dlu_qr/UI/home_page.dart';
import 'package:gareen_dlu_qr/UI/user_page.dart';
import 'package:gareen_dlu_qr/UI/registry_page.dart';




class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{

  TextEditingController userIDController = TextEditingController();
  TextEditingController pwdControler = TextEditingController();

   static User usrD = User("1610227","CarryU","Phan Trung Tính","tinhpt.38@gmail.com");



  @override
  Widget build(BuildContext context) {
//    userIDController.text = usrD.userId;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: "Grabage Green DLU",
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.green,
        ),
        body:  Container(
            child: SingleChildScrollView(
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 32.0),
                      height: height/3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.green[600],
                              Colors.greenAccent
                            ],
                          )
                      ),
                      child: Center(
                        child: IconButton(
                            icon: Icon(Icons.people,color: Colors.white,),
                            onPressed: null,
                            iconSize: 100),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      controller: userIDController,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          hintText: "User ID",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: pwdControler,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FlatButton(onPressed: (){
                                 checkCondination(context);
                                },
                             splashColor: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 48,vertical: 18),
                              decoration: BoxDecoration(
                                 color: Colors.green,
                                 borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Text(
                                "Login",style: TextStyle(fontSize: 18,color: Colors.white),
                              ),
                           ))
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: FlatButton(
                      textColor: Colors.green[500],
                      color: Colors.transparent,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>RegistryPage()));
                      },
                      child: Text("Don't have account? Registry now",
                      style: TextStyle(fontSize: 16),),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  checkCondination(BuildContext context){
    if(pwdControler.text.isEmpty){
      _showDialog("Password Empty","Please input your password");
    }else if(userIDController.text != usrD.userId){
      _showDialog("User ID don't match","Please input your User ID again.");
    }else if(pwdControler.text != usrD.password){
        _showDialog("Password don't match","Please input your password again.");
    }else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePage(usrD)));
    }
  }

  void _showDialog(String title,String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return
          AlertDialog(
            title: Text(title),
            content: new Text(message),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  pwdControler.text = null;
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
      },
    );
  }

}