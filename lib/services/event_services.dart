import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:local_event_app/constants/global_variables.dart';
import 'package:local_event_app/models/events.dart';
import 'package:local_event_app/widgets/snack_bar.dart';
import 'package:http/http.dart' as http;

class EventServices {
  void addEvent({
    required BuildContext context,
    required String title,
    required File backgroundImage,
    required String description,
    required String location,
    required String duration,
    required String punchLine1,
    required String punchLine2,
    required List<File> galleryImage,
    required String category,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('du4li5gol', 'ubxsaabn');
      List<String> imageUrls = [];
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(backgroundImage.path, folder: title));

      imageUrls.add(response.secureUrl);
      for (int i = 0; i < galleryImage.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(galleryImage[i].path, folder: title));

        imageUrls.add(res.secureUrl);
      }
      Event event = Event(
        title: title,
        backgroundImage: imageUrls[0],
        description: description,
        location: location,
        duration: duration,
        punchLine1: punchLine1,
        punchLine2: punchLine2,
        galleryImage: imageUrls,
        category: category,
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-event'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // 'x-auth-token': userProvider.user.token,
        },
        body: event.toJson(),
      );

      if (res.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Event added Successfully');
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Error');
      }
      print('Dart services function end');
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
