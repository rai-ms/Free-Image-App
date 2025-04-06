import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_paper_app/core/base/controller_base/widget_view_base.dart';
import 'package:wall_paper_app/core/services/theme_service/theme_service.dart';
import '../../manager/random_image_fetch_bloc/random_image_fetch_bloc.dart';
import '../../widgets/random_photo_list.dart';
import '../../widgets/search_home_page.dart';
import '../../widgets/tab_bar_widget_home.dart';

part '../ui/home_widget_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late final RandomImageFetchBloc _randomImageFetchBloc;
  late final TabController _tabController;
  late final List<String> _generatedTabs = ["Random", "Trending", "Popular", "Cricket", "Nature", "Garden"];

  @override
  void initState() {
    preInit();
    super.initState();
    postInit();
  }

  void preInit(){
    _tabController = TabController(length: _generatedTabs.length, vsync: this);
  }

  void postInit(){
    _randomImageFetchBloc = context.read<RandomImageFetchBloc>();
    _randomImageFetchBloc.add(FetchDataInitEvent());
  }

  @override
  Widget build(BuildContext context) => _HomeWidgetView(this);
}
