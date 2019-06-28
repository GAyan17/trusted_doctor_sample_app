import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String _user;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildUserTextField() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: 'User-Name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          icon: Icon(
            Icons.email,
            color: Theme.of(context).accentColor,
          )),
      validator: (String value) {
        if(value.trim().isEmpty)
          return 'Invalid Username';
      },
      onSaved: (String value) {
        _user = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          icon: Icon(
            Icons.vpn_key,
            color: Theme.of(context).accentColor,
          )),
      validator: (String value) {
        if(value.trim().isEmpty) {
          return 'Password too short';
        }
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Theme.of(context).accentColor, BlendMode.dstATop),
      image: AssetImage('assets/trusted-doctor-background.jpeg'),
    );
  }

  Widget _buildLoginButton() {
    return RaisedButton(
        child: Text('Login'),
        color: Theme.of(context).accentColor,
        onPressed: () {
          if(!_formKey.currentState.validate()) {
            return ;
          }
          _formKey.currentState.save();
          Navigator.pushReplacementNamed(context, '/');
        });
  }

  Widget _buildSignUpButton() {
    return RaisedButton(
      child: Text('Sign Up'),
      color: Theme.of(context).accentColor,
      onPressed: () => Navigator.pushNamed(context, '/signup'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildUserTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildLoginButton(),
                        SizedBox(width: 10.0,),
                        _buildSignUpButton()
                      ],
                    )
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
