import 'package:flutter/material.dart';

import 'package:flutter_course/services/auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({
    @required this.onSignIn,
    @required this.auth,
  });

  final Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      final user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie App',
          style: Theme.of(context)
              .textTheme
              .copyWith(
                  headline6: TextStyle(
                fontSize: 25,
              ))
              .headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.black,
                child: Text(
                  'Sign in Anonymously',
                  style: Theme.of(context)
                      .textTheme
                      .copyWith(
                        headline6: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                      .headline6,
                ),
                onPressed: _signInAnonymously,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
