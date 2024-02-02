import 'package:flutter/material.dart';

import 'package:fulltimeforce_challenge/utils/widgets/widgets.dart';

class LoadingProfile extends StatelessWidget {
  const LoadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 32),
            ShimmerCircle(radius: 80),
            SizedBox(height: 32),
            ShimmerBox(
              height: 80,
              percetangeWidth: 0.6,
            ),
            SizedBox(height: 32),
            ShimmerBox(
              height: 80,
              percetangeWidth: 0.6,
            ),
            SizedBox(height: 32),
            ShimmerBox(
              height: 80,
              percetangeWidth: 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
