import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../../core/widgets/custom_scaffold.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final controller = PageController();

  int pageIndex = 0;

  void onPressed() async {
    if (pageIndex == 1) {
      await saveData().then((value) {
        context.go('/home');
      });
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        pageIndex = controller.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: PageView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        children: [
          // page 1
          Column(
            children: [
              SizedBox(
                width: 400,
                child: Image.asset('assets/onboard1.png'),
              ),
              const Spacer(flex: 2),
              const Column(
                children: [
                  _TitleText('Stake App welcomes you!'),
                  SizedBox(height: 7),
                  _SubtitleText(
                      'Learn how to sell and buy\ndifferent stocks, without\ninvesting'),
                ],
              ),
              const Spacer(),
              _Button(
                title: 'Next',
                onPressed: onPressed,
              ),
              const SizedBox(height: 112),
            ],
          ),

          // page 2
          Column(
            children: [
              SizedBox(
                width: 400,
                child: Image.asset('assets/onboard2.png'),
              ),
              const Spacer(flex: 2),
              const Column(
                children: [
                  _TitleText('Take action.'),
                  SizedBox(height: 7),
                  _SubtitleText(
                      'Buy first shares, activate\nnew events, improve every day'),
                ],
              ),
              const Spacer(),
              _Button(
                title: 'Go',
                onPressed: onPressed,
              ),
              const SizedBox(height: 112),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xffF4E5FF),
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xffFFFFFF).withOpacity(0.5),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
    );
  }
}
