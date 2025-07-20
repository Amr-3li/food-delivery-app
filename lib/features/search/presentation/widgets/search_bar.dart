import 'package:flutter/material.dart';
import 'package:restaurant/features/search/data/search_cubit/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.onChanged, required this.cubit});
  final Function(String)? onChanged;
  final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        cursorColor: Colors.grey[300],
        onChanged: (value) {
          cubit.searchRequest(search: value);
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search ............",
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
          ),

        ),
      ),
    );
  }
}
