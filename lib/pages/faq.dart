import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/trusted-doctor-background2.jpeg'))),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text('Dummy Data'),
        ),
      ),
    );
  }
}
