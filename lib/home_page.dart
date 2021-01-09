import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_card/input_contact_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('images/mycard.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset(
                'images/start.png',
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
            // Center(
            //   child: TypewriterAnimatedTextKit(
            //     text: ['my Friend!'],
            //     textStyle: TextStyle(
            //       fontFamily: 'SourceSans',
            //       fontSize: 20,
            //       color: Colors.green[200],
            //       //fontWeight: FontWeight.w900,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            ClipRect(
              child: Card(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactCardInput()));
                  },
                  child: Hero(
                    tag: 'text1',
                    child: Text(
                      'Create & Share!!',
                      style: TextStyle(
                        fontFamily: 'SourceSans',
                        fontSize: 18,
                        color: Colors.black54,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: Colors.orange[100],
                  elevation: 20,
                  padding: EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
