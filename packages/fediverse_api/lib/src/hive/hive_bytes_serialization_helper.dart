import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:hive/src/binary/binary_reader_impl.dart';
import 'package:hive/src/binary/binary_writer_impl.dart';
import 'package:hive/src/registry/type_registry_impl.dart';

import '../../fediverse_api.dart';

// ignore_for_file: implementation_imports

abstract class HiveBytesSerializationHelper {
  Uint8List writeToBytes(
    IFediverseApiObject obj,
    TypeRegistryImpl typeRegistryImpl,
  ) {
    var binaryWriterImpl = BinaryWriterImpl(typeRegistryImpl);

    // ignore: cascade_invocations
    binaryWriterImpl.write(obj);

    return binaryWriterImpl.toBytes();
  }

  T readFromBytes<T>(
    Uint8List bytes,
    TypeRegistryImpl typeRegistryImpl,
    TypeAdapter<T> adapter,
  ) {
    var binaryReaderImpl = BinaryReaderImpl(
      bytes,
      typeRegistryImpl,
    );

    return binaryReaderImpl.read(adapter.typeId) as T;
  }
}
