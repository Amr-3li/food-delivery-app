import 'package:flutter/material.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_network_image.dart';
import 'package:sizer/sizer.dart';

class FoodItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final void Function()? onTap;
  final void Function()? onTapAdd;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    required this.onTap,
    required this.onTapAdd,
  });

  bool _isImageValid(String url) {
    return url.isNotEmpty && !url.contains('via.placeholder.com');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 14.h,
              width: 40.w,
              child: _isImageValid(image)
                  ? CustomNetworkImage(
                      height: 15.h,
                      width: 40.w,
                      imageUrl: image,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.fastfood,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    onPressed: onTapAdd,
                    icon: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
