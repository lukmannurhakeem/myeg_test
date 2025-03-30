import 'package:flutter/material.dart';
import 'package:myeg_test/extensions/text_style_extension.dart';
import 'package:myeg_test/model/product_model.dart';
import 'package:myeg_test/widgets/common_appbar.dart';

class CardDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const CardDetailScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Column(
        children: [
          // Zoomable image container
          Expanded(
            child: InteractiveViewer(
              boundaryMargin: EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: Hero(
                  tag: 'product-${productModel.id ?? ""}',
                  child: Image.network(
                    productModel.image ?? '',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey[500],
                          ),
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Product details
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title ?? 'No Title',
                  style: context.titleL,
                ),
                SizedBox(height: 8),
                Text(
                  'Price: RM${productModel.price?.toStringAsFixed(2) ?? '0.00'}',
                  style: context.titleM,
                ),
                SizedBox(height: 8),
                Text(
                  productModel.description ?? 'No description available',
                  style: context.bodyM,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
