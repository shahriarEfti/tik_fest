import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_fest/Data/models/ticket_card.dart';
import 'package:tik_fest/presentation/state_holder/slider_list_controler.dart';
import 'package:tik_fest/presentation/ui/widgets/home_banner_slider.dart';
import 'package:tik_fest/presentation/ui/widgets/trending_categories_section.dart';

import '../../state_holder/ticket_list_controler.dart';
import '../widgets/event_card.dart';
import '../widgets/festival_reminder.dart';
import '../widgets/large_headlines.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //Get.find<SliderListController>().getSliderList();
  }

  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
       appBar:  AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Image.asset(
              'assets/icons/app_logo.png',
              height: 25,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            const SizedBox(height: 8),
            //const HomeBannerSlider(),
            const SizedBox(height: 8),
            const FestivalReminder(),
            const SizedBox(height: 4),
            const LargeHeadlines(label: 'Check Out Trending Categories'),
            const SizedBox(height: 4),
            const TrendingCategoriesSection(),
            const SizedBox(height: 4),
            const LargeHeadlines(label: 'Upcoming Events'),
            const SizedBox(height: 10),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemCount: 5,
                reverse: true,

                itemBuilder: (_, __) {
                  return Eventcard();
                },separatorBuilder: (_, index) =>  SizedBox(width: 0),
              ),
            ),
          

          ]),
        ));
  }
}


