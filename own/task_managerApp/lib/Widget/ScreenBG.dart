import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/assets_path.dart';

class ScreenBG extends StatelessWidget {
  final Widget child;
  const ScreenBG({
    super.key,required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetsPath.backgroungSVG),
        Center(child: child),

      ],
    );
  }
}
