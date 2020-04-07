import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_auth_instance_context_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentAuthInstanceContextLoadingPage extends StatelessWidget {
  final Widget child;
  CurrentAuthInstanceContextLoadingPage({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CurrentAuthInstanceContextLoadingWidget(child: child)));
  }
}
