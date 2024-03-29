import 'package:fedi_app/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi_app/app/instance/trends/instance_trends_widget.dart';
import 'package:fedi_app/app/instance/trends/local/local_instance_trends_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalInstanceTrendsPage extends StatelessWidget {
  const LocalInstanceTrendsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceTrendsWidget(),
        ),
      );
}

MaterialPageRoute<void> createLocalInstanceTrendsPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => LocalInstanceTrendsBloc.provideToContext(
        context,
        child: const LocalInstanceTrendsPage(),
      ),
    );

void goToLocalInstanceTrendsPage(BuildContext context) {
  Navigator.push(
    context,
    createLocalInstanceTrendsPageRoute(),
  );
}
