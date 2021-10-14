import 'package:flutter/cupertino.dart';

class FilledStatusBarWidget extends StatelessWidget {
  final Color color;

  const FilledStatusBarWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).padding.top,
        color: color,
      );
}
