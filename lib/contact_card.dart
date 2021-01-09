import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ContactCard extends StatefulWidget {
  File imageFile;
  String fullName, jobTitle, companyName, email, contactNumber;
  Color currentColor;
  ContactCard(
      {this.imageFile,
      this.fullName,
      this.jobTitle,
      this.companyName,
      this.email,
      this.contactNumber,
      this.currentColor});

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  GlobalKey _containerKey = GlobalKey();

  convertWidgetToImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 2);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData.buffer.asUint8List();
    //final base64String = base64Encode(pngBytes); //- for storing in Server
    await Share.file('myCard', 'myCard.png', pngBytes, 'image/png',
        text: 'My Contact Card');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: _containerKey,
                child: Container(
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.currentColor,
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 60,
                          child: Image.file(
                            widget.imageFile,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        widget.fullName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.jobTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 18,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.companyName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          thickness: 3,
                        ),
                      ),
                      Card(
                        //padding: EdgeInsets.all(10), - if using Container
                        color: Colors.white,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            //size: 30,
                            color: Colors.teal,
                          ),
                          title: Text(
                            widget.contactNumber,
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'SourceSansPro',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        //padding: EdgeInsets.all(10), - if using Container
                        color: Colors.white,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            //size: 30,
                            color: Colors.teal,
                          ),
                          title: Text(
                            widget.email,
                            style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily: 'SourceSansPro',
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Card(
                      //   margin: EdgeInsets.only(left: 30, right: 30),
                      //   child: FlatButton(
                      //     //  padding: EdgeInsets.all(30),
                      //     child: ListTile(
                      //       contentPadding: EdgeInsets.only(left: 2),
                      //       tileColor: Colors.white,
                      //       leading: Icon(
                      //         Icons.share_outlined,
                      //         size: 30,
                      //       ),
                      //       title: Text('Share the Card'),
                      //       subtitle: Text('Someone might be waiting!'),
                      //       trailing: Icon(Icons.double_arrow),
                      //     ),
                      //     onPressed: () {
                      //       //share(context);
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ClipOval(
                child: RaisedButton(
                  padding: EdgeInsets.all(30),
                  elevation: 20,
                  onPressed: () {
                    convertWidgetToImage();
                  },
                  color: Colors.blue[400],
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void share(BuildContext context) {
  //   final RenderBox box = context.findRenderObject();
  //   final String text = 'Hi Aveek';
  //   Share.share(text,
  //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  // }
}
