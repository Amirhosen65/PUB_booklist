import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pub_booklist/Auth/LogInPage.dart';
import 'package:pub_booklist/Auth/signup.dart';


class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.deepOrange.shade500,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.purple.shade900,
                  Colors.purple.shade800,
                  Colors.purple.shade400
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 40,color: Colors.white,)),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Reset Password", style: TextStyle(color: Colors.white, fontSize: 35),),
                  SizedBox(height: 10,),
                  Text("Reset link will be sent to your email id !", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Email: ',
                              labelStyle: TextStyle(fontSize: 20.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2)
                              ),
                              errorStyle:
                                  TextStyle(color: Colors.red, fontSize: 15),
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, otherwise false.
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                  });
                                  resetPassword();
                                  isLoading = true;
                                  Future.delayed(Duration(seconds: 3), (){
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                }
                              },
                              child: isLoading? CircularProgressIndicator(color: Colors.white):
                              Text(
                                'Send Email',
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            TextButton(
                                onPressed: () => {
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                          Login(),
                                      transitionDuration: Duration(seconds: 0),
                                    ),
                                  )
                                },
                                child: Text('Login',
                                  style: TextStyle(fontSize: 20.0),))
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
