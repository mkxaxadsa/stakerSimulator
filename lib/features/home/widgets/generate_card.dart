import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../shop/bloc/shop_bloc.dart';
import 'generate_dialog.dart';

class GenerateCard extends StatelessWidget {
  const GenerateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xffBF00FF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 17),
          Row(
            children: [
              const Spacer(),
              Text(
                'New last\nevent for\ntoday',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: const Color(0xffD07397).withOpacity(0.5),
                      offset: const Offset(0, -8),
                      blurRadius: 15,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  SvgPicture.asset('assets/generate.svg'),
                  Image.asset(
                    'assets/generate.png',
                    height: 130,
                  ),
                ],
              ),
              const SizedBox(width: 8),
            ],
          ),
          const Spacer(),
          const _Button(),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 264,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(8),
      ),
      child: BlocListener<ShopBloc, ShopState>(
        listener: (context, state) {
          if (state is GeneratedEventState) {
            showDialog(
              context: context,
              builder: (context) {
                return GenerateDialog(stock: state.stock);
              },
            );
          }
        },
        child: CupertinoButton(
          onPressed: () {
            context.read<ShopBloc>().add(GenerateEvent());
          },
          padding: EdgeInsets.zero,
          child: const Center(
            child: Text(
              'Generate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
