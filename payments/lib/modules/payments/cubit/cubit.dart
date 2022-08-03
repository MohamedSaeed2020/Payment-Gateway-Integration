import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:payments/models/authentication_token_model.dart';
import 'package:payments/modules/payments/cubit/state.dart';
import 'package:payments/shared/components/constants.dart';
import 'package:payments/shared/network/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(PaymentStates initialState) : super(initialState);

  static PaymentCubit get(context) => BlocProvider.of(context);

  //AuthenticationTokenModel? authenticationTokenModel;
  Future<void> getAuthenticationToken(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'auth/tokens', data: {
      'api_key': paymobApiKey,
    }).then((value) {
      /*authenticationTokenModel =AuthenticationTokenModel.fromJson(value.data);
      paymobAuthenticationToken = authenticationTokenModel!.token;*/
      paymobAuthenticationToken = value.data['token'];
      log('paymobAuthenticationToken: $paymobAuthenticationToken');
      getOrderId(price, firstName, lastName, email, phone);
      emit(PaymentSuccessState());
    }).catchError((error) {
      emit(
        PaymentErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future<void> getOrderId(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'ecommerce/orders', data: {
      'auth_token': paymobAuthenticationToken,
      'delivery_needed': 'false',
      'amount_cents': price,
      'currency': 'EGP',
      'items': [],
    }).then((value) {
      orderId = value.data['id'].toString();
      log('orderId: $orderId');
      getCardPaymentToken(price, firstName, lastName, email, phone);
      getKioskPaymentToken(price, firstName, lastName, email, phone);
      emit(PaymentOrderIdSuccessState());
    }).catchError((error) {
      emit(
        PaymentOrderIdErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future<void> getCardPaymentToken(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'acceptance/payment_keys', data: {
      'auth_token': paymobAuthenticationToken,
      'order_id': orderId,
      'amount_cents': price,
      'currency': 'EGP',
      'integration_id': cardIntegrationId,
      'expiration': 3600,
      "billing_data": {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phone,
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
      },
    }).then((value) {
      cardPaymentToken = value.data['token'].toString();
      log('cardPaymentToken: $cardPaymentToken');
      emit(PaymentCardTokenSuccessState());
    }).catchError((error) {
      emit(
        PaymentCardTokenErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future<void> getKioskPaymentToken(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'acceptance/payment_keys', data: {
      'auth_token': paymobAuthenticationToken,
      'order_id': orderId,
      'amount_cents': price,
      'currency': 'EGP',
      'integration_id': kioskIntegrationId,
      'expiration': 3600,
      "billing_data": {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phone,
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA"
      },
    }).then((value) {
      kioskPaymentToken = value.data['token'].toString();
      log('kioskPaymentToken: $kioskPaymentToken');
      getReferenceCode();
      emit(PaymentKioskTokenSuccessState());
    }).catchError((error) {
      emit(
        PaymentKioskTokenErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future<void> getReferenceCode() async {
    DioHelper.postData(url: 'acceptance/payments/pay', data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": kioskPaymentToken,
    }).then((value) {
      referenceCode = value.data['id'].toString();
      log('referenceCode: $referenceCode');
      emit(PaymentReferenceCodeSuccessState());
    }).catchError((error) {
      emit(
        PaymentReferenceCodeErrorState(
          error: error.toString(),
        ),
      );
    });
  }
}
