import 'package:flutter/material.dart';

class FilterSheet extends StatelessWidget { const FilterSheet({super.key});

@override Widget build(BuildContext context) { return Container( padding: const EdgeInsets.all(20), decoration: const BoxDecoration( color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24)), ), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ Row( children: [ const Spacer(), const Text( 'Filter your search', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), ), const Spacer(), GestureDetector( onTap: () => Navigator.pop(context), child: const Icon(Icons.close, color: Colors.black), ), ], ), const SizedBox(height: 24),

const _SectionTitle(title: 'OFFERS'),
      const SizedBox(height: 8),
      const Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _FilterChip(label: 'Delivery'),
          _FilterChip(label: 'Pick Up'),
          _FilterChip(label: 'Offer'),
          _FilterChip(label: 'Online payment available'),
        ],
      ),

      const SizedBox(height: 24),
      const _SectionTitle(title: 'DELIVER TIME'),
      const SizedBox(height: 8),
      const Row(
        children: [
          _TimeChip(label: '10-15 min', selected: true),
          SizedBox(width: 8),
          _TimeChip(label: '20 min'),
          SizedBox(width: 8),
          _TimeChip(label: '30 min'),
        ],
      ),

      const SizedBox(height: 24),
      const _SectionTitle(title: 'PRICING'),
      const SizedBox(height: 8),
      const Row(
        children: [
          _PriceChip(label: 'S'),
          SizedBox(width: 8),
          _PriceChip(label: '\$\$', selected: true),
          SizedBox(width: 8),
          _PriceChip(label: '\$\$\$'),
        ],
      ),

      const SizedBox(height: 24),
      const _SectionTitle(title: 'RATING'),
      const SizedBox(height: 8),
      Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.star,
              color: index == 3 ? Colors.orange : Colors.grey[400],
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
          onPressed: () {},
          child: const Text('FILTER', style: TextStyle(color: Colors.white)),
        ),
      )
    ],
  ),
);

} }

class _SectionTitle extends StatelessWidget { final String title; const _SectionTitle({required this.title});

@override Widget build(BuildContext context) { return Text( title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), ); } }

class _FilterChip extends StatelessWidget { final String label; const _FilterChip({required this.label});

@override Widget build(BuildContext context) { return Container( padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), decoration: BoxDecoration( border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(20), color: Colors.white, ), child: Text(label, style: const TextStyle(fontSize: 12)), ); } }

class _TimeChip extends StatelessWidget { final String label; final bool selected; const _TimeChip({required this.label, this.selected = false});

@override Widget build(BuildContext context) { return Container( padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color: selected ? Colors.orange : Colors.grey.shade200, ), child: Text( label, style: TextStyle( fontSize: 12, color: selected ? Colors.white : Colors.black, ), ), ); } }

class _PriceChip extends StatelessWidget { final String label; final bool selected; const _PriceChip({required this.label, this.selected = false});
@override Widget build(BuildContext context) { return Container( padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color: selected ? Colors.orange : Colors.grey.shade200, ), child: Text( label, style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold, color: selected ? Colors.white : Colors.black, ), ), ); } }