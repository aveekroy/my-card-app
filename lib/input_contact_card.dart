import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_card/contact_card.dart';
import 'package:my_card/text_field.dart';

class ContactCardInput extends StatefulWidget {
  @override
  _ContactCardInputState createState() => _ContactCardInputState();
}

class _ContactCardInputState extends State<ContactCardInput> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  File file;
  bool imageUploaded = false;
  var formValues = new Map();
  Color currentColor = Colors.blue[300];

  void changeColor(Color color) => setState(() => currentColor = color);

  handleTakePhoto() async {
    file = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 675, maxWidth: 960);
    if (file == null) {
      Navigator.pop(context);
    } else {
      setState(() {
        this.file = file;
        imageUploaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Hero(
          tag: 'text1',
          child: Text(
            'Create Your Card',
            style: TextStyle(
              fontFamily: 'SourceSans',
              fontSize: 20,
              color: Colors.white,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: ListView(
            //physics: FixedExtentScrollPhysics(),
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white60,
                      child: imageUploaded
                          ? Image.file(
                              file,
                              fit: BoxFit.contain,
                            )
                          : Icon(Icons.photo_camera),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                      elevation: 30,
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                        handleTakePhoto();
                      },
                      color: Colors.cyan[200],
                      child: Text(
                        '\t  Photo Upload \n 1:1 Aspect Ratio',
                        style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 15,
                          color: Colors.black54,
                          //fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              //Full Name
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Form(
                  key: _formKey1,
                  child: ContactTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    specialCharactersNotAllowed: true,
                    isEmpty: false,
                    length: 30,
                    stringsNotAllowed: false,
                    digitsNotAllowed: true,
                    spaceNotAllowed: true,
                    saveTo: (value) => formValues['fullName'] = value,
                  ),
                ),
              ),
              //Job Title
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Form(
                  key: _formKey2,
                  child: ContactTextField(
                    label: 'Job Title',
                    hint: 'Enter your Job Title',
                    specialCharactersNotAllowed: true,
                    isEmpty: false,
                    length: 30,
                    stringsNotAllowed: false,
                    digitsNotAllowed: true,
                    spaceNotAllowed: true,
                    saveTo: (value) => formValues['jobTitle'] = value,
                  ),
                ),
              ),
              //Company Name
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Form(
                  key: _formKey3,
                  child: ContactTextField(
                    label: 'Company Name',
                    hint: 'Enter your Company Name',
                    specialCharactersNotAllowed: true,
                    isEmpty: false,
                    length: 30,
                    stringsNotAllowed: false,
                    digitsNotAllowed: true,
                    spaceNotAllowed: true,
                    saveTo: (value) => formValues['companyName'] = value,
                  ),
                ),
              ),
              //Contact Number
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Form(
                  key: _formKey4,
                  child: ContactTextField(
                    label: 'Email',
                    hint: 'Enter your Email',
                    specialCharactersNotAllowed: false,
                    isEmpty: false,
                    length: 30,
                    stringsNotAllowed: false,
                    digitsNotAllowed: false,
                    spaceNotAllowed: true,
                    saveTo: (value) => formValues['email'] = value,
                  ),
                ),
              ),
              //Email
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Form(
                  key: _formKey5,
                  child: ContactTextField(
                    label: 'Contact Number',
                    hint: 'Enter your Contact Number',
                    specialCharactersNotAllowed: false,
                    isEmpty: false,
                    length: 30,
                    stringsNotAllowed: true,
                    digitsNotAllowed: false,
                    spaceNotAllowed: true,
                    saveTo: (value) => formValues['contactNumber'] = value,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RaisedButton(
                      elevation: 10,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: currentColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Background',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSans',
                          fontSize: 20,
                        ),
                      ),
                      color: currentColor,
                      textColor: useWhiteForeground(currentColor)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: RaisedButton(
                      color: Colors.orange[100],
                      elevation: 10,
                      onPressed: () => save(),
                      child: Container(
                        // width: 150,
                        // height: 40,
                        child: Text(
                          'Create Your Card',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'SourceSans',
                            //fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  save() {
    if (_formKey1.currentState.validate() &&
        _formKey2.currentState.validate() &&
        _formKey3.currentState.validate() &&
        _formKey4.currentState.validate() &&
        _formKey5.currentState.validate()) {
      _formKey1.currentState.save();
      _formKey2.currentState.save();
      _formKey3.currentState.save();
      _formKey4.currentState.save();
      _formKey5.currentState.save();
      Timer(Duration(seconds: 1), () {
        //print('hi');
        // setState(() {
        if (file != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactCard(
                        imageFile: file,
                        fullName: formValues['fullName'],
                        jobTitle: formValues['jobTitle'],
                        companyName: formValues['companyName'],
                        email: formValues['email'],
                        contactNumber: formValues['contactNumber'],
                        currentColor: currentColor,
                      )));
        } else {
          print('No picture taken');
        }
      });
      // });
    }
  }
}
