import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("terms.title")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            // TODO: Should be localized
            future: DefaultAssetBundle.of(context)
                .loadString("assets/terms/terms.rtf"),
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? '',
                softWrap: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
