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
            // SearchHomePage(isFromHome: true,),
            TabBarWidgetHome(tabs: ["Cricket", "Nature", "God", "Ram Ji"],),
            Expanded(
              child: RandomPhotoList()
            ),
          ],
        ),
      ),
    );
  }
}