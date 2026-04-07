import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:save_points_chart_demo/main.dart';

void main() {
  testWidgets('首页能正常渲染图表示例', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('纯 CustomPainter 图表演示'), findsOneWidget);
    expect(find.text('玻璃态已开启'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('7 类图表示例'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();

    expect(find.text('7 类图表示例'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('营收趋势'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump();

    expect(find.text('营收趋势'), findsOneWidget);
  });
}
