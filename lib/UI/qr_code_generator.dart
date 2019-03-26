import 'package:flutter/material.dart';
import 'package:gareen_dlu_qr/Model/user.dart';
import 'package:qr_flutter/qr_flutter.dart';



class QRCodeGeneratorPage extends StatefulWidget{
  final User usr;

  const QRCodeGeneratorPage(@required this.usr);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QRCodeGeneratorPageState(this.usr);
  }
}


class QRCodeGeneratorPageState extends State<QRCodeGeneratorPage>{

  final User user ;

  QRCodeGeneratorPageState(this.user);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: RepaintBoundary(
            child: QrImage(
            size: width * (2/3),
              data: user.userToString(),
            ),
          ),
        ),
      ),
    );
  }
}