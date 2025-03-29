import 'package:flutter/material.dart';
import 'package:myeg_test/extensions/text_style_extension.dart';

class CommonProductCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final double rating;
  final double price;
  final bool isFavorite;

  const CommonProductCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<CommonProductCard> createState() => _CommonProductCardState();
}

class _CommonProductCardState extends State<CommonProductCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image with favorite button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imagePath,
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
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                        size: 16,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
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
                widget.title,
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
                  '\RM${widget.price.toStringAsFixed(2)}',
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
                      widget.rating.toString(),
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
  }
}
