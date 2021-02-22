import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class BaselineBox extends SingleChildRenderObjectWidget {
  const BaselineBox({Key key, @required this.baseline, Widget child})
      : assert(baseline != null),
        super(key: key, child: child);

  final double baseline;

  @override
  RenderBaselineBox createRenderObject(BuildContext context) =>
      new RenderBaselineBox(baseline: baseline);

  @override
  void updateRenderObject(
      BuildContext context, RenderBaselineBox renderObject) {
    renderObject.baseline = baseline;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new DoubleProperty('baseline', baseline));
  }
}

class RenderBaselineBox extends RenderProxyBox {
  RenderBaselineBox({
    RenderBox child,
    @required double baseline,
  })  : assert(baseline != null),
        assert(baseline >= 0.0),
        assert(baseline.isFinite),
        _baseline = baseline,
        super(child);

  double get baseline => _baseline;
  double _baseline;

  set baseline(double value) {
    assert(value != null);
    assert(value >= 0.0);
    assert(value.isFinite);
    if (_baseline == value) return;
    _baseline = value;
    markNeedsLayout();
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baselineType) {
    return _baseline;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new DoubleProperty('baseline', baseline));
  }
}
