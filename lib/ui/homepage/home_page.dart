import 'package:flutter/material.dart';
import 'package:local_event_app/app_state.dart';
import 'package:local_event_app/constants/global_variables.dart';
import 'package:local_event_app/styleguide.dart';
import 'package:local_event_app/ui/event_details/add_event.dart';
import 'package:local_event_app/ui/event_details/event_details_page.dart';
import 'package:provider/provider.dart';

import '../../category/category.dart';
import '../../category/event.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

// use FittedBox for text overflow
class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AppState(),
        child: Stack(
          children: [
            HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32), // Another way to give a padding
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("LOCAL EVENTS", style: fadedTextStyle),
                          const Spacer(),
                          const Icon(
                            Icons.person_outline,
                            size: 30,
                            color: Color(0x99FFFFFF),
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.person_outline,
                          //       color: Color(0x99FFFFFF),
                          //       size: 30,
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          "What's Up!",
                          style: whiteHeadingTextStyle,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      // The changes given by the notifyListners is consumed by this Consumer and builds the whole row of category widgets and then updates the categories
                      // Then category_widget.dart is rebuilt so it again checks the isSelected again and functions further
                      child: Consumer<AppState>(
                        builder: (context, value, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final category in categories)
                                CategoryWidget(category: category),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: [
                            for (final event in events.where(
                              (e) => e.categoryIds
                                  .contains(appState.selectedCategoryId),
                            ))
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          EventDetailsPage(event: event)));
                                },
                                child: EventWidget(event: event),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'HEre',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 80,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AddEvent.routeName);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalVariables.primaryColor),
                  // color: Colors.amber,
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
