part of '../validation.dart';

class StringValidations {
  const StringValidations._internal();

  StringValidation email({RegExp? emailChecker}) => EmailValidation(emailChecker: emailChecker);
  PasswordValidation password({RegExp? passwordChecker}) => PasswordValidation(passwordChecker: passwordChecker);
  StringValidation custom(StringValidationLogic logic) => CustomStringValidation(logic: logic);
  StringValidation get countryCode => const CountryCodeValidation();
  StringValidation get empty => const EmptyValidation();
  StringValidation get username => const UsernameValidation();
  StringValidation get referralCode => const ReferralCodeValidation();
  StringValidation get name => const NameValidation();
  StringValidation get searchText => const SearchTextValidation();
  StringValidation get description => const DescriptionValidation();
  StringValidation get percentage => const PercentageValidation();
  StringValidation get numeric => const SingleNumericValidation();
  StringValidation get decimal => const DecimalValidation();
  StringValidation get phone => const PhoneValidation();
  StringValidation get firstName => const FirstNameValidator();
  StringValidation get lastName => const LastNameValidator();
  StringValidation get alwaysProper => const AlwaysProperValidation();
  StringValidation get none => const NoneValidation();
  StringValidation get usPhone => const USPhoneValidation();
  StringValidation get nameWithCharacterRestriction => const NameWithCharacterRestriction();
}
