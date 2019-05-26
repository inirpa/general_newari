import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User profile'),
      ),
      body: (Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('images/profile_image.jpg'),
                    radius: 90.0,
                  ),
                  Text('Ram Lal Paswan'),
                  Icon(Icons.location_on),
                  Text("Kathmandu, Nepal")
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
