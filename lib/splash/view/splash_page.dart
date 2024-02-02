import 'package:flutter/material.dart';
import 'package:fulltimeforce_challenge/l10n/l10n.dart';
import 'package:fulltimeforce_challenge/router/app_routes.dart';
import 'package:fulltimeforce_challenge/utils/assets.dart';
import 'package:fulltimeforce_challenge/utils/colors.dart';

import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      GoRouter.of(context).go(AppRoutes.commits);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.githubLogo,
              width: 150,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.splashText,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(color: AppColors.green),
          ],
        ),
      ),
    );
  }
}
