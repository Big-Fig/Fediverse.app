import 'package:flutter/widgets.dart';

class ConversationStatusListDateSeparatorWidget extends StatelessWidget {
  final String formattedDate;

  ConversationStatusListDateSeparatorWidget(this.formattedDate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(formattedDate),
      ),
    );
  }
}
