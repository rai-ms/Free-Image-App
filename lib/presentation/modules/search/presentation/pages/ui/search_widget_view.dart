
part of '../controller/search_controller.dart';

class _SearchWidgetView extends WidgetView<_SearchWidgetView, _SearchControllerState> {
  const _SearchWidgetView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SearchHomePage(),
          ],
        ),
      ),
    );
  }
}
