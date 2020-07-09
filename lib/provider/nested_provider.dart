import 'package:flutter/cupertino.dart';

typedef NestedProviderBuilder = Widget Function(
  BuildContext context,
  Widget child,
);

class NestedProvider extends StatelessWidget {
  final Widget child;

  final List<NestedProviderBuilder> nestedProviderBuilders;

  NestedProvider({
    @required this.child,
    @required this.nestedProviderBuilders,
  });

  @override
  Widget build(BuildContext context) {
    var result = child;

    nestedProviderBuilders.forEach((nestedProviderBuilder) {
      result = Builder(
        builder: (BuildContext context) => nestedProviderBuilder(context, result),
      );
    });

    return result;
  }
}
