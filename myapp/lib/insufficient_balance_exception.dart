class  InsufficientBalanceException implements Exception {
  final String message;

  // Constructor to accept a message
  InsufficientBalanceException(this.message);
  
   @override
   String toString() => "InsufficientBalanceException: $message";
}