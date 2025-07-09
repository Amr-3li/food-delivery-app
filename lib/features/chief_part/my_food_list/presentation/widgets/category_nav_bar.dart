import 'package:flutter/material.dart';

class CategoryNavBar extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onCategorySelected;

  const CategoryNavBar({
    super.key,
    this.initialIndex = 0,
    required this.onCategorySelected,
  });

  @override
  State<CategoryNavBar> createState() => _CategoryNavBarState();
}

class _CategoryNavBarState extends State<CategoryNavBar> {
  late int _selectedIndex;
  final List<String> _categories = ['All', 'Breakfast', 'Lunch', 'Dinner'];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  void didUpdateWidget(CategoryNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex) {
      setState(() {
        _selectedIndex = widget.initialIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onCategorySelected(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _selectedIndex == index
                        ? Colors.orange
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  fontWeight: _selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: _selectedIndex == index ? Colors.orange : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
