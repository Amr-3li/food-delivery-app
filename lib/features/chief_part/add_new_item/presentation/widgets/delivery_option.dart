import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/delivery_option_button.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/delivery_price_lable.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/widgets/item_price_text_field.dart';
import 'package:sizer/sizer.dart';

class DeliveryOptionsWidget extends StatefulWidget {
  final TextEditingController priceController;
  final ValueChanged<String> onOptionSelected;
  @override
  // ignore: overridden_fields
  final Key? key;

  const DeliveryOptionsWidget({
    this.key,
    required this.priceController,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  State<DeliveryOptionsWidget> createState() => _DeliveryOptionsWidgetState();
}

class _DeliveryOptionsWidgetState extends State<DeliveryOptionsWidget> {
  String _selectedOption = 'pickup';

  @override
  void initState() {
    super.initState();
    _selectedOption = 'pickup';
  }

  @override
  void didUpdateWidget(covariant DeliveryOptionsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.key != widget.key) {
      // Reset when key changes (which happens on reset)
      setState(() {
        _selectedOption = 'pickup';
        widget.priceController.text = '0';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PriceLabel(),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PriceTextField(controller: widget.priceController),
            DeliveryOptionButton(
              option: 'pickup',
              label: 'Pick up',
              isSelected: _selectedOption == 'pickup',
              onSelected: _handleOptionSelection,
            ),
            SizedBox(width: 4.w),
            DeliveryOptionButton(
              option: 'delivery',
              label: 'Delivery',
              isSelected: _selectedOption == 'delivery',
              onSelected: _handleOptionSelection,
            ),
          ],
        ),
      ],
    );
  }

  void _handleOptionSelection(String option) {
    setState(() => _selectedOption = option);
    widget.onOptionSelected(option);
  }
}
