import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wall_paper_app/core/services/theme_service/theme_service.dart';
import 'package:wall_paper_app/core/utils/app_k_border_radius.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import 'package:wall_paper_app/core/utils/utility_helper.dart';
import '../../../../../core/utils/space.dart';
import '../../domain/entities/image_model_search_home.dart';

class UserLogo extends StatelessWidget {
  const UserLogo({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: appTheme.photoUserBorderColor != null? Border.all(
              color: appTheme.photoUserBorderColor!,
              width: 0.7
            ): null,
            borderRadius: CircularBorderRadius.inf
          ),
          child: ClipRRect(
            borderRadius: CircularBorderRadius.inf,
            child: UtilityHelper.image(
              photo.priorityImage,
              context: context,
              height: 30,
              width: 30,
              fit: BoxFit.fill
            ),
          ),
        ),
        Space.w5,
        Text(photo.userName,
          style: AppStyles.regular.semiBold.copyWith(
            color: appTheme.photoUserNameColor
          )
        ),
        Space.w10,
        if(photo.photographerUrl != null)InkWell(
          onTap: (){
            launchUrl(Uri.parse(photo.photographerUrl!));
          },
          child: FaIcon(
            FontAwesomeIcons.link,
            size: 10,
            color: appTheme.photoClickIconColor,
          ),
        ),
      ],
    );
  }

}