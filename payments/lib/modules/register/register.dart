import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payments/modules/payments/cubit/cubit.dart';
import 'package:payments/modules/payments/cubit/state.dart';
import 'package:payments/modules/payments/toogle.dart';
import 'package:payments/shared/components/button_text_icon.dart';
import 'package:payments/shared/components/components.dart';
import 'package:payments/shared/components/traditional_text_form_field.dart';
import 'package:payments/shared/styles/colors.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => PaymentCubit(PaymentInitialState()),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is PaymentReferenceCodeSuccessState) {
            navigateAndRemoveUntil(context, const PaymentMethodToogleScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text('Paymob Payment Integration'),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TraditionalTextFormField(
                        hintText: 'First Name',
                        textInputType: TextInputType.name,
                        controller: firstNameController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TraditionalTextFormField(
                        hintText: 'Last Name',
                        textInputType: TextInputType.name,
                        controller: lastNameController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TraditionalTextFormField(
                        hintText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TraditionalTextFormField(
                        hintText: 'Mobile',
                        textInputType: TextInputType.phone,
                        controller: phoneController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TraditionalTextFormField(
                        hintText: 'Price',
                        textInputType: TextInputType.number,
                        controller: priceController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomMaterialButton(
                        background: primaryColor,
                        topLeftRadius: 10,
                        topRightRadius: 10,
                        bottomLeftRadius: 10,
                        bottomRightRadius: 10,
                        fontSize: 18,
                        height: 50,
                        width: 200,
                        pressed: () {
                          if (formKey.currentState!.validate()) {
                            PaymentCubit.get(context).getAuthenticationToken(
                              priceController.text,
                              firstNameController.text,
                              lastNameController.text,
                              emailController.text,
                              phoneController.text,
                            );
                          }
                        },
                        text: 'Go 2 Pay',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
