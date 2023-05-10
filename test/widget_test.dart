import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_example/login.dart';

void main() {
  testWidgets("Test login form", (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: Scaffold(body: LoginForm())));

    final emailFinder = find.byKey(const Key("email")).at(0);
    final passwordFinder = find.byKey(const Key("password")).at(0);
    final loginButtonFinder = find.byType(ElevatedButton);

    await tester.enterText(emailFinder, "user@example.com");
    await tester.enterText(passwordFinder, "password");
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();

    expect(find.text("Berhasil Login"), findsOneWidget);
    expect(find.text("Selamat datang!"), findsOneWidget);
    expect(find.text("OK"), findsOneWidget);
  });
}
