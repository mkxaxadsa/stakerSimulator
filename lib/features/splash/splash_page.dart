import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void init() async {
    await getData().then(
      (value) async {
        await Future.delayed(
          const Duration(milliseconds: 1500),
          () {
            if (onboarding) {
              context.go('/onboard');
            } else {
              context.go('/home');
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
