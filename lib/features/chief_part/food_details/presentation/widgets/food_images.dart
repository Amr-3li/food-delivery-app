import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_type.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';

class FoodImages extends StatefulWidget {
  final Meal meal;

  const FoodImages({super.key, required this.meal});

  @override
  State<FoodImages> createState() => _FoodImagesState();
}

class _FoodImagesState extends State<FoodImages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.meal.category.image.isNotEmpty
                      ? Image.network(
                          widget.meal.category.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildFallbackImage();
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        )
                      : _buildFallbackImage(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: FoodType(currentPage: _currentPage, totalImages: 1),
        ),
      ],
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      color: Colors.grey[300],
      child: const Icon(Icons.fastfood, size: 40),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
