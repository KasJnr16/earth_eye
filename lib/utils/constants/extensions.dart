extension StringExtensions on String {
  String get capitalize => isEmpty
      ? this
      : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
