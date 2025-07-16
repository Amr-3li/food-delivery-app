import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  String selectedDelivery = 'Delivery';
  String selectedTime = '10-15 min';
  String selectedPrice = '\$\$';
  int selectedRating = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              const Text(
                'Filter your search',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const _SectionTitle(title: 'OFFERS'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                ['Delivery', 'Pick Up', 'Offer', 'Online payment available']
                    .map(
                      (label) => _FilterChip(
                        label: label,
                        selected: selectedDelivery == label,
                        onTap: () {
                          setState(() {
                            selectedDelivery = label;
                          });
                        },
                      ),
                    )
                    .toList(),
          ),

          const SizedBox(height: 24),
          const _SectionTitle(title: 'DELIVER TIME'),
          const SizedBox(height: 8),
          Row(
            children: ['10-15 min', '20 min', '30 min']
                .map(
                  (label) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _TimeChip(
                      label: label,
                      selected: selectedTime == label,
                      onTap: () {
                        setState(() {
                          selectedTime = label;
                        });
                      },
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 24),
          const _SectionTitle(title: 'PRICING'),
          const SizedBox(height: 8),
          Row(
            children: ['S', '\$\$', '\$\$\$']
                .map(
                  (label) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _PriceChip(
                      label: label,
                      selected: selectedPrice == label,
                      onTap: () {
                        setState(() {
                          selectedPrice = label;
                        });
                      },
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 24),
          const _SectionTitle(title: 'RATING'),
          const SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRating = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.star,
                    color: index == selectedRating
                        ? Colors.orange
                        : Colors.grey[400],
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Example: Print selected filters
                debugPrint("Delivery: $selectedDelivery");
                debugPrint("Time: $selectedTime");
                debugPrint("Price: $selectedPrice");
                debugPrint("Rating: ${selectedRating + 1} stars");
                Navigator.pop(context); // Close sheet
              },
              child: const Text(
                'FILTER',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.orange : Colors.white,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TimeChip({
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.orange : Colors.grey.shade200,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class _PriceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PriceChip({
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.orange : Colors.grey.shade200,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
