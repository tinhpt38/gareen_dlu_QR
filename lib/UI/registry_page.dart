import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/user.dart';
import 'package:gareen_dlu_qr/UI/qr_code_generator.dart';




class RegistryPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return RegistryPageState();
  }

}


class RegistryPageState extends State<RegistryPage>{

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Registry Page"),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(bottom: 32.0),
                  height: height/3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.deepOrange[300],
                          Colors.orange
                        ],
                      )
                  ),
                  child: Center(
                      child: Text("Register Account",
                        style:TextStyle(
                            fontSize: 32,
                            color: Colors.white),)
                  )
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: idController,
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
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      hintText: "User Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  obscureText: true,
                  controller: pwdController,
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
                child: TextField(
                  obscureText: true,
                  controller: confirmPwdController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      hintText: "Confirm password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                onPressed: (){
                  checkFillIn();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 32),
                  padding: EdgeInsets.symmetric(vertical: 18,horizontal: 48),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.deepOrange[300]
                  ),
                  child: Text("Registry",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  checkFillIn(){
    if(!idController.text.isEmpty &&
        !nameController.text.isEmpty &&
        !emailController.text.isEmpty &&
        !pwdController.text.isEmpty){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>QRCodeGeneratorPage(
              User(idController.text, pwdController.text,nameController.text,pwdController.text)
          )));

    }else{

    }
  }
}