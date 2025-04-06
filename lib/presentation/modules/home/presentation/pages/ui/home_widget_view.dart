part of '../controller/home_controller.dart';

class _HomeWidgetView extends WidgetView<_HomeWidgetView, _MyHomePageState> {
  const _HomeWidgetView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        actions: [
          searchIcon(context),
          RewardAdWidget(),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBarWidgetHome(tabs: state._generatedTabs, tabController: state._tabController,),
            Expanded(
              child: RandomPhotoList(tabController: state._tabController,)
            ),
            BannerAdWidget(),
          ],
        ),
      ),
    );
  }

  Widget searchIcon(BuildContext context) => InkWell(
    onTap: () => context.pushNamed(RoutesName.searchPage),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FaIcon(
        FontAwesomeIcons.magnifyingGlass,
        size: 20,
        color: appTheme.photoClickIconColor,
      ),
    ),
  );
}