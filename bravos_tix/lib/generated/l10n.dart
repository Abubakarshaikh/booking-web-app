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

  /// `Welcome back, {name}`
  String welcome_back(Object name) {
    return Intl.message(
      'Welcome back, $name',
      name: 'welcome_back',
      desc: '',
      args: [name],
    );
  }

  /// `Enter your 4 - Digit Pin`
  String get signIn_pinCode_hint {
    return Intl.message(
      'Enter your 4 - Digit Pin',
      name: 'signIn_pinCode_hint',
      desc: '',
      args: [],
    );
  }

  /// `For the security of your account,\nplease enter the security code`
  String get signIn_pinCode_message {
    return Intl.message(
      'For the security of your account,\nplease enter the security code',
      name: 'signIn_pinCode_message',
      desc: '',
      args: [],
    );
  }

  /// `Hello! {name}`
  String dashboard_toolbar_welcome(Object name) {
    return Intl.message(
      'Hello! $name',
      name: 'dashboard_toolbar_welcome',
      desc: '',
      args: [name],
    );
  }

  /// `Book your favourite match tickets`
  String get dashboard_toolbar_welcome_message {
    return Intl.message(
      'Book your favourite match tickets',
      name: 'dashboard_toolbar_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Today's Matches`
  String get dashboard_today_matches_title {
    return Intl.message(
      'Today\'s Matches',
      name: 'dashboard_today_matches_title',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message(
      'See All',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Book Ticket`
  String get book_ticket {
    return Intl.message(
      'Book Ticket',
      name: 'book_ticket',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Matches`
  String get dashboard_upcoming_matches {
    return Intl.message(
      'Upcoming Matches',
      name: 'dashboard_upcoming_matches',
      desc: '',
      args: [],
    );
  }

  /// `Book Now!`
  String get book_now {
    return Intl.message(
      'Book Now!',
      name: 'book_now',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
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
