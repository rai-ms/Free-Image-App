import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import 'package:wall_paper_app/core/utils/extensions/string_extension.dart';
import '../../../../../core/base/logger/app_logger_impl.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/random_image_fetch_bloc/random_image_fetch_bloc.dart';

class TabBarWidgetHome extends StatefulWidget {
  const TabBarWidgetHome({super.key, required this.tabController, required this.tabs});
  final TabController tabController;
  final List<String> tabs;

  @override
  State<TabBarWidgetHome> createState() => _TabBarWidgetHomeState();
}

class _TabBarWidgetHomeState extends State<TabBarWidgetHome> {

  List<Widget> get _tabs {
    return widget.tabs.map((name) => tabWidget(name)).toList();
  }


  @override
  void initState() {
    _randomImageFetchBloc = context.read<RandomImageFetchBloc>();
    super.initState();
  }

  late final RandomImageFetchBloc _randomImageFetchBloc;

  void onTapTab(int onTapTabBarIndex){
    log.d("Data of Tab is ${widget.tabs[onTapTabBarIndex]}");
    _randomImageFetchBloc.add(FetchDataTabEvent(eventName: widget.tabs[onTapTabBarIndex]));
  }


  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      onTap: onTapTab,
      tabAlignment: TabAlignment.start,
      textScaler: TextScaler.linear(1),
      splashFactory: NoSplash.splashFactory,
      dividerColor: AppColors.transparent,
      controller: widget.tabController,
      tabs: _tabs
    );
  }

  Widget tabWidget(String name){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.jakarta,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.whiteColor),
      ),
      child: Text(name.firstCap,
        style: AppStyles.medium.medium.copyWith(),
      ),
    );
  }

}
