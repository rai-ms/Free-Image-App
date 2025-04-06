import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../core/base/logger/app_logger_impl.dart';
import '../../../core/utils/config/app_config_impl.dart';

class RewardAdWidget extends StatefulWidget {
  const RewardAdWidget({super.key});

  @override
  State<RewardAdWidget> createState() => _RewardAdWidgetState();
}

class _RewardAdWidgetState extends State<RewardAdWidget> {
  RewardedAd? _rewardedAd;
  bool _isLoaded = false;


  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AppConfigurations().apiKey,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          setState(() {
            _rewardedAd = ad;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (LoadAdError error) {
          log.d('Reward ad failed to load: $error');
        },
      ),
    );
  }

  void _showAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          log.d('User earned reward: ${reward.amount} ${reward.type}');
          // You can grant the user access to premium content here
        },
      );

      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          log.d('Ad dismissed');
          setState(() {
            _rewardedAd = null;
            _isLoaded = false;
          });
          _loadRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          log.e('Ad failed to show: $error');
          ad.dispose();
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoaded ? _showAd : null,
      child: Text(_isLoaded ? 'Watch Ad for Reward' : 'Loading Ad...'),
    );
  }
}
