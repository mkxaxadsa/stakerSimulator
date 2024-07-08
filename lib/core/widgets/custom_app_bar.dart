import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: CupertinoButton(
        onPressed: () {
          context.pop();
        },
        // padding: EdgeInsets.zero,
        child: const Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.pink,
            ),
            SizedBox(width: 5),
            Text(
              'Back',
              style: TextStyle(
                color: AppColors.pink,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
