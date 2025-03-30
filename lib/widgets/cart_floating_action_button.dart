import 'package:flutter/material.dart';
import 'package:myeg_test/provider/product_provider.dart';
import 'package:myeg_test/routes/route.dart';
import 'package:myeg_test/services/navigation_service.dart';
import 'package:myeg_test/theme/color_theme.dart';
import 'package:provider/provider.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        int cartCount = productProvider.getCartTotal();

        return Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                NavigationService().navigateTo(
                  AppRoutes.cart,
                );
              },
              backgroundColor: AppColorTheme.primaryLight,
              child: Icon(Icons.shopping_cart),
            ),
            if (cartCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '$cartCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
