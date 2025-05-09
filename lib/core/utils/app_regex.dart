class AppRegex {
  static final RegExp numberOnlyFilter = RegExp(r'[\d]');
  static final RegExp decimalFilter = RegExp(r'[\d.]');
  static final RegExp alphabetOnlyFilter = RegExp(r'[a-zA-Z]');
  static final RegExp alphabetSpaceFilter = RegExp(r'[a-zA-Z ]');
  static final RegExp spaceFilter = RegExp(r'[ ]');
  static final RegExp sentenceFilter = RegExp(r'[a-zA-Z .]');
  static final RegExp dateOnlyFilter = RegExp(r'[\d\/]');
  static final alphaNumeric = RegExp(r'^[a-zA-Z0-9]+$');
  static final RegExp onlyAlphaNumeric = RegExp(r'^[a-zA-Z0-9]*');
  static final RegExp alphaNumaricWithSomeSpecialSymbol =
      RegExp(r"[a-zA-Z0-9\u0020\u005F\u0027\u002D\u002E]");

  ///Underscores, hyphens, and periods should be allowed in Usernames for the Creator Exchange.
  ///But only 1 of each in the entire Username.
  static final RegExp userName =
      RegExp(r"^(?!.*[_].*[_])(?!.*[-].*[-])(?!.*[.].*[.])[a-zA-Z0-9_.-]+$");

  // Inverse
  static final RegExp inverseNumberOnlyFilter = RegExp(r'[^\d]');
  static final RegExp inverseDecimalFilter = RegExp(r'[^\d.]');
  static final RegExp inverseAlphabetOnlyFilter = RegExp(r'[^a-zA-Z]');
  static final RegExp inverseAlphabetSpaceFilter = RegExp(r'[^a-zA-Z ]');
  static final RegExp invserSentenceFilter = RegExp(r'[^a-zA-Z .]');
  static final RegExp inverseDateOnlyFilter = RegExp(r'[^\d\/]');
  static final RegExp checkNull = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');

  // Whole Matches Only
  static final RegExp email =
      RegExp(r'^\w+(?:[.-]?\w+)*@\w+(?:[.-]?\w+)*(?:\.\w{2,3})+$');
  static final RegExp password =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  static RegExp passwordWithSpecialChar =
      RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{12,}$');
  static RegExp usPhoneFormatChars = RegExp(r'[\(\)\-\s]');
  static RegExp zeroPlus = RegExp(r'^0+');
  static RegExp digitOrBracket = RegExp(r'[\d\(]');
}
