import 'package:flutter/material.dart';
import 'package:susil_travel_app/Routhing.dart';
import 'package:susil_travel_app/UserLoginAndRegisterScreen.dart';

import 'UserManagerImpl.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      home: RoutingPage(auth: ManagerUserImpl(),),
    );
  }
}
