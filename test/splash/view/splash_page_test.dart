import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_challenge/splash/view/splash_page.dart';
import 'package:fulltimeforce_challenge/utils/assets.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Splash Page', () {
    testWidgets('Render widget from SplashPage', (tester) async {
      await tester.pumpApp(const SplashPage());
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              (widget.image as AssetImage).assetName == Assets.githubLogo,
        ),
        findsOneWidget,
      );
      expect(find.byType(CircularProgressIndicator), findsOne);
    });
  });
}
