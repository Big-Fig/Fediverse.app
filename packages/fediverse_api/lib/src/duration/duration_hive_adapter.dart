import 'package:hive/hive.dart';

class DurationHiveAdapter extends TypeAdapter<Duration> {
  @override
  final typeId = 4;

  @override
  void write(BinaryWriter writer, Duration obj) =>
      writer.writeInt(obj.inMicroseconds);

  @override
  Duration read(BinaryReader reader) =>
      Duration(microseconds: reader.readInt());
}
