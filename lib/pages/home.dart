import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_model/user_model.dart';

class HomePage extends StatelessWidget {
  Widget _buildHomePageScaffold(BuildContext context, UserModel model) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/trusted-doctor-logo.jpeg'),
                    radius: 40.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Trusted-Doctor',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text('Hello, Guest User')
                ],
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Login'),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('FAQ'),
              onTap: () => Navigator.pushNamed(context, '/faq'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Trusted-Doctor'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () => Navigator.pushNamed(context, '/login')),
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/trusted-doctor-background.jpeg'))),
          child: Center(child: Text('Dummy Data'))),
      floatingActionButton: FloatingActionButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Icon(Icons.search)],
          ),
          onPressed: () => Navigator.pushNamed(context, '/search')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (BuildContext context, Widget child, UserModel model) {
        return _buildHomePageScaffold(context, model);
      },
    );
  }
}
