import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_stake/features/home/widgets/my_stock_card.dart';

import '../../../core/config/app_colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Container(
          height: 1,
          width: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 60),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Settings(
                    config:
                        'https://docs.google.com/document/d/1Y-mluvnfiEGXn7m6vmmuOC0DkjmjrtFoxMpMRavTR7s/edit?usp=sharing'),
              ),
            );
          },
          child: const _SettingsButton(title: 'Privacy policy'),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Settings(
                    config:
                        'https://docs.google.com/document/d/1z1C_9frF5-_3cnIniDjR7nJOOZV1LCC2qhIYrgq7YZY/edit?usp=sharing'),
              ),
            );
          },
          child: const _SettingsButton(title: 'Terms of use'),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Settings(
                    config: 'https://forms.gle/xyLcRCV9VyCYPPnf9'),
              ),
            );
          },
          child: const _SettingsButton(title: 'Support page'),
        ),
      ],
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: AppColors.pink30,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
