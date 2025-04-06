import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wall_paper_app/core/base/controller_base/widget_view_base.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import '../../../../../../core/services/theme_service/theme_service.dart';
import '../../../../../../core/utils/space.dart';
import '../../../../home/presentation/widgets/search_home_page.dart';
import '../../widgets/search_list.dart';

part '../ui/search_widget_view.dart';

class SearchImageController extends StatefulWidget {
  const SearchImageController({super.key});

  @override
  State<SearchImageController> createState() => _SearchControllerState();
}

class _SearchControllerState extends State<SearchImageController> {

  @override
  Widget build(BuildContext context) => _SearchWidgetView(this);
}
