import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_fest/Data/models/ticket_card.dart';
import 'package:tik_fest/presentation/state_holder/slider_list_controler.dart';
import 'package:tik_fest/presentation/ui/widgets/home_banner_slider.dart';
import 'package:tik_fest/presentation/ui/widgets/trending_categories_section.dart';

import '../../state_holder/ticket_list_controler.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_search_delegate.dart';
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
    Get.find<SliderListController>().getSliderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
               const HomeBannerSlider(),
              const SizedBox(height: 5),
              const FestivalReminder(),
              const SizedBox(height: 12),
              const LargeHeadlines(label: 'Check Out Trending Categories'),
              const SizedBox(height: 8),
              const TrendingCategoriesSection(),
              const SizedBox(height: 12),
              const LargeHeadlines(label: 'Upcoming Events'),
              const SizedBox(height: 10),
              Divider(color: Colors.grey.shade400),
              const SizedBox(height: 16),
              SizedBox(
                height: 410, // Set height for the ListView
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  reverse: true,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Eventcard(),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
