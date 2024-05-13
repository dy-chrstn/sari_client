import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sari/account/model/businessAcc.dart';
import 'package:sari/account/services/businessAcc.dart';

part 'business_event.dart';
part 'business_state.dart';

// class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
//   final BusinessRepository _businessRepository;

//   BusinessBloc(this._businessRepository) : super(BusinessLoadingState()) {
//     on<LoadBusinessEvent>((event, emit) async {
//       emit(BusinessLoadingState());
//       await Future.delayed(const Duration(seconds: 1));
      
//       try{
//         _businessRepository.loginBusinessAcc('email', 'password');
//         emit(BusinessLoadedState('data'));
//       }catch(e){
//         emit(BusinessErrorState(e.toString()));
//       }
//     });
//   }
// }
