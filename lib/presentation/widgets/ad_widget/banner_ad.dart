import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wall_paper_app/core/utils/space.dart';
import '../../../core/base/logger/app_logger_impl.dart';
import '../../../core/utils/config/app_config_impl.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    var id= AppConfigurations().googleAdsBanner;
    log.d("ADD IS IS ${id}");
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: id,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => setState(() => _isLoaded = true),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          log.d('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
      request: AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded ? SizedBox(
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd),
    )
        : Space.z;
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }
}