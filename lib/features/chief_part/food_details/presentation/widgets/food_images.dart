import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_type.dart';

class FoodImages extends StatefulWidget {
  const FoodImages({super.key});

  @override
  State<FoodImages> createState() => _FoodImagesState();
}

class _FoodImagesState extends State<FoodImages> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> foodImages = [
    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
    'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500',
    'https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=500',
    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: foodImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    foodImages[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.error),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: FoodType(
            currentPage: _currentPage,
            totalImages: foodImages.length,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
