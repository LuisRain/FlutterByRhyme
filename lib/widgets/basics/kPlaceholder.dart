import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class PlaceholderDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/PlaceHolder';
  final String detail =
      '''一个小部件，用于绘制一个框，表示有一天会添加其他小部件的位置。

此小组件在开发期间非常有用，表示接口尚未完成。

默认情况下，占位符的大小适合其容器。如果占位符位于无界空间中，它将根据给定的fallbackWidth和fallbackHeight自行调整大小.''';

  @override
  _PlaceholderDemoState createState() => _PlaceholderDemoState();
}

class _PlaceholderDemoState extends ExampleState<PlaceholderDemo> {
  PlaceholderSetting setting;

  @override
  void initState() {
    setting = PlaceholderSetting(
      color: colorValues[1],
      strokeWidth: doubleMiniValues[1],
      fallbackHeight: doubleHugeValues[0],
      fallbackWidth: doubleHugeValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    // TODO: implement getExampleCode
    return '''Placeholder(
        color: ${setting.color?.label ?? ''},
        strokeWidth: ${setting.strokeWidth?.label ?? ''},
        fallbackHeight: ${setting.fallbackHeight?.label ?? ''},
        fallbackWidth: ${setting.fallbackWidth?.label ?? ''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kStrokeWidth,
        value: setting.strokeWidth,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(strokeWidth: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleHugeValues,
        title: StringParams.kFallbackWidth,
        value: setting.fallbackWidth,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(fallbackWidth: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleHugeValues,
        title: StringParams.kFallbackHeight,
        value: setting.fallbackHeight,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(fallbackHeight: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Placeholder';
  }

  @override
  Widget getWidget() {
    return Placeholder(
      color: setting.color?.value,
      strokeWidth: setting.strokeWidth?.value,
      fallbackHeight: setting.fallbackHeight?.value,
      fallbackWidth: setting.fallbackWidth?.value,
    );
  }
}

class PlaceholderSetting {
  final Value<Color> color;
  final Value<double> strokeWidth;
  final Value<double> fallbackWidth;
  final Value<double> fallbackHeight;

  PlaceholderSetting({
    this.color,
    this.strokeWidth,
    this.fallbackWidth,
    this.fallbackHeight,
  });

  PlaceholderSetting copyWith({
    Value<Color> color,
    Value<double> strokeWidth,
    Value<double> fallbackWidth,
    Value<double> fallbackHeight,
  }) {
    return PlaceholderSetting(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      fallbackWidth: fallbackWidth ?? this.fallbackWidth,
      fallbackHeight: fallbackHeight ?? this.fallbackHeight,
    );
  }
}
