import 'package:flutter_test/flutter_test.dart';
import 'package:fulltimeforce_challenge/app/app.dart';
import 'package:fulltimeforce_challenge/splash/view/splash_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SplashPage), findsOneWidget);
    });
  });
}
