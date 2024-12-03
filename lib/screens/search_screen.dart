import 'package:couchsurfing/app_theme.dart';
import 'package:couchsurfing/screens/host_profile_screen.dart';
import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../models/dummy_data.dart';
import '../models/host.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  String selectedFilter = 'All';
  List<String> filters = ['All', 'Hosts', 'Destinations'];
  @override
  Widget build(BuildContext context) {
    List<Destination> filteredDestinations = DummyData.destinations
        .where((dest) =>
            dest.name.toLowerCase().contains(searchQuery.toLowerCase()) &&
            (selectedFilter == 'All' || selectedFilter == 'Destinations'))
        .toList();

    List<Host> filteredHosts = DummyData.featuredHosts
        .where((host) =>
            host.name.toLowerCase().contains(searchQuery.toLowerCase()) &&
            (selectedFilter == 'All' || selectedFilter == 'Hosts'))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for hosts or destinations...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Filter Tabs
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: filters.map((filter) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: selectedFilter == filter
                            ? primaryColor
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: selectedFilter == filter
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),

            // Horizontal List for Destinations
            if (selectedFilter == 'All' || selectedFilter == 'Destinations')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Destinations',
                    style: headerText18(),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredDestinations.length,
                      itemBuilder: (context, index) {
                        final destination = filteredDestinations[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to a Destination Detail Page
                          },
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(destination.photo),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              child: Text(
                                destination.name,
                                style: headerText16(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            SizedBox(height: 16),

            // Vertical List for Hosts
            if (selectedFilter == 'All' || selectedFilter == 'Hosts')
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hosts',
                      style: headerText18(),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredHosts.length,
                        itemBuilder: (context, index) {
                          final host = filteredHosts[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to Host Profile Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HostProfileScreen(host: host),
                                ),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(host.photo),
                                ),
                                title: Text(host.name),
                                subtitle: Text(
                                  '${host.location} • ${host.rating} ★',
                                ),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
