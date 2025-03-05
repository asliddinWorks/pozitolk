import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            onTap: (){
              // launchUrlString('');
            },
            title: 'Чат с ПозиТолк',
            image: AppIcons.icChat,
          ),
          SocialNetworksItem(
            onTap: (){
              launchUrlString('https://www.instagram.com/pozi_tolk/?igsh=aXpvcTdwYjZ4aWk0#');
            },

            title: 'Instagram',
            image: AppIcons.icInstagram,
          ),
          SocialNetworksItem(
            onTap: (){
              launchUrlString('https://vk.com/club226735405');
            },
            title: 'Группа ВКонтакте',
            image: AppIcons.icVkontakte,
          ),
          SocialNetworksItem(
            onTap: (){
              launchUrlString('https://www.facebook.com/groups/1012434133443340/?ref=share&mibextid=K35XfP&rdid=WDS6HCrlMJEw1bOx&share_url=https%3A%2F%2Fwww.facebook.com%2Fshare%2F7Kt61mVnBiA3sfQP%2F%3Fmibextid%3DK35XfP#');
            },
            title: 'Facebook',
            image: AppIcons.icFacebook,
          ),
          SocialNetworksItem(
            onTap: (){
              launchUrlString('https://dzen.ru/pozi_tolk');
            },
            title: 'Яндекс Дзен',
            image: AppIcons.icYandexZen,
          ),
          SocialNetworksItem(
            onTap: (){
              launchUrlString('https://t.me/pozi_tolk');
            },
            title: 'Telegram канал',
            image: AppIcons.icTelegram,
          ),
        ],
      ),
    );
  }
}
