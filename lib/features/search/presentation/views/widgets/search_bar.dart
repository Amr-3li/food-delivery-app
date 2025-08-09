import 'dart:async';
import 'package:flutter/material.dart';
import '../../manger/search/search_cubit.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      SearchCubit.get(context).searchRequest(search: value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      cursorColor: Colors.grey[300],
      onChanged: _onSearchChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Search ............",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(onPressed: () {
          _debounce?.cancel();
          searchController.clear();
          FocusScope.of(context).unfocus();
          SearchCubit.get(context).getPopularFood();
          SearchCubit.get(context).getSuggestedRestaurants();
        }, icon: const Icon(Icons.cancel, color: Colors.grey)),
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
    );
  }
}
