// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_analytics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppAnalyticsDataAdapter extends TypeAdapter<AppAnalyticsData> {
  @override
  final int typeId = 62;

  @override
  AppAnalyticsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppAnalyticsData(
      appOpenedCount: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AppAnalyticsData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.appOpenedCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppAnalyticsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppAnalyticsData _$AppAnalyticsDataFromJson(Map<String, dynamic> json) =>
    AppAnalyticsData(
      appOpenedCount: json['appOpenedCount'] as int,
    );

Map<String, dynamic> _$AppAnalyticsDataToJson(AppAnalyticsData instance) =>
    <String, dynamic>{
      'appOpenedCount': instance.appOpenedCount,
    };
