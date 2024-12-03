import 'package:couchsurfing/screens/profile_screen.dart';
import 'package:couchsurfing/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/dummy_data.dart';
import 'host_profile_screen.dart';
import 'hosts_lists_screen.dart';
import 'messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  List screens = [
    HomeScreenWidget(),
    SearchScreen(),
    MessagesScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: iconColor,
          selectedLabelStyle: bodyText10(),
          unselectedLabelStyle: bodyText10(),
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      body: screens[currentIndex],
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Couchsurfing')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Welcome to Couchsurfing',
            style: headerText20(),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Find a Host'),
          ),
          SizedBox(height: 20),
          Text('Featured Hosts', style: headerText20()),
          SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DummyData.featuredHosts.length,
              itemBuilder: (context, index) {
                final host = DummyData.featuredHosts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => HostProfileScreen(host: DummyData.featuredHosts[index],)));
                  },
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(host.photo, height: 100, fit: BoxFit.cover),
                        ),
                        SizedBox(height: 5),
                        Text(host.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(host.location),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

