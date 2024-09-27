import 'package:flutter/material.dart';
import '../../../core/core.dart';
import 'notification_page.dart';
import 'package:Viva/screens/faceid_registrasi.dart';
import 'package:Viva/screens/profile.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
         automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          const Text(
            'Account',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(4.0),
          ListTile(
            onTap: () {
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Password'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Language'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          const SpaceHeight(40.0),
          const Text(
            'Preferences',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(4.0),
           ListTile(
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FaceIdRegistrationScreen()),
              );
            },
            title: const Text(
              'Face ID',
              style: TextStyle(
              color: AppColors.primary,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {
              context.push(const NotificationPage());
            },
            title: const Text('Notifications'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Attendance'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          const SpaceHeight(40.0),
          const Text(
            'Support',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(4.0),
          ListTile(
            onTap: () {},
            title: const Text('Terms of Service & Privacy'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
          ListTile(
            onTap: () {},
            title: const Text('Clear Cache'),
            trailing: const Icon(Icons.chevron_right),
          ),
          const Divider(
            color: AppColors.stroke,
            height: 2.0,
          ),
         
        ],
        
      ),
    );
    
  }
}
