class Language {
  final String id;
  final String name;
  bool isSelected;

  Language({
    required this.id,
    required this.name,
    this.isSelected = false,
  });
}
