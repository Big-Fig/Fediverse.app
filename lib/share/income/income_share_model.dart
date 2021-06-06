class IncomeShareEvent {
  final String? text;
  final List<IncomeShareEventMedia>? medias;

  IncomeShareEvent({
    required this.text,
    required this.medias,
  });

  @override
  String toString() => 'IncomeShareEvent{'
      'text: $text, '
      'medias: $medias'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeShareEvent &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          medias == other.medias;

  @override
  int get hashCode => text.hashCode ^ medias.hashCode;
}

class IncomeShareEventMedia {
  final String path;

  final String? thumbnail;

  final int? duration;

  final IncomeShareEventMediaType type;

  IncomeShareEventMedia({
    required this.path,
    required this.thumbnail,
    required this.duration,
    required this.type,
  });

  @override
  String toString() => 'IncomeShareEventMedia{'
      'path: $path, '
      'thumbnail: $thumbnail, '
      'duration: $duration, '
      'type: $type'
      '}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeShareEventMedia &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          thumbnail == other.thumbnail &&
          duration == other.duration &&
          type == other.type;

  @override
  int get hashCode =>
      path.hashCode ^ thumbnail.hashCode ^ duration.hashCode ^ type.hashCode;
}

enum IncomeShareEventMediaType { image, video, file }
