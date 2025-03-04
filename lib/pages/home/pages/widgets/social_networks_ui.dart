import 'package:flutter/cupertino.dart';

import '../../../../constants/app_icons.dart';
import '../items/social_networks_item.dart';

class SocialNetworksUi extends StatefulWidget {
  const SocialNetworksUi({super.key});

  @override
  State<SocialNetworksUi> createState() => _SocialNetworksUiState();
}

class _SocialNetworksUiState extends State<SocialNetworksUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 16,
          childAspectRatio: .74,
        ),
        children: [
          SocialNetworksItem(
            title: 'Чат с ПозиТолк',
            image: AppIcons.icChat,
          ),
          SocialNetworksItem(
            title: 'Instagram',
            image: AppIcons.icInstagram,
          ),
          SocialNetworksItem(
            title: 'Группа ВКонтакте',
            image: AppIcons.icVkontakte,
          ),
          SocialNetworksItem(
            title: 'Facebook',
            image: AppIcons.icFacebook,
          ),
          SocialNetworksItem(
            title: 'Яндекс Дзен',
            image: AppIcons.icYandexZen,
          ),
          SocialNetworksItem(
            title: 'Telegram канал',
            image: AppIcons.icTelegram,
          ),
        ],
      ),
    );
  }
}
