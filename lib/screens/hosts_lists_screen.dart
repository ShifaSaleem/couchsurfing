import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import 'host_profile_screen.dart';

class HostsListsScreen extends StatefulWidget {
  const HostsListsScreen({super.key});

  @override
  State<HostsListsScreen> createState() => _HostsListsScreenState();
}

class _HostsListsScreenState extends State<HostsListsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hosts')),
      body: ListView.builder(
        itemCount: DummyData.featuredHosts.length,
        itemBuilder: (context, index) {
          final host = DummyData.featuredHosts[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(host.photo)),
            title: Text(host.name),
            subtitle: Text('${host.location} | ${host.rating} ★'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => HostProfileScreen(host: DummyData.featuredHosts[index],)));
            },
          );
        },
      ),
    );
  }
}
