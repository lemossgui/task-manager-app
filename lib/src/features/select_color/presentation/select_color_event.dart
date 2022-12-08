abstract class SelectColorEvent {}

class SelectColor extends SelectColorEvent {
  final String key;

  SelectColor({
    required this.key,
  });
}
