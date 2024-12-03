import 'host.dart';
import 'destination.dart';
import 'stay.dart';
import 'message.dart';

class DummyData {
  static List<Destination> destinations = [
    Destination(
      name: 'Santorini, Greece',
      description: 'Beautiful islands with whitewashed houses.',
      location: 'Santorini, Greece',
      photo: 'https://via.placeholder.com/150',
    ),
    Destination(
      name: 'Kyoto, Japan',
      description: 'Historic temples and traditional tea houses.',
      location: 'Kyoto, Japan',
      photo: 'https://via.placeholder.com/150',
    ),
    Destination(
      name: 'Cappadocia, Turkey',
      description: 'Famous for hot air balloons and unique landscapes.',
      location: 'Cappadocia, Turkey',
      photo: 'https://via.placeholder.com/150',
    ),
    Destination(
      name: 'Reykjavik, Iceland',
      description: 'Experience the northern lights and natural hot springs.',
      location: 'Reykjavik, Iceland',
      photo: 'https://via.placeholder.com/150',
    ),
    Destination(
      name: 'Maui, Hawaii',
      description: 'Pristine beaches and lush tropical scenery.',
      location: 'Maui, Hawaii',
      photo: 'https://via.placeholder.com/150',
    ),
  ];

  static List<Stay> stays = [
    Stay(
      hostName: 'Alice',
      location: 'NY, USA',
      date: DateTime(2024, 12, 25),
      isUpcoming: true,
      destination: destinations[0],
    ),
    Stay(
      hostName: 'Bob',
      location: 'Paris, France',
      date: DateTime(2024, 11, 20),
      isUpcoming: false,
      destination: destinations[1],
    ),
    Stay(
      hostName: 'Charlie',
      location: 'Istanbul, Turkey',
      date: DateTime(2024, 10, 10),
      isUpcoming: false,
      destination: destinations[2],
    ),
    Stay(
      hostName: 'Diana',
      location: 'Reykjavik, Iceland',
      date: DateTime(2025, 1, 15),
      isUpcoming: true,
      destination: destinations[3],
    ),
    Stay(
      hostName: 'Eve',
      location: 'Honolulu, Hawaii',
      date: DateTime(2024, 9, 5),
      isUpcoming: false,
      destination: destinations[4],
    ),
  ];

  static List<Host> featuredHosts = [
    Host(
      name: 'Alice',
      location: 'NY, USA',
      photo: 'https://via.placeholder.com/150',
      rating: 4.5,
      bio: 'Loves hosting travelers and exploring new cultures.',
      availableDates: [DateTime(2024, 12, 1), DateTime(2024, 12, 5)],
      reviews: [
        Review(reviewerName: 'John', comment: 'Wonderful host! Highly recommended.'),
        Review(reviewerName: 'Sara', comment: 'Very welcoming and friendly.'),
      ],
    ),
    Host(
      name: 'Bob',
      location: 'Paris, France',
      photo: 'https://via.placeholder.com/150',
      rating: 4.2,
      bio: 'Enjoys cooking and sharing stories with guests.',
      availableDates: [DateTime(2024, 11, 15)],
      reviews: [
        Review(reviewerName: 'Emma', comment: 'Great experience, very kind host.'),
      ],
    ),
    Host(
      name: 'Lisa',
      location: 'NY, USA',
      photo: 'https://via.placeholder.com/150',
      rating: 4.5,
      bio: 'Loves hosting travelers and exploring new cultures.',
      availableDates: [DateTime(2024, 12, 1), DateTime(2024, 12, 5)],
      reviews: [
        Review(reviewerName: 'John', comment: 'Wonderful host! Highly recommended.'),
        Review(reviewerName: 'Sara', comment: 'Very welcoming and friendly.'),
      ],
    ),
    Host(
      name: 'Adrian',
      location: 'Tokyo, Japan',
      photo: 'https://via.placeholder.com/150',
      rating: 4.5,
      bio: 'Loves hosting travelers and exploring new cultures.',
      availableDates: [DateTime(2024, 12, 1), DateTime(2024, 12, 5)],
      reviews: [
        Review(reviewerName: 'John', comment: 'Wonderful host! Highly recommended.'),
        Review(reviewerName: 'Sara', comment: 'Very welcoming and friendly.'),
      ],
    ),
  ];

  static List<Message> messages = [
    Message(name: 'Alice', photo: 'https://via.placeholder.com/150', lastMessage: 'Hi! How are you?', chatId: 'chat1'),
    Message(name: 'Bob', photo: 'https://via.placeholder.com/150', lastMessage: 'See you soon!', chatId: 'chat2'),
    Message(name: 'Charlie', photo: 'https://via.placeholder.com/150', lastMessage: 'Thanks for hosting!', chatId: 'chat3'),
    Message(name: 'Diana', photo: 'https://via.placeholder.com/150', lastMessage: 'Let me know your schedule!', chatId: 'chat4'),
    Message(name: 'Eve', photo: 'https://via.placeholder.com/150', lastMessage: 'Looking forward to meeting you!', chatId: 'chat5'),
  ];
}
