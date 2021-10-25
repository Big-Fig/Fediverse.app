import 'package:fedi_app/app/instance/activity/instance_activity_widget.dart';
import 'package:fedi_app/app/instance/activity/local/local_instance_activity_bloc_impl.dart';
import 'package:fedi_app/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalInstanceActivityPage extends StatelessWidget {
  const LocalInstanceActivityPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceActivityWidget(),
        ),
      );
}

MaterialPageRoute<void> createLocalInstanceActivityPageRoute() =>
    MaterialPageRoute(
      builder: (context) => LocalInstanceActivityBloc.provideToContext(
        context,
        child: const LocalInstanceActivityPage(),
      ),
    );

void goToLocalInstanceActivityPage(BuildContext context) {
  Navigator.push(
    context,
    createLocalInstanceActivityPageRoute(),
  );
}
