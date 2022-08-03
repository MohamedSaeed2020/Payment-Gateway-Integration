abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class PaymentSuccessState extends PaymentStates {}

class PaymentErrorState extends PaymentStates {
  String error;
  PaymentErrorState({
    required this.error,
  });
}

class PaymentOrderIdSuccessState extends PaymentStates {}

class PaymentOrderIdErrorState extends PaymentStates {
  String error;
  PaymentOrderIdErrorState({
    required this.error,
  });
}

class PaymentCardTokenSuccessState extends PaymentStates {}

class PaymentCardTokenErrorState extends PaymentStates {
  String error;
  PaymentCardTokenErrorState({
    required this.error,
  });
}

class PaymentKioskTokenSuccessState extends PaymentStates {}

class PaymentKioskTokenErrorState extends PaymentStates {
  String error;
  PaymentKioskTokenErrorState({
    required this.error,
  });
}

class PaymentReferenceCodeSuccessState extends PaymentStates {}

class PaymentReferenceCodeErrorState extends PaymentStates {
  String error;
  PaymentReferenceCodeErrorState({
    required this.error,
  });
}
