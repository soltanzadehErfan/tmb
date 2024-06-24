// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:tmb/main.dart' as app;
//
// void main() {
//   testWidgets('Verify button tap', (WidgetTester tester) async {
//     await tester.pumpWidget(app.MaterialApp(
//       // Wrap with MaterialApp
//       home: Material(
//         child: Center(
//           child: ElevatedButton(
//             onPressed: app._launchUrl,
//             child: const Icon(Icons.home_rounded),
//           ),
//         ),
//       ),
//     ));
//
//     final Finder buttonFinder = find.byIcon(Icons.home_rounded);
//     expect(buttonFinder, findsOneWidget);
//
//     await tester.tap(buttonFinder);
//     await tester.pump();
//   });
// }
