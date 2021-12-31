import 'package:flutter/material.dart';
import 'package:sea_sell_crypto/shared/theme.dart';

class AvatarCreator extends StatefulWidget {
  const AvatarCreator({
    Key? key,
    this.imageUrl,
    this.isWatch = false,
  }) : super(key: key);

  /// variabel image url
  final String? imageUrl;

  /// variabel untuk menentukan warna diluar avatar
  final bool isWatch;

  @override
  State<AvatarCreator> createState() => _AvatarCreatorState();
}

class _AvatarCreatorState extends State<AvatarCreator> {
  late bool _isWatch;
  late final BoxDecoration _lightgrayDecoration;
  late final BoxDecoration _gradientDecoration;

  @override
  void initState() {
    _isWatch = widget.isWatch;

    _lightgrayDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: lightGrayColor,
    );

    _gradientDecoration = BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        colors: [
          purpleColor,
          pinkColor,
        ],
      ),
    );

    super.initState();
  }

  void onTap() => setState(() {
        if (_isWatch == false) _isWatch = true;
        // _isWatch = !_isWatch;
      });

  @override
  Widget build(BuildContext context) {
    // return CircleAvatar(
    //   radius: 30,
    //   backgroundColor: grayColor,
    //   child: CircleAvatar(
    //     radius: 27.5,
    //     backgroundColor: grayColor,
    //     child: CircleAvatar(
    //       radius: 22.5,
    //       backgroundImage: AssetImage(
    //         imageUrl!,
    //       ),
    //     ),
    //   ),
    // );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55,
        height: 55,
        decoration: !_isWatch ? _gradientDecoration : _lightgrayDecoration,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                widget.imageUrl!,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
