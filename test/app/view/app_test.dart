import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_challenge/app/app.dart';
import 'package:fulltimeforce_challenge/splash/view/splash_page.dart';

void main() {
  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(AppView), findsOne);
    });

    testWidgets('find a  MaterialApp', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MaterialApp), findsOne);
    });

    testWidgets('renders SplashScreen', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SplashPage), findsOne);
    });
  });
}
