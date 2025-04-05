

extension StringX on String? {
  String get firstCap {
    if (this?.trim().isEmpty ?? true) return '';
    return this!.toLowerCase().split(' ').map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '').join(' ');
  }
}