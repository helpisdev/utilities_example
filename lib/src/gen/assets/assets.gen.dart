/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/.keep
  String get keep => 'assets/image/.keep';

  $AssetsImageDataGen get data => const $AssetsImageDataGen();

  /// List of all assets
  List<String> get values => [keep];
}

class $AssetsL10nGen {
  const $AssetsL10nGen();

  $AssetsL10nArbGen get arb => const $AssetsL10nArbGen();
}

class $AssetsImageDataGen {
  const $AssetsImageDataGen();

  /// File path: assets/image/data/stream1_base64_data.txt
  String get stream1Base64Data => 'assets/image/data/stream1_base64_data.txt';

  /// File path: assets/image/data/stream2_base64_data.txt
  String get stream2Base64Data => 'assets/image/data/stream2_base64_data.txt';

  /// File path: assets/image/data/stream3_base64_data.txt
  String get stream3Base64Data => 'assets/image/data/stream3_base64_data.txt';

  /// List of all assets
  List<String> get values =>
      [stream1Base64Data, stream2Base64Data, stream3Base64Data];
}

class $AssetsL10nArbGen {
  const $AssetsL10nArbGen();

  /// File path: assets/l10n/arb/app_el.arb
  String get appEl => 'assets/l10n/arb/app_el.arb';

  /// File path: assets/l10n/arb/app_en.arb
  String get appEn => 'assets/l10n/arb/app_en.arb';

  /// List of all assets
  List<String> get values => [appEl, appEn];
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsL10nGen l10n = $AssetsL10nGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
