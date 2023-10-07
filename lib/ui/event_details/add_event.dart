import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:local_event_app/constants/custom_button.dart';
import 'package:local_event_app/constants/custom_textfield.dart';
import 'package:local_event_app/constants/global_variables.dart';
import 'package:local_event_app/constants/pick_images.dart';
import 'package:local_event_app/services/event_services.dart';

class AddEvent extends StatefulWidget {
  static const String routeName = '/add-event';
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  String category = 'Music';
  List<File> backgroundImage = [];
  List<File> images = [];

  final _addProductFormKey = GlobalKey<FormState>();
  final TextEditingController eventTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController punchLine1Controller = TextEditingController();
  final TextEditingController punchLine2Controller = TextEditingController();

  EventServices eventServices = EventServices();

  void addEvent() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      print('Dart ui function executed');
      print('eventTitleController.text');
      eventServices.addEvent(
        context: context,
        title: eventTitleController.text,
        backgroundImage: backgroundImage[0],
        description: descriptionController.text,
        location: locationController.text,
        duration: durationController.text,
        punchLine1: punchLine1Controller.text,
        punchLine2: punchLine2Controller.text,
        galleryImage: images,
        category: category,
      );
    }
  }

  selectBackgroundImages() async {
    var res = await pickImages();

    setState(() {
      backgroundImage = res;
    });
  }

  selectImages() async {
    var res = await pickImages();

    setState(() {
      images = res;
    });
  }

  List<String> eventCategories = [
    'Music',
    'Meetup',
    'Games',
    'Celebrations',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: GlobalVariables.primaryColor,
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 75),
              child: Text(
                'Add Event',
                style: TextStyle(color: Colors.black),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                backgroundImage.isNotEmpty
                    ? CarouselSlider(
                        items: backgroundImage.map(
                          (e) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                e,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectBackgroundImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open_outlined,
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Select Background Image',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                    controller: eventTitleController, hintText: 'Event title'),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (e) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                e,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open_outlined,
                                  size: 40,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Select Event Images',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: locationController, hintText: 'Location'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: durationController, hintText: 'Duration'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: punchLine1Controller, hintText: 'Event Aim'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: punchLine2Controller, hintText: 'Punch Line'),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: eventCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                CustomButton(text: 'Add Event', onTap: addEvent)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
