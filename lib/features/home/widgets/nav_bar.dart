import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/home_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 63 + MediaQuery.of(context).viewPadding.bottom,
        color: AppColors.navBar,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavBarButton(
                  asset: 'home',
                  active: state is HomeInitial,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 0));
                  },
                ),
                _NavBarButton(
                  asset: 'shop',
                  active: state is HomeShop,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 1));
                  },
                ),
                _NavBarButton(
                  asset: 'news',
                  active: state is HomeNews,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 2));
                  },
                ),
                _NavBarButton(
                  asset: 'settings',
                  active: state is HomeSettings,
                  onPressed: () {
                    context.read<HomeBloc>().add(ChangePageEvent(index: 3));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.asset,
    required this.active,
    required this.onPressed,
  });

  final String asset;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: active ? const Color(0xff721a8f) : null,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (active)
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.25),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (asset == 'news')
              Icon(
                Icons.newspaper_outlined,
                color: active
                    ? AppColors.pink
                    : const Color(0xffffffff).withOpacity(0.7),
              )
            else if (asset == 'home')
              Icon(
                Icons.home_outlined,
                color: active
                    ? AppColors.pink
                    : const Color(0xffffffff).withOpacity(0.7),
              )
            else if (asset == 'shop')
              Icon(
                Icons.currency_bitcoin_outlined,
                color: active
                    ? AppColors.pink
                    : const Color(0xffffffff).withOpacity(0.7),
              )
            else
              Icon(
                Icons.settings,
                color: active
                    ? AppColors.pink
                    : const Color(0xffffffff).withOpacity(0.7),
              )
          ],
        ),
      ),
    );
  }
}
