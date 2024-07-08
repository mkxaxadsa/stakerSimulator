import 'package:flutter/material.dart';

class YourStockCard extends StatelessWidget {
  const YourStockCard({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 42,
          width: 120,
          decoration: BoxDecoration(
            color: const Color(0xff7F04A8).withOpacity(0.5),
            borderRadius: BorderRadius.circular(32),
            border: active
                ? Border.all(
                    width: 2,
                    color: const Color(0xffD66B95),
                  )
                : null,
          ),
          child: const Center(
            child: Text(
              'Your Stocks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
