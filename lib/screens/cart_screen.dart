import 'package:flutter/material.dart';
import 'package:myeg_test/extensions/text_style_extension.dart';
import 'package:myeg_test/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:myeg_test/widgets/common_appbar.dart';
import 'package:myeg_test/model/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'My Cart'),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          List<ProductModel> cartItems = productProvider.getCartItems();

          return cartItems.isEmpty
              ? Center(child: Text("Your cart is empty"))
              : ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    return ListTile(
                      leading: Image.network(
                        product.image ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
                      ),
                      title: Text(
                        product.title ?? "No title",
                        style: context.titleS,
                      ),
                      subtitle: Text(
                        "\RM${product.price?.toStringAsFixed(2) ?? 0.0}",
                        style: context.bodyM,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          productProvider.removeFromCart(product.title ?? "");
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
