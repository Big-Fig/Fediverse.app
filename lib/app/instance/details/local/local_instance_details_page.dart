import 'package:fedi/app/instance/app_bar/instance_host_app_bar_widget.dart';
import 'package:fedi/app/instance/details/instance_details_widget.dart';
import 'package:fedi/app/instance/details/local/local_instance_details_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalInstanceDetailsPage extends StatelessWidget {
  const LocalInstanceDetailsPage();

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: InstanceHostAppBarWidget(),
        body: SafeArea(
          child: InstanceDetailsWidget(),
        ),
      );
}

MaterialPageRoute<void> createLocalInstanceDetailsPageRoute() =>
    MaterialPageRoute<void>(
      builder: (context) => LocalInstanceDetailsBloc.provideToContext(
        context,
        child: const LocalInstanceDetailsPage(),
      ),
    );

void goToLocalInstanceDetailsPage(BuildContext context) {
  Navigator.push(
    context,
    createLocalInstanceDetailsPageRoute(),
  );
}
