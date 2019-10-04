import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'UserManagerImpl.dart';
import 'UserLoginAndRegisterScreen.dart';

class RoutingPage extends StatefulWidget
{
  final iUserManager auth;

  RoutingPage
  ({
    this.auth,
  });

  State<StatefulWidget> createState()
  {
    return _RoutingPageState();
  }

}

enum AuthStatus
{
  notSignedIn,
  signedIn
}

class _RoutingPageState extends State<RoutingPage>
{
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();

    widget.auth.getCurrentUser().then((firebaseUserId)
    {
      setState(() {
        authStatus = firebaseUserId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn()
  {
    setState(() {
     authStatus = AuthStatus.signedIn; 
    });
  }

  void _signOut()
  {
    setState(() {
     authStatus = AuthStatus.notSignedIn; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(authStatus)
    {
      case AuthStatus.notSignedIn: 
      return new UserLoginAndRegisterPage
      (
        authincation: widget.auth,
        onSignedIn: _signedIn
      );

      case AuthStatus.signedIn: 
      return new HomeScreen
      (
        auth: widget.auth,
        onSignedOut: _signOut
      );
    }
    return null;
  }
}