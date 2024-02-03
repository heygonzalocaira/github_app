import 'package:flutter/material.dart';
import 'package:fulltimeforce_challenge/utils/widgets/widgets.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// Six of both widgets
            SizedBox(height: 16),
            ShimmerBox(height: 100),
            SizedBox(height: 16),
            ShimmerBox(height: 100),
            SizedBox(height: 16),
            ShimmerBox(height: 100),
            SizedBox(height: 16),
            ShimmerBox(height: 100),
            SizedBox(height: 16),
            ShimmerBox(height: 100),
            SizedBox(height: 16),
            ShimmerBox(height: 100),
          ],
        ),
      ),
    );
  }
}
