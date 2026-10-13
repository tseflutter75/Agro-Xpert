import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final int productId;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  const ProductCard({
    super.key,
    required this.productId,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // late FavoritesController _favoritesController;

  @override
  void initState() {
    super.initState();
    // _favoritesController = Get.put(FavoritesController());
  }

  // Future<void> _handleFavoriteTap() async {
  //   await _favoritesController.toggleFavorite(widget.productId);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),

              // image
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.image_not_supported));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),

                // price
                Text(
                  '\$${widget.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    // rating
                    Text(
                      widget.rate.toStringAsFixed(1),

                      style: const TextStyle(fontSize: 12),
                    ),
                    Spacer(),

                    // InkWell(
                    //   onTap: _handleFavoriteTap,
                    //   child: Obx(() {
                    //     final isFavorite = _favoritesController.isFavorite(
                    //       widget.productId,
                    //     );
                    //     return Icon(
                    //       Icons.favorite,
                    //       size: 14,
                    //       color: isFavorite ? Colors.red : Colors.grey.shade400,
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
