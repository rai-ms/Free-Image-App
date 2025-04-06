
part of '../controller/search_controller.dart';

class _SearchWidgetView extends WidgetView<_SearchWidgetView, _SearchControllerState> {
  const _SearchWidgetView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.scaffoldBackgroundColor,
        leading: backIcon(context),
        centerTitle: true,
        title: Text("Search",
          style: AppStyles.large.semiBold.white,
          textAlign: TextAlign.start,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchHomePage(),
            Space.h16,
            Expanded(child: SearchList()),
          ],
        ),
      ),
    );
  }

  Widget backIcon(BuildContext context) {
    return InkWell(
      onTap: context.pop,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FaIcon(
          FontAwesomeIcons.arrowLeft,
          size: 20,
          color: appTheme.photoClickIconColor,
        ),
      ),
    );
  }
}
