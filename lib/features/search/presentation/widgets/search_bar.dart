import 'package:flutter/material.dart';
import 'package:restaurant/features/search/data/search_cubit/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.onChanged, required this.cubit});
final Function(String)? onChanged;
final SearchCubit cubit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
cubit.getResult(search: value);
      },
       textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Pizza",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.close),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
