import 'package:flutter/material.dart';
import 'UserManagerImpl.dart';


class UserLoginAndRegisterPage extends StatefulWidget
{
  UserLoginAndRegisterPage
  ({
    this.authincation,
    this.onSignedIn,
  });
  final iUserManager authincation;
  final VoidCallback onSignedIn;
  
   State<StatefulWidget> createState()
  {
    return _UserLoginAndRegisterState();
  }
  
}
enum FormType
{
  login,
  register
}

class _UserLoginAndRegisterState extends State<UserLoginAndRegisterPage>
{
  final formKey = new GlobalKey<FormState>(); //this key distinguishes forms
  FormType _formType = FormType.login;
  String _txtUserEmail = "";
  String _txtPassword = ""; 

  //METHODS
  bool textValidation()
  {
    final form = formKey.currentState;

    if(form.validate())
    {
      form.save();
      return true;
    }
    else
    {
      return false;
    }
  }

  void validateAndSubmit() async
  {
    if(textValidation())
    {
      try
      {
        if(_formType == FormType.login)
        {
          String userId = await widget.authincation.SignIn(_txtUserEmail, _txtPassword);
          print("Login User ID: " + userId);
        }else
        {
          String userId = await widget.authincation.SignUp(_txtUserEmail, _txtPassword);
          print("Register User ID: " + userId);
        }

        widget.onSignedIn();
      }catch(e)
      {
       // dialogBox.information(context, "Error", e.toString());
        print("Error: " + e.toString());
      }
    }
  }

  void changeStateToRegister()
  {
    formKey.currentState.reset();

    setState(() 
    {
      _formType = FormType.register;
    });
  }

  void changeStateToLogin()
  {
    formKey.currentState.reset();

    setState(() 
    {
      _formType = FormType.login;
    });
  }


  //USER INTERFACE DESIGN
  @override
  Widget build(BuildContext context) 
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("Susil's Travel Guide"),
      ),
      body: new Container
      (
        margin: EdgeInsets.all(17.0),

        child: new Form
        (
          key: formKey,
          child: new Column
          (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: userInputs() + Buttons(),
          ),
        ),
      ),
    );
  }

  List<Widget> userInputs()
  {
    return
    [
      SizedBox(height: 10.0,), //this will add spacing
      appLogo(),
      SizedBox(height: 20.0,),

      new TextFormField
      (
        decoration: new InputDecoration(labelText: 'User Email'),
        //if email is empty
        validator: (value)
        {
          return value.isEmpty ? 'Email is Required.' : null;
        },
        //if not empty then assigng the user input email to _email
        onSaved: (value)
        {
          return _txtUserEmail = value;
        },
      ),

      SizedBox(height: 10.0,),

      new TextFormField
      (
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true, 

         validator: (value)
        {
          return value.isEmpty ? 'Password is Required.' : null;
        },
        //if not empty then assigng the user input password to _password
        onSaved: (value)
        {
          return _txtPassword = value;
        },
      ),

      SizedBox(height: 30.0,),


    ];
  }
  Widget appLogo()
  {
    return new Hero
    (
      tag: 'hero',
      child: new CircleAvatar
      (
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/flag.png'),
      ),

    );
  }

  List<Widget> Buttons()
  {
    if(_formType == FormType.login)
    {
      return
        [
          new RaisedButton
          (
            child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,

            onPressed: validateAndSubmit,
          ),

          new RaisedButton
          (
            child: new Text("Register Here", style: new TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,

            onPressed: changeStateToRegister,
          )

          
        ];
    }else //button widget for registration activity
    {
      return
        [
          new RaisedButton
          (
            child: new Text("Register", style: new TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,

            onPressed: validateAndSubmit,
          ),

          new RaisedButton
          (
            child: new Text("Login Here", style: new TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.black,

            onPressed: changeStateToLogin,
          ),

          
        ];
    }
  }

}