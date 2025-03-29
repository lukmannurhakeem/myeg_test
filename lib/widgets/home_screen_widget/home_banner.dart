import 'package:flutter/material.dart';
import 'package:myeg_test/extensions/text_style_extension.dart';
import 'package:myeg_test/theme/color_theme.dart';

Widget homeBanner(BuildContext context) {
  // Page controller for the banner slider
  final PageController _pageController = PageController();

  // List of banner data - you can add more banners here
  final List<Map<String, dynamic>> banners = [
    {
      'title': 'New Collection',
      'subtitle': 'Discount 50% for\nthe first transaction',
      'image': 'assets/images/banner1.png',
      'color': AppColorTheme.primaryLight,
    },
    {
      'title': 'Summer Sale',
      'subtitle': 'Up to 70% off on\nsummer essentials',
      'image': 'assets/images/banner.png', // Replace with your second image
      'color': AppColorTheme.secondaryLight, // Optional: different color for second banner
    },
  ];

  return Container(
    height: MediaQuery.sizeOf(context).height / 5,
    child: Stack(
      children: [
        // Banner PageView
        PageView.builder(
          controller: _pageController,
          itemCount: banners.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: banners[index]['color'],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banners[index]['title'],
                            style: context.titleM,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            banners[index]['subtitle'],
                            style: context.bodyM,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      banners[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // Pagination indicators
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  // Calculate current page for indicator
                  double? currentPage = 0;
                  try {
                    currentPage = _pageController.page;
                  } catch (_) {
                    currentPage = 0;
                  }

                  bool isCurrentPage = index == currentPage?.round();

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: isCurrentPage ? 24 : 8,
                    decoration: BoxDecoration(
                      color: isCurrentPage ? Colors.white : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
