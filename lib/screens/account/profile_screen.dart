import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String? name;
  final String? phoneNumber;

  const ProfileScreen({
    Key? key,
    required this.name,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: const [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_image.jpg'), 
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Name'),
            subtitle: Text(''),
          ),
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text('phoneNumber'),
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text('example@example.com'), 
          ),
          ListTile(
            title: Text('Date Created On'),
            subtitle: Text('January 1, 2022'), 
          ),
        ],
      ),
    );
  }
}
