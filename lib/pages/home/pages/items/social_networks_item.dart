import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pozitolk/core/extension/context_extension.dart';
import 'package:pozitolk/core/extension/num_extension.dart';

class SocialNetworksItem extends StatelessWidget {
  const SocialNetworksItem({super.key, required this.title, required this.image, required this.onTap});
  final String title;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.color.background1,
          ),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        ),
        20.hGap,
        Text(title, style: context.textStyle.s20w500inter,textAlign: TextAlign.center,),
        12.hGap,
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            'Перейти',
            style: context.textStyle.s20w500inter
                .copyWith(color: context.color.primary),
          ),
        )
      ],
    );
  }
}
