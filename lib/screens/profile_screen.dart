import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final profile = DummyData.featuredHosts[0]; // Dummy profile
    final stays = DummyData.stays;
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profile.photo),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(profile.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Text('Past and Upcoming Stays', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: stays.length,
              itemBuilder: (context, index) {
                final stay = stays[index];
                return ListTile(
                  leading: Icon(stay.isUpcoming ? Icons.upcoming : Icons.history),
                  title: Text('${stay.hostName} (${stay.location})'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Destination: ${stay.destination.name}'),
                      Text('Date: ${stay.date.toLocal()}'.split(' ')[0]),
                    ],
                  ),
                  trailing: Image.network(
                    stay.destination.photo,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
