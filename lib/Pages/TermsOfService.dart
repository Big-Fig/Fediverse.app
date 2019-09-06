import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Terms"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
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
