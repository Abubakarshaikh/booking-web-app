// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Hello! ${name}";

  static String m1(name) => "Welcome back, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account": MessageLookupByLibrary.simpleMessage("Account"),
        "book_now": MessageLookupByLibrary.simpleMessage("Book Now!"),
        "book_ticket": MessageLookupByLibrary.simpleMessage("Book Ticket"),
        "dashboard_today_matches_title":
            MessageLookupByLibrary.simpleMessage("Today\'s Matches"),
        "dashboard_toolbar_welcome": m0,
        "dashboard_toolbar_welcome_message":
            MessageLookupByLibrary.simpleMessage(
                "Book your favourite match tickets"),
        "dashboard_upcoming_matches":
            MessageLookupByLibrary.simpleMessage("Upcoming Matches"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "see_all": MessageLookupByLibrary.simpleMessage("See All"),
        "signIn_pinCode_hint":
            MessageLookupByLibrary.simpleMessage("Enter your 4 - Digit Pin"),
        "signIn_pinCode_message": MessageLookupByLibrary.simpleMessage(
            "For the security of your account,\nplease enter the security code"),
        "tickets": MessageLookupByLibrary.simpleMessage("Tickets"),
        "welcome_back": m1
      };
}
