import 'package:flutter/widgets.dart';

typedef CustomTabBuilder<T> = Widget Function(
  BuildContext context,
  Widget child,
  T tab,
);
