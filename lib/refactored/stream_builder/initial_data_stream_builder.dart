import 'dart:async';

import 'package:flutter/cupertino.dart';

// same behaviour like StreamBuilder but with better performance
// don't rebuild twice with initial data on first build
class InitialDataStreamBuilder<T> extends StatefulWidget {
  final T initialData;
  final AsyncWidgetBuilder<T> builder;
  final Stream<T> stream;

  InitialDataStreamBuilder(
      {@required this.initialData,
      @required this.stream,
      @required this.builder});

  @override
  _InitialDataStreamBuilderState createState() =>
      _InitialDataStreamBuilderState(initialData);
}

class _InitialDataStreamBuilderState<T>
    extends State<InitialDataStreamBuilder<T>> {
  final T currentData;

  _InitialDataStreamBuilderState(this.currentData);

  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    subscription = widget.stream.listen((newData) {
      if (newData != currentData) {
        setState(() {
          newData = currentData;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) => widget.builder(
        context, AsyncSnapshot.withData(ConnectionState.done, currentData));
}
