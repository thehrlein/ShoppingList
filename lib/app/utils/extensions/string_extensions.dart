
extension StringExtension on String {
  String capitalize() {
    return (this == null || this.length == 0) ? this : "${this[0].toUpperCase()}${this.substring(1)}";
  }
}