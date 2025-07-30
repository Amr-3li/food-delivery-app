import 'package:flutter/material.dart';
import 'package:restaurant/features/search/presentation/manger/search/search_cubit.dart';

class CustomKeywordChip extends StatefulWidget {
  const CustomKeywordChip({super.key});

  @override
  State<CustomKeywordChip> createState() => _CustomKeywordChipState();
}

class _CustomKeywordChipState extends State<CustomKeywordChip> {
  final List<String> keywords = ['Pizza', 'Burger', 'Pasta', 'Sushi', 'falafel', 'koshary'];
  String? selectedKeyword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: keywords.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final keyword = keywords[index];
          final isSelected = keyword == selectedKeyword;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedKeyword = keyword;
              });
              SearchCubit.get(context).searchRequest(search: selectedKeyword ?? '');
            },
            child: Chip(
              label: Text(
                keyword,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? Colors.orange : Colors.grey.withAlpha(100),
                ),
              ),
              backgroundColor: isSelected ? Colors.orange : Colors.white,
            ),
          );
        },
      ),
    );
  }
}
