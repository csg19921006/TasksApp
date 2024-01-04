// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordModelImplAdapter extends TypeAdapter<_$RecordModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$RecordModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$RecordModelImpl(
      recordDate: fields[0] as DateTime?,
      targetDate: fields[1] as DateTime?,
      title: fields[2] as String,
      note: fields[3] as String,
      status: fields[4] as bool,
      favorite: fields[5] as int,
      timeStamp: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$RecordModelImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.recordDate)
      ..writeByte(1)
      ..write(obj.targetDate)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.favorite)
      ..writeByte(6)
      ..write(obj.timeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
