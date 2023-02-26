import 'package:flutter/material.dart';
import 'package:local_event_app/category/event.dart';
import 'package:provider/provider.dart';

import 'event_details_background.dart';
import 'event_details_content.dart';

class EventDetailsPage extends StatelessWidget {
  final Event1 event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Provider<Event1>.value(
      value: event,
      child: Scaffold(
        body: Stack(
          children: const [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
