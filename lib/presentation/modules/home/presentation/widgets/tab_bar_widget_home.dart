import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/utils/app_style.dart';
import 'package:wall_paper_app/core/utils/extensions/string_extension.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/random_image_fetch_bloc/random_image_fetch_bloc.dart';

class TabBarWidgetHome extends StatefulWidget {
  const TabBarWidgetHome({super.key, this.tabs = const []});
  final List<String> tabs;

  @override
  State<TabBarWidgetHome> createState() => _TabBarWidgetHomeState();
}

class _TabBarWidgetHomeState extends State<TabBarWidgetHome> with SingleTickerProviderStateMixin{

  List<Widget> get _tabs {
    return _generatedTabs.map((name) => tabWidget(name)).toList();
  }

  late final List<String> _generatedTabs;

  late final TabController _tabController;

  @override
  void initState() {
    _randomImageFetchBloc = context.read<RandomImageFetchBloc>();
    _generatedTabs = ["random", ...widget.tabs];
    _tabController = TabController(length: widget.tabs.length+1, vsync: this);
    super.initState();
  }

  late final RandomImageFetchBloc _randomImageFetchBloc;

  void onTapTab(int onTapTabBarIndex){
    _randomImageFetchBloc.add(FetchDataTabEvent(eventName: _generatedTabs[onTapTabBarIndex]));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
      controller: _tabController,
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
