import 'package:flutter/cupertino.dart';

class FediTabMainHeaderBarWidget extends StatelessWidget {
  final List<Widget> leadingWidgets;
  final Widget content;
  final List<Widget> endingWidgets;

  FediTabMainHeaderBarWidget({
    @required this.leadingWidgets,
    @required this.content,
    @required this.endingWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
        right: 16.0,
        bottom: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leadingWidgets != null)
            Row(
              children: leadingWidgets,
            ),
          if (content != null)
            Expanded(
              child: content,
            ),
          if (endingWidgets != null)
            Row(
              children: endingWidgets,
            )
        ],
      ),
    );
  }
}
