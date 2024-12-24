import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holder/slider_list_controler.dart';

import 'centered_circular_progress_indicator.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        visible: !sliderListController.inProgress,
        replacement: const SizedBox(
          height: 192,
          child: CenteredCircularProgressIndicator(),
        ),
        child: Column(
          children: [
            _buildCarouselSlider(sliderListController),
            const SizedBox(
              height: 8,
            ),
            _buildCarouselDots(sliderListController),
          ],
        ),
      );
    });
  }

  Widget _buildCarouselSlider(SliderListController sliderListController) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 180,
          viewportFraction: 1,
          autoPlay: true,
          onPageChanged: (index, reason) {
            _selectedIndex.value = index;
          }),
      items: sliderListController.sliders.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return CachedNetworkImage(
              imageUrl: slider.image.toString(),
              errorWidget: (context,stringValue,_){
                return const Icon(Icons.error);
              },
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          slider.price ?? '',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(

                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.redAccent,
                            ),
                            child: const Text(
                              'Buy Now',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCarouselDots(SliderListController sliderListController) {
    return ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, currentIndex, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < sliderListController.sliders.length; i++)
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.redAccent),
                      color: currentIndex == i ? Colors.redAccent : null),
                )
            ],
          );
        });
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}