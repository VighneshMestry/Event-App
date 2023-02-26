import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_event_app/app_state.dart';
import 'package:local_event_app/styleguide.dart';
import 'package:provider/provider.dart';

import '../../category/category.dart';
import '../../category/event.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    Consumer<AppState>(
                      builder: (context, appState, _) =>
                      Column(
                        children: [
                          for(final event in events.where((e) => e.categoryIds.contains(appState.selectedCategoryId))) EventWidget(event: event)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
