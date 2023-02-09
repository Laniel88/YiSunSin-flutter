// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

class FlutterLicense extends LicenseEntry {
  @override
  final packages;
  @override
  final paragraphs;

  FlutterLicense(this.packages, this.paragraphs);
}

Stream<LicenseEntry> licenses() async* {
  yield FlutterLicense([
    'LINE Seed Font'
  ], [
    const LicenseParagraph(
        'LINE Seed Licensing'
        '\n\nAll content of LINE Seed is copyrighted material owned by LINE Corp.'
        '\nAll fonts are released under the SIL Open Font License, Version1.1.'
        '\nThis license is also available with a FAQ at: https://scripts.sil.org/OFL'
        '\n\nYou can use them for any personal or commercial purposes.'
        '\nHowever, the software font files themselves cannot be sold by the other parties other than LINE Corp.'
        '\nFor commercial use, we highly recommend to include attribution in product or service.'
        '\n\nThis isn\'t legal advice, please consider consulting a lawyer and see the full license for all details.',
        0)
  ]);

  // yield FlutterLicense([
  //   '강원교육서체 Font'
  // ], [
  //   const LicenseParagraph(
  //       '강원교육서체 저작권 안내'
  //       '\n\n강원교육서체는 누구나 무료로 다운로드 받아 자유롭게 사용 가능합니다.(출처 표기 권장) '
  //       '\n영상매체, 인쇄매체, 웹, 모바일 CI, BI, 판매용 저작물 등 다양한 매체에 자유롭게 사용이 가능하며, 특별한 허가절차 없이 사용할 수 있습니다. '
  //       '\n다만, 강원교육 서체를 유료로 양도하거나 판매하는 등 상업적 행위는 금지하고 있습니다.',
  //       0)
  // ]);

  yield FlutterLicense([
    'Flaticon icons'
  ], [
    const LicenseParagraph(
        '\nCoin icons created by Freepik - Flaticon - https://www.flaticon.com/free-icons/coin'
        '\nSettings icons created by Freepik - Flaticon - https://www.flaticon.com/free-icons/settings'
        '\nInformation icons created by Freepik - Flaticon - https://www.flaticon.com/free-icons/information',
        0)
  ]);
}

void addLicenses() {
  LicenseRegistry.addLicense(licenses);
}
