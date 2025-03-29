import 'package:flutter/material.dart';
import 'package:myeg_test/model/product_model.dart';
import 'package:myeg_test/provider/product_provider.dart';
import 'package:myeg_test/services/theme_service.dart';
import 'package:myeg_test/widgets/common_appbar.dart';
import 'package:myeg_test/widgets/common_product_card.dart';
import 'package:myeg_test/widgets/home_screen_widget/home_banner.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final isDark = themeService.isDarkMode(context);

    return Scaffold(
      // appBar: CommonAppBar(
      //   title: 'eCommerce',
      //   actions: [
      //     IconButton(
      //       icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      //       onPressed: () {
      //         themeService.toggleThemeMode();
      //       },
      //     )
      //   ],
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              homeBanner(context), // Scrollable banner
              FutureBuilder<List<ProductModel>>(
                future: Provider.of<ProductProvider>(context, listen: false).getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  }

                  List<ProductModel> products = snapshot.data!;

                  return GridView.builder(
                    shrinkWrap: true, // Makes it fit inside SingleChildScrollView
                    physics: const NeverScrollableScrollPhysics(), // Disables scrolling
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.67,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var item = products[index];
                      return CommonProductCard(
                        imagePath: item.image ?? '',
                        title: item.title ?? '',
                        rating: item.rating?.rate ?? 0.0, // Safely access rating
                        price: item.price ?? 0.0,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
