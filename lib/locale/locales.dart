import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';

import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'sw': swahili(),
  };

  String get continueText {
    return _localizedValues[locale.languageCode]['continueText'];
  }

  String get others {
    return _localizedValues[locale.languageCode]['others'];
  }

  String get saveAddress {
    return _localizedValues[locale.languageCode]['saveAddress'];
  }

  String get writeaddressLandmark {
    return _localizedValues[locale.languageCode]['writeaddressLandmark'];
  }

  String get addLandmark {
    return _localizedValues[locale.languageCode]['addLandmark'];
  }

  String get onwards {
    return _localizedValues[locale.languageCode]['onwards'];
  }

  String get signInNow {
    return _localizedValues[locale.languageCode]['signInNow'];
  }

  String get recentSearches {
    return _localizedValues[locale.languageCode]['recentSearches'];
  }

  String get wallPainting {
    return _localizedValues[locale.languageCode]['wallPainting'];
  }

  String get plantation {
    return _localizedValues[locale.languageCode]['plantation'];
  }

  String get plumbing {
    return _localizedValues[locale.languageCode]['plumbing'];
  }

  String get howCanWeHelpYou {
    return _localizedValues[locale.languageCode]['howCanWeHelpYou'];
  }

  String get phoneNumber {
    return _localizedValues[locale.languageCode]['phoneNumber'];
  }

  String get enterPhoneNumber {
    return _localizedValues[locale.languageCode]['enterPhoneNumber'];
  }

  String get continueWord {
    return _localizedValues[locale.languageCode]['continueWord'];
  }

  String get orContinueWith {
    return _localizedValues[locale.languageCode]['orContinueWith'];
  }

  String get facebook {
    return _localizedValues[locale.languageCode]['facebook'];
  }

  String get google {
    return _localizedValues[locale.languageCode]['google'];
  }

  String get register {
    return _localizedValues[locale.languageCode]['register'];
  }

  String get inLessThanAMinute {
    return _localizedValues[locale.languageCode]['inLessThanAMinute'];
  }

  String get fullName {
    return _localizedValues[locale.languageCode]['fullName'];
  }

  String get enterFullName {
    return _localizedValues[locale.languageCode]['enterFullName'];
  }

  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }

  String get enterEmailAddress {
    return _localizedValues[locale.languageCode]['enterEmailAddress'];
  }

  String get weWillSendVerificationCode {
    return _localizedValues[locale.languageCode]['weWillSendVerificationCode'];
  }

  String get verification {
    return _localizedValues[locale.languageCode]['verification'];
  }

  String get weHaveSent6DigitVerificationCode {
    return _localizedValues[locale.languageCode]
        ['weHaveSent6DigitVerificationCode'];
  }

  String get enterCode {
    return _localizedValues[locale.languageCode]['enterCode'];
  }

  String get enter6DigitCode {
    return _localizedValues[locale.languageCode]['enter6DigitCode'];
  }

  String get getStarted {
    return _localizedValues[locale.languageCode]['getStarted'];
  }

  String get searchService {
    return _localizedValues[locale.languageCode]['searchService'];
  }

  String get popularServices {
    return _localizedValues[locale.languageCode]['popularServices'];
  }

  String get homeClean {
    return _localizedValues[locale.languageCode]['homeClean'];
  }

  String get electrician {
    return _localizedValues[locale.languageCode]['electrician'];
  }

  String get gardening {
    return _localizedValues[locale.languageCode]['gardening'];
  }

  String get carpenter {
    return _localizedValues[locale.languageCode]['carpenter'];
  }

  String get painter {
    return _localizedValues[locale.languageCode]['painter'];
  }

  String get plumber {
    return _localizedValues[locale.languageCode]['plumber'];
  }

  String get movers {
    return _localizedValues[locale.languageCode]['movers'];
  }

  String get hairAndBeauty {
    return _localizedValues[locale.languageCode]['hairAndBeauty'];
  }

  String get homeSanitize {
    return _localizedValues[locale.languageCode]['homeSanitize'];
  }

  String get home {
    return _localizedValues[locale.languageCode]['home'];
  }

  String get booking {
    return _localizedValues[locale.languageCode]['booking'];
  }

  String get carpetShampooing {
    return _localizedValues[locale.languageCode]['carpetShampooing'];
  }

  String get sofaShampooing {
    return _localizedValues[locale.languageCode]['sofaShampooing'];
  }

  String get bedroomDeepCleaning {
    return _localizedValues[locale.languageCode]['bedroomDeepCleaning'];
  }

  String get fullHomeDeepCleaning {
    return _localizedValues[locale.languageCode]['fullHomeDeepCleaning'];
  }

  String get aquariumCleaning {
    return _localizedValues[locale.languageCode]['aquariumCleaning'];
  }

  String get toiletCleaning {
    return _localizedValues[locale.languageCode]['toiletCleaning'];
  }

  String get floorScrubbingAndPolishing {
    return _localizedValues[locale.languageCode]['floorScrubbingAndPolishing'];
  }

  String get serviceRequest {
    return _localizedValues[locale.languageCode]['serviceRequest'];
  }

  String get letUsKnowTheProblem {
    return _localizedValues[locale.languageCode]['letUsKnowTheProblem'];
  }

  String get skip {
    return _localizedValues[locale.languageCode]['skip'];
  }

  String get describeWhatProblemFacing {
    return _localizedValues[locale.languageCode]['describeWhatProblemFacing'];
  }

  String get writeShortDescription {
    return _localizedValues[locale.languageCode]['writeShortDescription'];
  }

  String get shareYourExperience {
    return _localizedValues[locale.languageCode]['shareYourExperience'];
  }

  String get optional {
    return _localizedValues[locale.languageCode]['optional'];
  }

  String get findProvider {
    return _localizedValues[locale.languageCode]['findProvider'];
  }

  String get chats {
    return _localizedValues[locale.languageCode]['chats'];
  }

  String get availableBalance {
    return _localizedValues[locale.languageCode]['availableBalance'];
  }

  String get addMoney {
    return _localizedValues[locale.languageCode]['addMoney'];
  }

  String get sentToBank {
    return _localizedValues[locale.languageCode]['sentToBank'];
  }

  String get connect {
    return _localizedValues[locale.languageCode]['connect'];
  }

  String get addedToWallet {
    return _localizedValues[locale.languageCode]['addedToWallet'];
  }

  String get laptopRepair {
    return _localizedValues[locale.languageCode]['laptopRepair'];
  }

  String get job {
    return _localizedValues[locale.languageCode]['job'];
  }

  String get rat {
    return _localizedValues[locale.languageCode]['rat'];
  }

  String get bodyMassage {
    return _localizedValues[locale.languageCode]['bodyMassage'];
  }

  String get cleaner {
    return _localizedValues[locale.languageCode]['cleaner'];
  }

  String get jobs {
    return _localizedValues[locale.languageCode]['jobs'];
  }

  String get rate {
    return _localizedValues[locale.languageCode]['rate'];
  }

  String get rating {
    return _localizedValues[locale.languageCode]['rating'];
  }

  String get sortAndFilters {
    return _localizedValues[locale.languageCode]['sortAndFilters'];
  }

  String get sortBy {
    return _localizedValues[locale.languageCode]['sortBy'];
  }

  String get top {
    return _localizedValues[locale.languageCode]['top'];
  }

  String get latestReviews {
    return _localizedValues[locale.languageCode]['latestReviews'];
  }

  String get logout {
    return _localizedValues[locale.languageCode]['logout'];
  }

  String get everythingAboutYou {
    return _localizedValues[locale.languageCode]['everythingAboutYou'];
  }

  String get myProfile {
    return _localizedValues[locale.languageCode]['myProfile'];
  }

  String get reset {
    return _localizedValues[locale.languageCode]['reset'];
  }

  String get priceRange {
    return _localizedValues[locale.languageCode]['priceRange'];
  }

  String get gender {
    return _localizedValues[locale.languageCode]['gender'];
  }

  String get male {
    return _localizedValues[locale.languageCode]['male'];
  }

  String get female {
    return _localizedValues[locale.languageCode]['female'];
  }

  String get any {
    return _localizedValues[locale.languageCode]['any'];
  }

  String get apply {
    return _localizedValues[locale.languageCode]['apply'];
  }

  String get workPortfolio {
    return _localizedValues[locale.languageCode]['workPortfolio'];
  }

  String get hireRequest {
    return _localizedValues[locale.languageCode]['hireRequest'];
  }

  String get task {
    return _localizedValues[locale.languageCode]['task'];
  }

  String get carpetCleaning {
    return _localizedValues[locale.languageCode]['carpetCleaning'];
  }

  String get address {
    return _localizedValues[locale.languageCode]['address'];
  }

  String get description {
    return _localizedValues[locale.languageCode]['description'];
  }

  String get bookingDate {
    return _localizedValues[locale.languageCode]['bookingDate'];
  }

  String get bookingTime {
    return _localizedValues[locale.languageCode]['bookingTime'];
  }

  String get confirmBooking {
    return _localizedValues[locale.languageCode]['confirmBooking'];
  }

  String get selectDate {
    return _localizedValues[locale.languageCode]['selectDate'];
  }

  String get availableTimings {
    return _localizedValues[locale.languageCode]['availableTimings'];
  }

  String get cont {
    return _localizedValues[locale.languageCode]['cont'];
  }

  String get congratulations {
    return _localizedValues[locale.languageCode]['congratulations'];
  }

  String get bookingRequestSent {
    return _localizedValues[locale.languageCode]['bookingRequestSent'];
  }

  String get myBookings {
    return _localizedValues[locale.languageCode]['myBookings'];
  }

  String get upcoming {
    return _localizedValues[locale.languageCode]['upcoming'];
  }

  String get cancelled {
    return _localizedValues[locale.languageCode]['cancelled'];
  }

  String get completed {
    return _localizedValues[locale.languageCode]['completed'];
  }

  String get pending {
    return _localizedValues[locale.languageCode]['pending'];
  }

  String get rated {
    return _localizedValues[locale.languageCode]['rated'];
  }

  String get callNow {
    return _localizedValues[locale.languageCode]['callNow'];
  }

  String get message {
    return _localizedValues[locale.languageCode]['message'];
  }

  String get bookingStatus {
    return _localizedValues[locale.languageCode]['bookingStatus'];
  }

  String get requestedOn {
    return _localizedValues[locale.languageCode]['requestedOn'];
  }

  String get bookingConfirmed {
    return _localizedValues[locale.languageCode]['bookingConfirmed'];
  }

  String get usuallyConfirmsIn {
    return _localizedValues[locale.languageCode]['usuallyConfirmsIn'];
  }

  String get startAJob {
    return _localizedValues[locale.languageCode]['startAJob'];
  }

  String get scheduleOn {
    return _localizedValues[locale.languageCode]['scheduleOn'];
  }

  String get amountToPay {
    return _localizedValues[locale.languageCode]['amountToPay'];
  }

  String get confirmedOn {
    return _localizedValues[locale.languageCode]['confirmedOn'];
  }

  String get startedSince {
    return _localizedValues[locale.languageCode]['startedSince'];
  }

  String get paymentInfoWillAppearHere {
    return _localizedValues[locale.languageCode]['paymentInfoWillAppearHere'];
  }

  String get proceedToPay {
    return _localizedValues[locale.languageCode]['proceedToPay'];
  }

  String get amountPaid {
    return _localizedValues[locale.languageCode]['amountPaid'];
  }

  String get jobCompleted {
    return _localizedValues[locale.languageCode]['jobCompleted'];
  }

  String get workRatings {
    return _localizedValues[locale.languageCode]['workRatings'];
  }

  String get addPhotos {
    return _localizedValues[locale.languageCode]['addPhotos'];
  }

  String get yourFeedback {
    return _localizedValues[locale.languageCode]['yourFeedback'];
  }

  String get howWasYourExperience {
    return _localizedValues[locale.languageCode]['howWasYourExperience'];
  }

  String get submitAndPay {
    return _localizedValues[locale.languageCode]['submitAndPay'];
  }

  String get reviewHasBeenSubmitted {
    return _localizedValues[locale.languageCode]['reviewHasBeenSubmitted'];
  }

  String get paymentDone {
    return _localizedValues[locale.languageCode]['paymentDone'];
  }

  String get liveChat {
    return _localizedValues[locale.languageCode]['liveChat'];
  }

  String get archive {
    return _localizedValues[locale.languageCode]['archive'];
  }

  String get noWorriesMamIWillDoIt {
    return _localizedValues[locale.languageCode]['noWorriesMamIWillDoIt'];
  }

  String get writeYourMessage {
    return _localizedValues[locale.languageCode]['writeYourMessage'];
  }

  String get helloMam {
    return _localizedValues[locale.languageCode]['helloMam'];
  }

  String get howCanIHelpYou {
    return _localizedValues[locale.languageCode]['howCanIHelpYou'];
  }

  String get iWantToCleanMyCarpet {
    return _localizedValues[locale.languageCode]['iWantToCleanMyCarpet'];
  }

  String get canYouWashIt {
    return _localizedValues[locale.languageCode]['canYouWashIt'];
  }

  String get sureMam {
    return _localizedValues[locale.languageCode]['sureMam'];
  }

  String get wallet {
    return _localizedValues[locale.languageCode]['wallet'];
  }

  String get quickPayments {
    return _localizedValues[locale.languageCode]['quickPayments'];
  }

  String get manageAddress {
    return _localizedValues[locale.languageCode]['manageAddress'];
  }

  String get preSavedAddresses {
    return _localizedValues[locale.languageCode]['preSavedAddresses'];
  }

  String get support {
    return _localizedValues[locale.languageCode]['support'];
  }

  String get connectUs {
    return _localizedValues[locale.languageCode]['connectUs'];
  }

  String get privacyPolicy {
    return _localizedValues[locale.languageCode]['privacyPolicy'];
  }

  String get knowOurPrivacyPolicies {
    return _localizedValues[locale.languageCode]['knowOurPrivacyPolicies'];
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]['changeLanguage'];
  }

  String get setYourPreferredLanguage {
    return _localizedValues[locale.languageCode]['setYourPreferredLanguage'];
  }

  String get faqs {
    return _localizedValues[locale.languageCode]['faqs'];
  }

  String get getYourQuestionsAnswered {
    return _localizedValues[locale.languageCode]['getYourQuestionsAnswered'];
  }

  String get addNewAddress {
    return _localizedValues[locale.languageCode]['addNewAddress'];
  }

  String get office {
    return _localizedValues[locale.languageCode]['office'];
  }

  String get location {
    return _localizedValues[locale.languageCode]['location'];
  }

  String get callUs {
    return _localizedValues[locale.languageCode]['callUs'];
  }

  String get mailUs {
    return _localizedValues[locale.languageCode]['mailUs'];
  }

  String get writeUs {
    return _localizedValues[locale.languageCode]['writeUs'];
  }

  String get letUsKnowYourQuery {
    return _localizedValues[locale.languageCode]['letUsKnowYourQuery'];
  }

  String get phoneNumberOrEmail {
    return _localizedValues[locale.languageCode]['phoneNumberOrEmail'];
  }

  String get addContactInfo {
    return _localizedValues[locale.languageCode]['addContactInfo'];
  }

  String get addYourIssueOrFeedback {
    return _localizedValues[locale.languageCode]['addYourIssueOrFeedback'];
  }

  String get submit {
    return _localizedValues[locale.languageCode]['submit'];
  }

  String get howWeWork {
    return _localizedValues[locale.languageCode]['howWeWork'];
  }

  String get termsOfUse {
    return _localizedValues[locale.languageCode]['termsOfUse'];
  }

  String get language {
    return _localizedValues[locale.languageCode]['language'];
  }

  String get preferredLanguage {
    return _localizedValues[locale.languageCode]['preferredLanguage'];
  }

  String get selectPreferredLanguage {
    return _localizedValues[locale.languageCode]['selectPreferredLanguage'];
  }

  String get eng {
    return _localizedValues[locale.languageCode]['eng'];
  }

  String get arabicc {
    return _localizedValues[locale.languageCode]['arabicc'];
  }

  String get frenchh {
    return _localizedValues[locale.languageCode]['frenchh'];
  }

  String get portuguesee {
    return _localizedValues[locale.languageCode]['portuguesee'];
  }

  String get indonesiann {
    return _localizedValues[locale.languageCode]['indonesiann'];
  }

  String get spanishh {
    return _localizedValues[locale.languageCode]['spanishh'];
  }



  String get howToBookAProvider {
    return _localizedValues[locale.languageCode]['howToBookAProvider'];
  }

  String get howToReviewAProvider {
    return _localizedValues[locale.languageCode]['howToReviewAProvider'];
  }

  String get howToPayToAProvider {
    return _localizedValues[locale.languageCode]['howToPayToAProvider'];
  }

  String get howToAddMoneyInWallet {
    return _localizedValues[locale.languageCode]['howToAddMoneyInWallet'];
  }

  String get canIRescheduleBooking {
    return _localizedValues[locale.languageCode]['canIRescheduleBooking'];
  }

  String get howToCancelBooking {
    return _localizedValues[locale.languageCode]['howToCancelBooking'];
  }

  String get howToChangeLanguage {
    return _localizedValues[locale.languageCode]['howToChangeLanguage'];
  }

  String get howToLogoutMyAccount {
    return _localizedValues[locale.languageCode]['howToLogoutMyAccount'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'id', 'pt', 'ar', 'fr', 'es','tr','it','sw'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
