import 'package:flutter/widgets.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Tourism App',
      'loading': 'Loading...',
      'msg_error_loading_destinatinos': 'Error loading destinations list!',
      'msg_check_internet_connection': 'Make sure you\'re connected to the Internet',
      'msg_loading_leave_types': 'Getting leaves types...',
      'msg_error_loading_type_types':
          'There is a problem fetching leave types!',
      'language': 'عربي',
      'login': 'Login',
      'retry': 'Retry',
      'apply': 'Apply',
      'home': 'Home',
      'leave_type': 'Leave type',
      'june': 'June',
      'days': 'Days',
      'hotels': 'hotels',
      'star': 'star',
      'sunday': 'Sunday',
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
    },
    'ar': {
      'title': 'تطبيق سياحة',
      'loading': 'الرجاء الإنتظار...',
      'empty': 'معلومات فارغة',
      'summary': 'التقرير',
      'login': 'دخول',
      'profile': 'الملف الشخصي',
      'msg_error_loading_destinatinos': 'مشكلة في إحضار قائمة السفرات!',
      'msg_check_internet_connection': 'الرجاء التأكد من إتصالك بالإنترنت',
      'retry': 'محاولة أخرى',
      'language': 'English',
      'home': 'الرئيسية',
      'leave_type': 'نوع الإجازة',
      'june': 'حزيران',
      'days': 'أيام',
      'star': 'نجوم',
      'hotels': 'فنادق',
      'sunday': 'الأحد',
      'monday': 'الأثنين',
      'tuesday': 'الثلاثاء',
      'wednesday': 'الأربعاء',
      'thursday': 'الخميس',
      'friday': 'الجمعة',
      'saturday': 'السبت',
    },
  };

  Map get _vocabularies => _localizedValues[locale.languageCode];

  Map get weekDays => {
        1: monday,
        2: tuesday,
        3: wednesday,
        4: thursday,
        5: friday,
        6: saturday,
        7: sunday,
      };

  String get title {
    return _vocabularies['title'];
  }

  String get username {
    return _vocabularies['username'];
  }

  String get password {
    return _vocabularies['password'];
  }

  String get language {
    return _vocabularies['language'];
  }

  String get june {
    return _vocabularies['june'];
  }

  String get days {
    return _vocabularies['days'];
  }

  String get hotels {
    return _vocabularies['hotels'];
  }

  String get star {
    return _vocabularies['star'];
  }

  String get loading {
    return _vocabularies['loading'];
  }

  String get leaveType {
    return _vocabularies['leave_type'];
  }

  String get loggedIn {
    return _vocabularies['logged_in'];
  }

  String get msgErrorFetchingChecks {
    return _vocabularies['msg_error_fetching_checks'];
  }

  String get msgCheckInternetConnection {
    return _vocabularies['msg_check_internet_connection'];
  }

  String get msgErrorFetchingLeaves {
    return _vocabularies['msg_error_fetching_leaves'];
  }

  String get msgErrorFetchingProfile {
    return _vocabularies['msg_error_fetching_profile'];
  }

  String get msgCheckLoginData {
    return _vocabularies['msg_check_login_data'];
  }

  String get checks {
    return _vocabularies['checks'];
  }

  String get profile {
    return _vocabularies['profile'];
  }

  String get summary {
    return _vocabularies['summary'];
  }

  String get dateFrom {
    return _vocabularies['date_from'];
  }

  String get dateTo {
    return _vocabularies['date_to'];
  }

  String get leaves {
    return _vocabularies['leaves'];
  }

  String get home {
    return _vocabularies['home'];
  }

  String get empty {
    return _vocabularies['empty'];
  }

  String get apply {
    return _vocabularies['apply'];
  }

  String get retry {
    return _vocabularies['retry'];
  }

  String get msgEmptyContent {
    return _vocabularies['msg_empty_content'];
  }

  String get login {
    return _vocabularies['login'];
  }

  String get msgErrorFetchingSummary {
    return _vocabularies['msg_error_fetching_summary'];
  }

  String get msgErrorPostingNewLeave {
    return _vocabularies['msg_error_posting_new_leave'];
  }

  String get leaveRequestReason {
    return _vocabularies['leave_request_reason'];
  }

  String get msgLoadingLeaveTypes {
    return _vocabularies['msg_loading_leave_types'];
  }

  String get msgErrorFetchingLeaveTypes {
    return _vocabularies['msg_error_loading_type_types'];
  }

  String get msgErrorLoadingDestinations {
    return _vocabularies['msg_error_loading_destinatinos'];
  }

  String get sunday {
    return _vocabularies['sunday'];
  }

  String get monday {
    return _vocabularies['monday'];
  }

  String get tuesday {
    return _vocabularies['tuesday'];
  }

  String get wednesday {
    return _vocabularies['wednesday'];
  }

  String get thursday {
    return _vocabularies['thursday'];
  }

  String get friday {
    return _vocabularies['friday'];
  }

  String get saturday {
    return _vocabularies['saturday'];
  }
}
