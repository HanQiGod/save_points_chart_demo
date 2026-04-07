import 'package:flutter/material.dart';
import 'package:save_points_chart/save_points_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeProvider(child: _ThemedApp());
  }
}

class _ThemedApp extends StatelessWidget {
  const _ThemedApp();

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'save_points_chart Demo',
      themeMode: themeProvider.themeMode,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      home: const ChartDemoPage(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F766E),
      brightness: brightness,
    );
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isDark
          ? const Color(0xFF09111F)
          : const Color(0xFFF4F8F7),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark
            ? const Color(0xFF162032)
            : const Color(0xFF163A3C),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ChartDemoPage extends StatefulWidget {
  const ChartDemoPage({super.key});

  @override
  State<ChartDemoPage> createState() => _ChartDemoPageState();
}

class _ChartDemoPageState extends State<ChartDemoPage> {
  static const Color _ink = Color(0xFF0F172A);
  static const Color _teal = Color(0xFF0F766E);
  static const Color _cyan = Color(0xFF0891B2);
  static const Color _orange = Color(0xFFEA580C);
  static const Color _emerald = Color(0xFF059669);
  static const Color _rose = Color(0xFFE11D48);
  static const Color _amber = Color(0xFFD97706);

  bool _useGlassmorphism = true;

  late final List<ChartDataSet> _lineData = [
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 0, y: 18, label: '1月'),
    ),
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 1, y: 24, label: '2月'),
    ),
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 2, y: 21, label: '3月'),
    ),
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 3, y: 29, label: '4月'),
    ),
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 4, y: 33, label: '5月'),
    ),
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 5, y: 37, label: '6月'),
    ),
  ];

  late final List<ChartDataSet> _barData = [
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 0, y: 120, label: '周一'),
    ),
    ChartDataSet(
      color: _cyan,
      dataPoint: const ChartDataPoint(x: 1, y: 156, label: '周二'),
    ),
    ChartDataSet(
      color: _orange,
      dataPoint: const ChartDataPoint(x: 2, y: 148, label: '周三'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 3, y: 176, label: '周四'),
    ),
    ChartDataSet(
      color: _rose,
      dataPoint: const ChartDataPoint(x: 4, y: 205, label: '周五'),
    ),
    ChartDataSet(
      color: _amber,
      dataPoint: const ChartDataPoint(x: 5, y: 218, label: '周六'),
    ),
  ];

  late final List<ChartDataSet> _areaData = [
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 0, y: 320, label: 'Q1'),
    ),
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 1, y: 410, label: 'Q2'),
    ),
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 2, y: 560, label: 'Q3'),
    ),
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 3, y: 680, label: 'Q4'),
    ),
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 4, y: 820, label: 'Q5'),
    ),
    ChartDataSet(
      color: _teal,
      dataPoint: const ChartDataPoint(x: 5, y: 960, label: 'Q6'),
    ),
  ];

  static const List<PieData> _pieData = [
    PieData(label: '移动端', value: 46, color: _cyan),
    PieData(label: 'Web', value: 28, color: _orange),
    PieData(label: '门店', value: 18, color: _emerald),
    PieData(label: '代理商', value: 8, color: _rose),
  ];

  static const List<PieData> _donutData = [
    PieData(label: '华东', value: 38, color: _teal),
    PieData(label: '华南', value: 26, color: _cyan),
    PieData(label: '华北', value: 19, color: _amber),
    PieData(label: '西南', value: 17, color: _rose),
  ];

  late final List<RadarDataSet> _radarData = [
    RadarDataSet(
      color: _cyan,
      dataPoints: const [
        RadarDataPoint(label: '性能', value: 84),
        RadarDataPoint(label: '易用性', value: 78),
        RadarDataPoint(label: '美观度', value: 91),
        RadarDataPoint(label: '稳定性', value: 87),
        RadarDataPoint(label: '扩展性', value: 74),
        RadarDataPoint(label: '文档', value: 70),
      ],
    ),
    RadarDataSet(
      color: _orange,
      dataPoints: const [
        RadarDataPoint(label: '性能', value: 72),
        RadarDataPoint(label: '易用性', value: 88),
        RadarDataPoint(label: '美观度', value: 76),
        RadarDataPoint(label: '稳定性', value: 82),
        RadarDataPoint(label: '扩展性', value: 80),
        RadarDataPoint(label: '文档', value: 86),
      ],
    ),
  ];

  late final List<ChartDataSet> _sparklineData = [
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 0, y: 32, label: '09:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 1, y: 34, label: '10:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 2, y: 33, label: '11:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 3, y: 36, label: '12:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 4, y: 38, label: '13:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 5, y: 37, label: '14:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 6, y: 41, label: '15:00'),
    ),
    ChartDataSet(
      color: _emerald,
      dataPoint: const ChartDataPoint(x: 7, y: 44, label: '16:00'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final themeProvider = ThemeProvider.of(context);
    final isDark = materialTheme.brightness == Brightness.dark;
    final chartTheme = _buildChartTheme(themeProvider.chartTheme, isDark);

    final chartConfig = ChartsConfig(
      theme: chartTheme,
      useGlassmorphism: _useGlassmorphism,
      boxShadow: _useGlassmorphism
          ? null
          : [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.32 : 0.1),
                blurRadius: 24,
                offset: const Offset(0, 14),
              ),
            ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('save_points_chart Demo'),
        actions: [
          IconButton(
            tooltip: isDark ? '切换到浅色模式' : '切换到深色模式',
            onPressed: themeProvider.toggleTheme,
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              materialTheme.scaffoldBackgroundColor,
              materialTheme.colorScheme.surfaceContainerLowest,
              materialTheme.colorScheme.primary.withValues(alpha: 0.08),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            _buildHeroCard(
              context,
              isDark: isDark,
              onToggleTheme: themeProvider.toggleTheme,
            ),
            const SizedBox(height: 24),
            Text(
              '7 类图表示例',
              style: materialTheme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '折线、柱状、面积、饼图、环形图、雷达图和迷你曲线全部基于 CustomPainter，点击任意元素会弹出上下文菜单。',
              style: materialTheme.textTheme.bodyMedium?.copyWith(
                color: materialTheme.colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                const spacing = 20.0;
                final columns = constraints.maxWidth >= 1100 ? 2 : 1;
                final itemWidth = columns == 1
                    ? constraints.maxWidth
                    : (constraints.maxWidth - spacing) / 2;

                final charts = _buildCharts(context, chartConfig);

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: charts
                      .map((chart) => SizedBox(width: itemWidth, child: chart))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(
    BuildContext context, {
    required bool isDark,
    required VoidCallback onToggleTheme,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.12)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isDark
                ? const Color(0xFF122032)
                : const Color(0xFFFFFFFF).withValues(alpha: 0.92),
            isDark
                ? const Color(0xFF0C1829)
                : const Color(0xFFF4FBFA).withValues(alpha: 0.92),
            colorScheme.primary.withValues(alpha: isDark ? 0.22 : 0.14),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.08),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _FeatureChip(icon: Icons.auto_graph_rounded, label: '零外部依赖'),
              _FeatureChip(icon: Icons.widgets_rounded, label: 'Material 3'),
              _FeatureChip(icon: Icons.blur_on_rounded, label: '玻璃态'),
              _FeatureChip(icon: Icons.touch_app_rounded, label: '交互菜单'),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '纯 CustomPainter 图表演示',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '这个工程按照文章思路直接搭了一个可运行 demo。它使用 save_points_chart 当前可兼容版本的真实 API，完整展示主题切换、玻璃态容器和多图表交互。',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.tonalIcon(
                onPressed: onToggleTheme,
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                ),
                label: Text(isDark ? '切到浅色模式' : '切到深色模式'),
              ),
              FilterChip(
                selected: _useGlassmorphism,
                onSelected: (value) {
                  setState(() {
                    _useGlassmorphism = value;
                  });
                },
                avatar: Icon(
                  _useGlassmorphism
                      ? Icons.water_drop_rounded
                      : Icons.layers_clear_rounded,
                  size: 18,
                ),
                label: Text(_useGlassmorphism ? '玻璃态已开启' : '玻璃态已关闭'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _MetricBadge(title: '7', label: '类图表'),
              _MetricBadge(title: 'M3', label: '视觉风格'),
              _MetricBadge(title: '1.7.2', label: '兼容包版本'),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(
                alpha: isDark ? 0.36 : 0.78,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.08),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded, color: colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '提示：当前安装到的是 save_points_chart 1.7.2，数据模型和文章中的旧写法略有差异。本 demo 已按真实包接口适配，可直接编译。',
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCharts(BuildContext context, ChartsConfig config) {
    return [
      LineChartWidget(
        dataSets: _lineData,
        config: config,
        title: '营收趋势',
        subtitle: '最近 6 个月',
        height: 280,
        showArea: false,
        onPointTap: (point, datasetIndex, pointIndex, position) {
          _showPointMenu(
            context: context,
            config: config,
            point: point,
            position: position,
            datasetLabel: '营收趋势',
            datasetIndex: datasetIndex,
            elementIndex: pointIndex,
          );
        },
      ),
      BarChartWidget(
        dataSets: _barData,
        config: config,
        title: '订单分布',
        subtitle: '最近一周',
        height: 280,
        onBarTap: (point, datasetIndex, barIndex, position) {
          _showPointMenu(
            context: context,
            config: config,
            point: point,
            position: position,
            datasetLabel: '订单分布',
            datasetIndex: datasetIndex,
            elementIndex: barIndex,
          );
        },
      ),
      AreaChartWidget(
        dataSets: _areaData,
        config: config,
        title: '活跃用户增长',
        subtitle: '季度累计',
        height: 280,
        onPointTap: (point, datasetIndex, pointIndex, position) {
          _showPointMenu(
            context: context,
            config: config,
            point: point,
            position: position,
            datasetLabel: '活跃用户增长',
            datasetIndex: datasetIndex,
            elementIndex: pointIndex,
          );
        },
      ),
      PieChartWidget(
        data: _pieData,
        config: config,
        title: '渠道占比',
        subtitle: '本月流量来源',
        legendLayout: Axis.vertical,
        height: 280,
        onSegmentTap: (segment, segmentIndex, position) {
          _showSegmentMenu(
            context: context,
            config: config,
            segment: segment,
            position: position,
            chartTitle: '渠道占比',
            elementIndex: segmentIndex,
          );
        },
      ),
      DonutChartWidget(
        data: _donutData,
        config: config,
        title: '区域贡献',
        subtitle: '分区销售额',
        legendLayout: Axis.vertical,
        height: 280,
        onSegmentTap: (segment, segmentIndex, position) {
          _showSegmentMenu(
            context: context,
            config: config,
            segment: segment,
            position: position,
            chartTitle: '区域贡献',
            elementIndex: segmentIndex,
          );
        },
      ),
      RadarChartWidget(
        dataSets: _radarData,
        config: config,
        title: '能力对比',
        subtitle: '两个方案的综合维度表现',
        height: 340,
        onPointTap: (point, datasetIndex, pointIndex, position) {
          _showPointMenu(
            context: context,
            config: config,
            point: point,
            position: position,
            datasetLabel: datasetIndex == 0 ? '方案 A' : '方案 B',
            datasetIndex: datasetIndex,
            elementIndex: pointIndex,
          );
        },
      ),
      SparklineChartWidget(
        dataSets: _sparklineData,
        config: config,
        title: '实时转化',
        subtitle: '小时级迷你曲线',
        height: 120,
        onPointTap: (point, datasetIndex, pointIndex, position) {
          _showPointMenu(
            context: context,
            config: config,
            point: point,
            position: position,
            datasetLabel: '实时转化',
            datasetIndex: datasetIndex,
            elementIndex: pointIndex,
          );
        },
      ),
    ];
  }

  ChartTheme _buildChartTheme(ChartTheme baseTheme, bool isDark) {
    return baseTheme.copyWith(
      backgroundColor: isDark
          ? const Color(0xFF101B2B)
          : const Color(0xFFFAFCFB),
      textColor: isDark ? const Color(0xFFF8FAFC) : _ink,
      gridColor: isDark ? const Color(0xFF334155) : const Color(0xFFDDE7E4),
      axisColor: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
      gradientColors: const [_teal, _cyan, _orange, _emerald, _rose],
    );
  }

  void _showPointMenu({
    required BuildContext context,
    required ChartsConfig config,
    required ChartDataPoint point,
    required Offset position,
    required String datasetLabel,
    int? datasetIndex,
    int? elementIndex,
  }) {
    final pointLabel = point.label ?? '未命名节点';
    final pointValue = point.y.toStringAsFixed(
      point.y.truncateToDouble() == point.y ? 0 : 1,
    );

    ChartContextMenuHelper.show(
      context,
      point: point,
      segment: null,
      position: position,
      datasetIndex: datasetIndex,
      elementIndex: elementIndex,
      datasetLabel: datasetLabel,
      theme: config.theme,
      useGlassmorphism: config.useGlassmorphism ?? false,
      useNeumorphism: config.useNeumorphism ?? false,
      backgroundBlur: config.useGlassmorphism ?? false,
      onViewDetails: () {
        _showSnackBar('查看详情：$datasetLabel / $pointLabel / 数值 $pointValue');
      },
      onExport: () {
        _showSnackBar('已模拟导出 $datasetLabel 中的 $pointLabel 数据');
      },
      onShare: () {
        _showSnackBar('已模拟分享 $datasetLabel 当前选中图表');
      },
    );
  }

  void _showSegmentMenu({
    required BuildContext context,
    required ChartsConfig config,
    required PieData segment,
    required Offset position,
    required String chartTitle,
    int? elementIndex,
  }) {
    ChartContextMenuHelper.show(
      context,
      point: null,
      segment: segment,
      position: position,
      elementIndex: elementIndex,
      datasetLabel: chartTitle,
      theme: config.theme,
      useGlassmorphism: config.useGlassmorphism ?? false,
      useNeumorphism: config.useNeumorphism ?? false,
      backgroundBlur: config.useGlassmorphism ?? false,
      onViewDetails: () {
        _showSnackBar(
          '查看详情：$chartTitle / ${segment.label} / ${segment.value.toStringAsFixed(0)}%',
        );
      },
      onExport: () {
        _showSnackBar('已模拟导出 $chartTitle 的 ${segment.label} 分项');
      },
      onShare: () {
        _showSnackBar('已模拟分享 $chartTitle 图表快照');
      },
    );
  }

  void _showSnackBar(String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.08)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: colorScheme.primary),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricBadge extends StatelessWidget {
  const _MetricBadge({required this.title, required this.label});

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
