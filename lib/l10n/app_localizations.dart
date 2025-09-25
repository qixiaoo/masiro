import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK', scriptCode: 'Hant'),
    Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW', scriptCode: 'Hant')
  ];

  /// No description provided for @home.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get home;

  /// No description provided for @favorites.
  ///
  /// In zh, this message translates to:
  /// **'收藏'**
  String get favorites;

  /// No description provided for @settings.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get settings;

  /// No description provided for @more.
  ///
  /// In zh, this message translates to:
  /// **'更多'**
  String get more;

  /// No description provided for @showWindow.
  ///
  /// In zh, this message translates to:
  /// **'显示窗口'**
  String get showWindow;

  /// No description provided for @hideWindow.
  ///
  /// In zh, this message translates to:
  /// **'隐藏窗口'**
  String get hideWindow;

  /// No description provided for @exit.
  ///
  /// In zh, this message translates to:
  /// **'退出'**
  String get exit;

  /// No description provided for @login.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get login;

  /// No description provided for @mobilePhoneLoginTip.
  ///
  /// In zh, this message translates to:
  /// **'请在网页中登录，登录成功后点击右上角按钮关闭当前页面'**
  String get mobilePhoneLoginTip;

  /// No description provided for @desktopLoginTip.
  ///
  /// In zh, this message translates to:
  /// **'点击下面按钮将打开本地安装的 Chrome 或 Chromium 浏览器，请手动输入帐号密码进行登录，本软件在检测到登录成功后会自动关闭浏览器'**
  String get desktopLoginTip;

  /// No description provided for @chromePath.
  ///
  /// In zh, this message translates to:
  /// **'Chrome 或 Chromium 安装位置:'**
  String get chromePath;

  /// No description provided for @chromeNotFound.
  ///
  /// In zh, this message translates to:
  /// **'未检测到 Chrome 或 Chromium 浏览器'**
  String get chromeNotFound;

  /// No description provided for @author.
  ///
  /// In zh, this message translates to:
  /// **'作者'**
  String get author;

  /// No description provided for @translator.
  ///
  /// In zh, this message translates to:
  /// **'翻译'**
  String get translator;

  /// No description provided for @status.
  ///
  /// In zh, this message translates to:
  /// **'状态'**
  String get status;

  /// No description provided for @originalBook.
  ///
  /// In zh, this message translates to:
  /// **'原作'**
  String get originalBook;

  /// No description provided for @lastUpdated.
  ///
  /// In zh, this message translates to:
  /// **'最近更新'**
  String get lastUpdated;

  /// No description provided for @brief.
  ///
  /// In zh, this message translates to:
  /// **'简介'**
  String get brief;

  /// No description provided for @errorTip.
  ///
  /// In zh, this message translates to:
  /// **'出错啦~'**
  String get errorTip;

  /// No description provided for @previousPage.
  ///
  /// In zh, this message translates to:
  /// **'上一页'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In zh, this message translates to:
  /// **'下一页'**
  String get nextPage;

  /// No description provided for @menu.
  ///
  /// In zh, this message translates to:
  /// **'菜单'**
  String get menu;

  /// No description provided for @detail.
  ///
  /// In zh, this message translates to:
  /// **'详情'**
  String get detail;

  /// No description provided for @noContentMessage.
  ///
  /// In zh, this message translates to:
  /// **'- 空空如也 -'**
  String get noContentMessage;

  /// No description provided for @noMoreContentTip.
  ///
  /// In zh, this message translates to:
  /// **'没有更多啦~'**
  String get noMoreContentTip;

  /// No description provided for @levelLimitMessage.
  ///
  /// In zh, this message translates to:
  /// **'等级 {level} 以上用户才能访问'**
  String levelLimitMessage(Object level);

  /// No description provided for @levelLimitAndCostMessage.
  ///
  /// In zh, this message translates to:
  /// **'等级 {level} 以上用户才能访问，将消耗 {cost}G'**
  String levelLimitAndCostMessage(Object cost, Object level);

  /// No description provided for @easyRefreshDragText.
  ///
  /// In zh, this message translates to:
  /// **'下拉刷新'**
  String get easyRefreshDragText;

  /// No description provided for @easyRefreshArmedText.
  ///
  /// In zh, this message translates to:
  /// **'松开刷新'**
  String get easyRefreshArmedText;

  /// No description provided for @easyRefreshReadyText.
  ///
  /// In zh, this message translates to:
  /// **'刷新中...'**
  String get easyRefreshReadyText;

  /// No description provided for @easyRefreshProcessingText.
  ///
  /// In zh, this message translates to:
  /// **'刷新中...'**
  String get easyRefreshProcessingText;

  /// No description provided for @easyRefreshProcessedText.
  ///
  /// In zh, this message translates to:
  /// **'刷新成功'**
  String get easyRefreshProcessedText;

  /// No description provided for @easyRefreshNoMoreText.
  ///
  /// In zh, this message translates to:
  /// **'没有更多了'**
  String get easyRefreshNoMoreText;

  /// No description provided for @easyRefreshFailedText.
  ///
  /// In zh, this message translates to:
  /// **'刷新失败'**
  String get easyRefreshFailedText;

  /// No description provided for @easyRefreshMessageText.
  ///
  /// In zh, this message translates to:
  /// **'上次刷新时间: %T'**
  String get easyRefreshMessageText;

  /// No description provided for @easyRefreshFooterDragText.
  ///
  /// In zh, this message translates to:
  /// **'上拉加载更多'**
  String get easyRefreshFooterDragText;

  /// No description provided for @easyRefreshFooterArmedText.
  ///
  /// In zh, this message translates to:
  /// **'松开加载更多'**
  String get easyRefreshFooterArmedText;

  /// No description provided for @easyRefreshFooterReadyText.
  ///
  /// In zh, this message translates to:
  /// **'加载中...'**
  String get easyRefreshFooterReadyText;

  /// No description provided for @easyRefreshFooterProcessingText.
  ///
  /// In zh, this message translates to:
  /// **'加载中...'**
  String get easyRefreshFooterProcessingText;

  /// No description provided for @easyRefreshFooterProcessedText.
  ///
  /// In zh, this message translates to:
  /// **'加载成功'**
  String get easyRefreshFooterProcessedText;

  /// No description provided for @easyRefreshFooterNoMoreText.
  ///
  /// In zh, this message translates to:
  /// **'没有更多了'**
  String get easyRefreshFooterNoMoreText;

  /// No description provided for @easyRefreshFooterFailedText.
  ///
  /// In zh, this message translates to:
  /// **'加载失败'**
  String get easyRefreshFooterFailedText;

  /// No description provided for @easyRefreshFooterMessageText.
  ///
  /// In zh, this message translates to:
  /// **'上次加载时间: %T'**
  String get easyRefreshFooterMessageText;

  /// No description provided for @startReading.
  ///
  /// In zh, this message translates to:
  /// **'开始阅读'**
  String get startReading;

  /// No description provided for @costMessage.
  ///
  /// In zh, this message translates to:
  /// **'购买当前章节将消耗 {cost}G'**
  String costMessage(Object cost);

  /// No description provided for @pay.
  ///
  /// In zh, this message translates to:
  /// **'支付'**
  String get pay;

  /// No description provided for @isPaying.
  ///
  /// In zh, this message translates to:
  /// **'支付中...'**
  String get isPaying;

  /// No description provided for @coin.
  ///
  /// In zh, this message translates to:
  /// **'金币'**
  String get coin;

  /// No description provided for @fan.
  ///
  /// In zh, this message translates to:
  /// **'粉丝'**
  String get fan;

  /// No description provided for @id.
  ///
  /// In zh, this message translates to:
  /// **'ID'**
  String get id;

  /// No description provided for @signIn.
  ///
  /// In zh, this message translates to:
  /// **'签到'**
  String get signIn;

  /// No description provided for @hasSignedIn.
  ///
  /// In zh, this message translates to:
  /// **'已签到'**
  String get hasSignedIn;

  /// No description provided for @license.
  ///
  /// In zh, this message translates to:
  /// **'开源协议'**
  String get license;

  /// No description provided for @close.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get close;

  /// No description provided for @cancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In zh, this message translates to:
  /// **'确认'**
  String get confirm;

  /// No description provided for @themeMode.
  ///
  /// In zh, this message translates to:
  /// **'主题模式'**
  String get themeMode;

  /// No description provided for @lightMode.
  ///
  /// In zh, this message translates to:
  /// **'日间模式'**
  String get lightMode;

  /// No description provided for @dartMode.
  ///
  /// In zh, this message translates to:
  /// **'夜间模式'**
  String get dartMode;

  /// No description provided for @systemMode.
  ///
  /// In zh, this message translates to:
  /// **'跟随系统'**
  String get systemMode;

  /// No description provided for @themeColor.
  ///
  /// In zh, this message translates to:
  /// **'主题颜色'**
  String get themeColor;

  /// No description provided for @primaryColor.
  ///
  /// In zh, this message translates to:
  /// **'主色调'**
  String get primaryColor;

  /// No description provided for @wheelColor.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get wheelColor;

  /// No description provided for @reset.
  ///
  /// In zh, this message translates to:
  /// **'重置'**
  String get reset;

  /// No description provided for @collapse.
  ///
  /// In zh, this message translates to:
  /// **'折叠'**
  String get collapse;

  /// No description provided for @expand.
  ///
  /// In zh, this message translates to:
  /// **'展开'**
  String get expand;

  /// No description provided for @logout.
  ///
  /// In zh, this message translates to:
  /// **'登出'**
  String get logout;

  /// No description provided for @logoutPrompt.
  ///
  /// In zh, this message translates to:
  /// **'将清除本地存储的数据，包括但不限于登录信息和历史记录，确定要退出登录吗?'**
  String get logoutPrompt;

  /// No description provided for @about.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get about;

  /// No description provided for @currentVersion.
  ///
  /// In zh, this message translates to:
  /// **'当前版本'**
  String get currentVersion;

  /// No description provided for @projectHomepage.
  ///
  /// In zh, this message translates to:
  /// **'项目主页'**
  String get projectHomepage;

  /// No description provided for @websiteHomepage.
  ///
  /// In zh, this message translates to:
  /// **'网站主页'**
  String get websiteHomepage;

  /// No description provided for @copied.
  ///
  /// In zh, this message translates to:
  /// **'已复制'**
  String get copied;

  /// No description provided for @fontSize.
  ///
  /// In zh, this message translates to:
  /// **'字体大小'**
  String get fontSize;

  /// No description provided for @switchAccounts.
  ///
  /// In zh, this message translates to:
  /// **'切换账号'**
  String get switchAccounts;

  /// No description provided for @addAnAccount.
  ///
  /// In zh, this message translates to:
  /// **'添加账号'**
  String get addAnAccount;

  /// No description provided for @novelComments.
  ///
  /// In zh, this message translates to:
  /// **'小说评论'**
  String get novelComments;

  /// No description provided for @chapterComments.
  ///
  /// In zh, this message translates to:
  /// **'章节评论'**
  String get chapterComments;

  /// No description provided for @reply.
  ///
  /// In zh, this message translates to:
  /// **'回复'**
  String get reply;

  /// No description provided for @viewMoreReplies.
  ///
  /// In zh, this message translates to:
  /// **'查看更多回复 ({count})'**
  String viewMoreReplies(Object count);

  /// No description provided for @jumpTo.
  ///
  /// In zh, this message translates to:
  /// **'跳转到'**
  String get jumpTo;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
    // Lookup logic when language+script+country codes are specified.
  switch (locale.toString()) {
    case 'zh_Hant_HK': return AppLocalizationsZhHantHk();
        case 'zh_Hant_TW': return AppLocalizationsZhHantTw();
  }


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
