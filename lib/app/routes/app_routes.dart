// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SIGN_IN = _Paths.SIGN_IN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SIGN_IN = '/sign-in';
}
