import 'package:flutter/material.dart';
import 'package:myeg_test/extensions/text_style_extension.dart';
import 'package:myeg_test/model/product_model.dart';
import 'package:myeg_test/provider/product_provider.dart';
import 'package:myeg_test/theme/color_theme.dart';
import 'package:myeg_test/widgets/common_snackbar.dart';
import 'package:provider/provider.dart';

class CommonProductCard extends StatefulWidget {
  final ProductModel model;
  final bool isFavorite;

  const CommonProductCard({
    super.key,
    required this.model,
    this.isFavorite = false,
  });

  @override
  State<CommonProductCard> createState() => _CommonProductCardState();
}

class _CommonProductCardState extends State<CommonProductCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        // Check if the product is in the cart
        final isInCart = productProvider.addToCartList.any((item) => item.id == widget.model.id);

        return Card(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.model.image ?? "",
                        height: 180,
                        width: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            isInCart ? Icons.shopping_cart : Icons.shopping_cart_rounded,
                            color: isInCart ? Colors.red : Colors.grey,
                            size: 16,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            if (isInCart) {
                              // Remove from cart
                              final success = await productProvider.removeFromCart(widget.model.title ?? "");
                              if (success) {
                                // Save to storage after removing
                                await productProvider.saveCartToStorage();
                                CommonSnackbar.showSuccess(context, 'Item removed from cart');
                              }
                            } else {
                              // Add to cart
                              final success = await productProvider.addToCart(context, widget.model);
                              if (success) {
                                // Save to storage after adding
                                await productProvider.saveCartToStorage();
                                CommonSnackbar.showSuccess(context, 'Item added to cart');
                              } else {
                                CommonSnackbar.showError(context, 'Item is already in cart');
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Product title and rating
                Expanded(
                  child: Text(
                    widget.model.title ?? 'No title',
                    style: context.titleS,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                // Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\RM${widget.model.price?.toStringAsFixed(2) ?? 0.0}',
                      style: context.titleS,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.model.rating?.rate ?? 0}',
                          style: context.bodyM,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
