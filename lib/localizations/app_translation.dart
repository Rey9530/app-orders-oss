import 'zh_cn.dart';

import 'ar_sa.dart';
import 'de_de.dart';
import 'en_us.dart';

import 'fr_fr.dart';
import 'hi_in.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": enUS,
    "hi": hiIN,
    "ar": arSA,
    "de": deDE,
    "fr": frFR,
    "zh": zhCN
  };
}
