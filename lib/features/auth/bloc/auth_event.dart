part of 'auth_bloc.dart';

class AuthEvent {}

class GetAdminLoginEvent extends AuthEvent {
  final String name;
  final String password;
  GetAdminLoginEvent({
    required this.name,
    required this.password,
  });
}
class CheckAuthEvent extends AuthEvent{}

class GetLogoutEvent extends AuthEvent{}
