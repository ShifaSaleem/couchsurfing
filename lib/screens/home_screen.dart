import 'package:couchsurfing/components/button.dart';
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
      appBar: AppBar(
        title: Text('Couchsurfing'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Text(
                'Welcome to Couchsurfing!',
                style: headerText24(),
              ),
              SizedBox(height: 8),
              Text(
                'Find a host or explore amazing destinations.',
                style: bodyText14(),
              ),
              SizedBox(height: 16),
              DefaultButton(
                  labelText: 'Find a Host',
                  textStyle: headerText16().copyWith(color: Colors.white),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HostsListsScreen(),));
                  },
                  backgroundColor: primaryColor,
              ),
              SizedBox(height: 24),

              // Featured Hosts Section
              Text(
                'Featured Hosts',
                style: headerText20(),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: DummyData.featuredHosts.length,
                  itemBuilder: (context, index) {
                    final host = DummyData.featuredHosts[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to Host Profile Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HostProfileScreen(host: host),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        margin: EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(host.photo),
                            ),
                            SizedBox(height: 8),
                            Text(
                              host.name,
                              style: headerText14(),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4),
                            Text(
                              host.location,
                              style: bodyText12(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),

              // Featured Destinations Section
              Text(
                'Featured Destinations',
                style: headerText20(),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: DummyData.destinations.length,
                itemBuilder: (context, index) {
                  final destination = DummyData.destinations[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to Destination Details Page
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(8),
                            ),
                            child: Image.network(
                              destination.photo,
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded( // Ensures the text fits dynamically
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination.name,
                                  style: headerText16(),
                                  overflow: TextOverflow.ellipsis, // Prevents overflow by truncating text
                                ),
                                SizedBox(height: 4),
                                Text(
                                  destination.location,
                                  style: bodyText14(),
                                  overflow: TextOverflow.ellipsis, // Prevents overflow by truncating text
                                ),
                                SizedBox(height: 4),
                                Text(
                                  destination.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis, // Truncates overflowing text
                                  style: bodyText12(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

