import 'package:flutter/cupertino.dart';

class FilledStatusBarWidget extends StatelessWidget {
  final Color color;

  FilledStatusBarWidget({required this.color});

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery
            .of(context)
            .padding
            .top,
        color: color);

}