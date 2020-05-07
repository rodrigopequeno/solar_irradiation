import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Class responsible for displaying the logo in different ways on
/// mobile devices and browsers
/// Note: Used because the package [flutter_svg](https://pub.dev/packages/flutter_svg)
/// does not support the web.
class LogoWidget extends StatelessWidget {
  //ignore: public_member_api_docs
  final double width;
  //ignore: public_member_api_docs
  final double height;
  //ignore: public_member_api_docs
  const LogoWidget({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetName = "assets/images/logo${(kIsWeb ? ".png" : ".svg")}";
    if (kIsWeb) {
      return Image.asset(
        assetName,
        semanticLabel: 'logo',
        alignment: Alignment.center,
        height: height,
        width: width,
      );
    }

    return SvgPicture.asset(
      assetName,
      semanticsLabel: 'Logo',
      alignment: Alignment.center,
      height: height,
      width: width,
      placeholderBuilder: (context) => Container(
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator()),
    );
  }
}
