extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }

  String ellipsize({int maxChars: 5}) {
    bool isOverflowing = this.length > maxChars;

    // chop off the excess chars
    String preOutput =
        '${this.substring(0, isOverflowing ? maxChars : this.length)}';
    // add the ellipsis
    String output = '$preOutput${isOverflowing ? '...' : ''}';

    return output;
  }
}
