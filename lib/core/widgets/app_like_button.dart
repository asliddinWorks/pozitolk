
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/core/extension/context_extension.dart';

import '../../constants/app_icons.dart';

class AppLikeButton extends StatefulWidget {
  const AppLikeButton({super.key,
    required this.onTap,
    this.initialValue = false, 
    this.margin, this.color,

  });

  final void Function(bool value) onTap;
  final bool? initialValue;
  final EdgeInsets? margin;
  final Color ? color;

  @override
  State<AppLikeButton> createState() => _AppLikeButtonState();
}

class _AppLikeButtonState extends State<AppLikeButton> {

  late bool initialValue;

  @override
  void initState() {
    initialValue = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        initialValue = !initialValue;
        widget.onTap(initialValue);
        setState(() {});
      },
      child: Container(
        height: 35,
        width: 35,
        margin: widget.margin?? EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: widget.color ?? Colors.white,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(7.5),
        child: initialValue == true ?
        Icon(
          Icons.favorite,
          color: context.color.error,
          size: 18,
        ):
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
        // SvgPicture.asset(AppIcons.icFavorite),
      ),
    );
  }
}
