import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wall_paper_app/core/services/theme_service/theme_service.dart';
import 'package:wall_paper_app/core/utils/app_k_border_radius.dart';
import 'package:wall_paper_app/core/utils/app_k_padding.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import 'package:wall_paper_app/core/utils/utility_helper.dart';
import 'package:wall_paper_app/presentation/modules/home/presentation/widgets/user_logo.dart';
import '../../../../../core/utils/space.dart';
import '../../domain/entities/image_model_search_home.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key, required this.photo, this.isLast = true});
  final Photo photo;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: CircularBorderRadius.b5,
        color: appTheme.photoBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Space.h10,
          UserLogo(
            photo: photo
          ),
          Space.h10,
          if(photo.alt != null)altWidget,
          if(photo.alt != null)Space.h10,
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              UtilityHelper.image(
                photo.priorityImage,
                context: context,
                height: 200,
                width: Space.w,
                fit: BoxFit.cover,
                cachedExtent: true
              ),
              likeWidget,
            ],
          ),
          if(!isLast)Space.h10,
          if(!isLast)divider,
          Space.h4,
        ],
      ),
    );
  }

  Widget get altWidget => Text(
    photo.alt!,
    style: AppStyles.regular.semiBold.copyWith(
      color: appTheme.photoAltColor,
      fontSize: 14
    ),
  );

  Widget get divider => Container(
    height: 1,
    color: appTheme.photoDividerColor,
  );

  Widget get likeWidget => Container(
    decoration: BoxDecoration(
      border: Border.all(color: appTheme.likeWidgetBorderColor!),
      color: appTheme.likeWidgetBackgroundColor,
      borderRadius: CircularBorderRadius.b30
    ),
    margin: AppPadding.padSH16,
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FaIcon(
            FontAwesomeIcons.solidThumbsUp,
            size: 20,
            color: appTheme.photoClickIconColor,
          ),
          Space.w10,
          likeDivider,
          Space.w10,
          FaIcon(
            FontAwesomeIcons.solidHeart,
            size: 20,
            color: appTheme.photoClickIconColor,
          ),
        ],
      ),
    ),
  );


  Widget get likeDivider => Container(
    height: 20,
    width: 1,
    color: appTheme.photoDividerColor,
  );
}
