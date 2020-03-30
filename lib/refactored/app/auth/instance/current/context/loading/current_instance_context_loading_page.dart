import 'package:fedi/refactored/app/auth/instance/current/context/loading/current_instance_context_loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_instance_context_loading_page.dart");

class CurrentInstanceContextLoadingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: CurrentInstanceContextLoadingWidget()));
  }

  CurrentInstanceContextLoadingPage() {
    _logger.finest(() => "constructor");
  }
}
