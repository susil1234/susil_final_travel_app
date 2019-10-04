import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';

abstract class iUserManager
{
   Future<String> SignIn(String email, String password);
   Future<String> SignUp(String email, String password);
   Future<String> getCurrentUser();
   Future<void> signOut();
  
}

class ManagerUserImpl implements iUserManager
{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> SignIn(String email, String password) async
  {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> SignUp(String email, String password) async
  {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }
  Future<String> getCurrentUser() async
  {
    FirebaseUser user = await _firebaseAuth.currentUser();
  }

  Future<void> signOut() async
  {
    _firebaseAuth.signOut();
  }
  
}