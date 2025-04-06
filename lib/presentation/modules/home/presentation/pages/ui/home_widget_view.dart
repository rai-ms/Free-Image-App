part of '../controller/home_controller.dart';

class _HomeWidgetView extends WidgetView<_HomeWidgetView, _MyHomePageState> {
  const _HomeWidgetView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SearchHomePage(isFromHome: true,),
            TabBarWidgetHome(tabs: state._generatedTabs, tabController: state._tabController,),
            Expanded(
              child: RandomPhotoList(tabController: state._tabController,)
            ),
          ],
        ),
      ),
    );
  }
}