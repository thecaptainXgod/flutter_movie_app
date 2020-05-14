import 'package:flutter/material.dart';
import 'package:flutter_course/screens/search_page.dart';
import 'package:flutter_course/screens/sign_in_page.dart';
import 'package:flutter_course/services/auth.dart';

class LandingPage extends StatefulWidget {

  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  Future<void> _checkCurrentUser() async {
    final user = await widget.auth.currentUser();
    _updateUser(user);
  }

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user == null
        ? SignInPage(
            onSignIn: _updateUser,
            auth: widget.auth,
          )
        : SearchPage(
            onSignOut: () => _updateUser(null),
            auth: widget.auth,
          );
  }
}
