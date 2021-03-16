import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/cupertino.dart';

class FediTabMainHeaderBarWidget extends StatelessWidget {
  final List<Widget>? leadingWidgets;
  final Widget? content;
  final List<Widget>? endingWidgets;

  FediTabMainHeaderBarWidget({
    required this.leadingWidgets,
    required this.content,
    required this.endingWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: FediSizes.bigPadding,
        top: FediSizes.bigPadding,
        right: FediSizes.bigPadding,
        bottom: FediSizes.bigPadding + FediSizes.smallPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leadingWidgets != null)
            Row(
              children: leadingWidgets!,
            ),
          if (content != null)
            Expanded(
              child: content!,
            ),
          if (endingWidgets != null)
            Row(
              children: endingWidgets!,
            )
        ],
      ),
    );
  }
}
