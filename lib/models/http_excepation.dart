class HttpExcepation implements Exception {
  final String massage;
  HttpExcepation(this.massage);

  @override
  String toString() {
    return massage;
    // return super.toString(); // instance of HttpExceaption
  }
}
