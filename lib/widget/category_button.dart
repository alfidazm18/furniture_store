import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed; // Tambahkan parameter onPressed

  const CategoryButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed, // Tambahkan onPressed ke konstruktor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed, // Gunakan onPressed di sini
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.black;
              }
              return isSelected ? Colors.black : Colors.grey[300]!;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white;
              }
              return isSelected ? Colors.white : Colors.black;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}