// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `try again`
  String get tryAgain {
    return Intl.message(
      'try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Hey,\nWelcome\nBack`
  String get loginTitle {
    return Intl.message(
      'Hey,\nWelcome\nBack',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add valid name`
  String get addvalidname {
    return Intl.message(
      'Add valid name',
      name: 'addvalidname',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter a vaild password`
  String get addvaildpassword {
    return Intl.message(
      'Enter a vaild password',
      name: 'addvaildpassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Admin`
  String get WelcomeAdmin {
    return Intl.message(
      'Welcome Admin',
      name: 'WelcomeAdmin',
      desc: '',
      args: [],
    );
  }

  /// `This is mahatacast dashboard`
  String get mahatacastdashboard {
    return Intl.message(
      'This is mahatacast dashboard',
      name: 'mahatacastdashboard',
      desc: '',
      args: [],
    );
  }

  /// `Podcast`
  String get Podcast {
    return Intl.message(
      'Podcast',
      name: 'Podcast',
      desc: '',
      args: [],
    );
  }

  /// `Channel`
  String get Channel {
    return Intl.message(
      'Channel',
      name: 'Channel',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get Reports {
    return Intl.message(
      'Reports',
      name: 'Reports',
      desc: '',
      args: [],
    );
  }

  /// `The podcast  `
  String get Thepodcast {
    return Intl.message(
      'The podcast  ',
      name: 'Thepodcast',
      desc: '',
      args: [],
    );
  }

  /// `\nhas been reported`
  String get hasreported {
    return Intl.message(
      '\nhas been reported',
      name: 'hasreported',
      desc: '',
      args: [],
    );
  }

  /// `click for more details..`
  String get clickformoredetails {
    return Intl.message(
      'click for more details..',
      name: 'clickformoredetails',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get Setting {
    return Intl.message(
      'Setting',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Contents`
  String get AddYourcontents {
    return Intl.message(
      'Add Your Contents',
      name: 'AddYourcontents',
      desc: '',
      args: [],
    );
  }

  /// `start creating the contents`
  String get startcreatingcontents {
    return Intl.message(
      'start creating the contents',
      name: 'startcreatingcontents',
      desc: '',
      args: [],
    );
  }

  /// `it goes successfully`
  String get itgoessuccessfully {
    return Intl.message(
      'it goes successfully',
      name: 'itgoessuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `The process failed`
  String get Theprocessfailed {
    return Intl.message(
      'The process failed',
      name: 'Theprocessfailed',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `failed`
  String get failed {
    return Intl.message(
      'failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `The Channel  `
  String get TheChannel {
    return Intl.message(
      'The Channel  ',
      name: 'TheChannel',
      desc: '',
      args: [],
    );
  }

  /// `\nrequest for approval`
  String get requestforapproval {
    return Intl.message(
      '\nrequest for approval',
      name: 'requestforapproval',
      desc: '',
      args: [],
    );
  }

  /// `\nrequesting permission\nto publish\n`
  String get requestpermissionpublish {
    return Intl.message(
      '\nrequesting permission\nto publish\n',
      name: 'requestpermissionpublish',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get Approved {
    return Intl.message(
      'Approved',
      name: 'Approved',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you going apporve the channel ?`
  String get Areyougoingapporvechannel {
    return Intl.message(
      'Are you going apporve the channel ?',
      name: 'Areyougoingapporvechannel',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Successfuly apporved`
  String get Successfulyapporved {
    return Intl.message(
      'Successfuly apporved',
      name: 'Successfulyapporved',
      desc: '',
      args: [],
    );
  }

  /// `didn't approved`
  String get didnotapproved {
    return Intl.message(
      'didn\'t approved',
      name: 'didnotapproved',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Are you going apporve the podcast ?`
  String get Areyougoingapporvepodcast {
    return Intl.message(
      'Are you going apporve the podcast ?',
      name: 'Areyougoingapporvepodcast',
      desc: '',
      args: [],
    );
  }

  /// `Are you going delete the channel ?`
  String get deletechannel {
    return Intl.message(
      'Are you going delete the channel ?',
      name: 'deletechannel',
      desc: '',
      args: [],
    );
  }

  /// `Successfuly deleted`
  String get Successfulydeleted {
    return Intl.message(
      'Successfuly deleted',
      name: 'Successfulydeleted',
      desc: '',
      args: [],
    );
  }

  /// `didn't delete`
  String get didnotdelete {
    return Intl.message(
      'didn\'t delete',
      name: 'didnotdelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you going delete the podcast ?`
  String get deletepodcast {
    return Intl.message(
      'Are you going delete the podcast ?',
      name: 'deletepodcast',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong\nplease try again`
  String get errorMessage {
    return Intl.message(
      'Something went wrong\nplease try again',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout ?`
  String get wanttologout {
    return Intl.message(
      'Do you want to logout ?',
      name: 'wanttologout',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `unapproved`
  String get unapproved {
    return Intl.message(
      'unapproved',
      name: 'unapproved',
      desc: '',
      args: [],
    );
  }

  /// `unactived`
  String get unactived {
    return Intl.message(
      'unactived',
      name: 'unactived',
      desc: '',
      args: [],
    );
  }

  /// `\ndidn't publish podcast yet!`
  String get didnotpostpodcast {
    return Intl.message(
      '\ndidn\'t publish podcast yet!',
      name: 'didnotpostpodcast',
      desc: '',
      args: [],
    );
  }

  /// `Delete The Channel`
  String get deletethechannel {
    return Intl.message(
      'Delete The Channel',
      name: 'deletethechannel',
      desc: '',
      args: [],
    );
  }

  /// `Logout successfully`
  String get LogoutSuccess {
    return Intl.message(
      'Logout successfully',
      name: 'LogoutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Logout failed`
  String get LogoutFailed {
    return Intl.message(
      'Logout failed',
      name: 'LogoutFailed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
