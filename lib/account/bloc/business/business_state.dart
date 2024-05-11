part of 'business_bloc.dart';

@immutable
abstract class BusinessState extends Equatable {}

class BusinessLoadingState extends BusinessState {
  @override
  List<Object> get props => [];
}

class BusinessLoadedState extends BusinessState {
  final dynamic data; // Data loaded successfully

  BusinessLoadedState(this.data);
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginSuccessState extends BusinessLoadedState {
  final String authToken;
  final dynamic userProfile;

  LoginSuccessState({required this.authToken, required this.userProfile})
      : super([authToken, userProfile]);

  @override
  String toString() => 'LoginSuccessState';
}

class RegistrationSuccessState extends BusinessLoadedState {
  final String message;

  RegistrationSuccessState(this.message) : super([message]);

  @override
  String toString() => 'RegistrationSuccessState';
}

class UpdateSuccessState extends BusinessLoadedState {
  final String message;

  UpdateSuccessState(this.message) : super([message]);

  @override
  String toString() => 'UpdateSuccessState';
}

class DeleteSuccessState extends BusinessLoadedState {
  final String message;

  DeleteSuccessState(this.message) : super([message]);

  @override
  String toString() => 'DeleteSuccessState';
}


class BusinessErrorState extends BusinessState {
  final String message;

  BusinessErrorState(this.message);

  @override
  List<Object> get props => [message];
}

