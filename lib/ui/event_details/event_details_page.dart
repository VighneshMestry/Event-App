import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {

  final Event event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Provider<Event>.value(
      value: event,
      child: Scaffold(
         body: Stack(
          children: [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
         ),
      ),
    );
  }
}