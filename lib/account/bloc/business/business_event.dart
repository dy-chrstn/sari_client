part of 'business_bloc.dart';

@immutable
abstract class BusinessEvent extends Equatable {
  const BusinessEvent();
}

class LoadBusinessEvent extends BusinessEvent {
  @override
  List<Object> get props => [];
}

class LoginBusinessEvent extends BusinessEvent {
  final String email;
  final String password;

  const LoginBusinessEvent(this.email, this.password);
  
  @override
  List<Object> get props => [];
}

class LogoutBusinessEvent extends BusinessEvent {
  @override
  List<Object> get props => [];
}

class RegisterBusinessEvent extends BusinessEvent {
  final String username;
  final String email;
  final String password;

  RegisterBusinessEvent(this.username, this.email, this.password);

  @override
  List<Object> get props => [];
}

class UpdateBusinessEvent extends BusinessEvent {
  final String username;
  final String email;
  final String password;

  const UpdateBusinessEvent(this.username, this.email, this.password);

  @override
  List<Object> get props => [];
}

class DeleteBusinessEvent extends BusinessEvent {
  @override
  List<Object> get props => [];
}

