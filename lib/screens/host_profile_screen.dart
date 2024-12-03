import 'package:couchsurfing/app_theme.dart';
import 'package:flutter/material.dart';

import '../models/host.dart';

class HostProfileScreen extends StatefulWidget {
  final Host host;
   const HostProfileScreen({super.key, required this.host});

  @override
  State<HostProfileScreen> createState() => _HostProfileScreenState();
}

class _HostProfileScreenState extends State<HostProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.host.name}\'s Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.host.photo),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                widget.host.name,
                style: headerText24(),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Rating: ${widget.host.rating.toString()} ★',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'About ${widget.host.name}',
              style: headerText18(),
            ),
            SizedBox(height: 8),
            Text(
              widget.host.bio ?? 'This host has not added a bio yet.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Available Dates for Hosting',
              style: headerText18(),
            ),
            SizedBox(height: 8),
            widget.host.availableDates.isNotEmpty
                ? Wrap(
              spacing: 8,
              children: widget.host.availableDates
                  .map(
                    (date) => Chip(
                  label: Text(
                    date.toLocal().toString().split(' ')[0],
                  ),
                ),
              )
                  .toList(),
            )
                : Text(
              'No dates available for hosting at the moment.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle "Request to Stay" action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Request sent to ${widget.host.name}')),
                  );
                },
                child: Text('Request to Stay'),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Reviews and Ratings',
              style: headerText18(),
            ),
            SizedBox(height: 8),
            ...widget.host.reviews.map(
                  (review) => ListTile(
                leading: CircleAvatar(
                  child: Text(review.reviewerName[0]),
                ),
                title: Text(review.reviewerName),
                subtitle: Text(review.comment),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
