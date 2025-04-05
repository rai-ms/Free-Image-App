import 'package:flutter/material.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
    final Brightness? brightness;
    final Color? photoBorderColor;
    final Color? photoUserBorderColor;
    final Color? photoDividerColor;
    final Color? photoUserNameColor;
    final Color? photoElevationColor;
    final Color? photoBackgroundColor;
    final Color? photoClickIconColor;
    final Color? photoAltColor;
    final Color? scaffoldBackgroundColor;
    final Color? likeWidgetBorderColor;
    final Color? likeWidgetBackgroundColor;
    final List<Color>? photoLinerGradientColor;

    const AppColorScheme({
        this.brightness = Brightness.light,
        this.photoBorderColor,
        this.photoDividerColor,
        this.photoUserNameColor,
        this.photoElevationColor,
        this.photoLinerGradientColor,
        this.photoBackgroundColor,
        this.scaffoldBackgroundColor,
        this.photoUserBorderColor,
        this.photoClickIconColor,
        this.photoAltColor,
        this.likeWidgetBorderColor,
        this.likeWidgetBackgroundColor,
    });

    @override
    AppColorScheme copyWith({
        Brightness? brightness,
        Color? photoBorderColor,
        Color? photoDividerColor,
        Color? photoUserNameColor,
        Color? photoElevationColor,
        Color? photoBackgroundColor,
        Color? scaffoldBackgroundColor,
        Color? photoUserBorderColor,
        Color? photoClickIconColor,
        Color? photoAltColor,
        Color? likeWidgetBorderColor,
        Color? likeWidgetBackgroundColor,
        List<Color>? photoLinerGradientColor,
    }) {
        return AppColorScheme(
            brightness: brightness ?? this.brightness,
            photoBorderColor: photoBorderColor ?? this.photoBorderColor,
            likeWidgetBackgroundColor: likeWidgetBackgroundColor ?? this.likeWidgetBackgroundColor,
            photoClickIconColor: photoClickIconColor ?? this.photoClickIconColor,
            photoUserBorderColor: photoUserBorderColor ?? this.photoUserBorderColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
            photoDividerColor: photoDividerColor ?? this.photoDividerColor,
            photoUserNameColor: photoUserNameColor ?? this.photoUserNameColor,
            photoElevationColor: photoElevationColor ?? this.photoElevationColor,
            photoLinerGradientColor: photoLinerGradientColor ?? this.photoLinerGradientColor,
            photoBackgroundColor: photoBackgroundColor ?? this.photoBackgroundColor,
            likeWidgetBorderColor: likeWidgetBorderColor ?? this.likeWidgetBorderColor,
            photoAltColor: photoAltColor ?? this.photoAltColor,
        );
    }

    @override
    AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
        if (other is! AppColorScheme) return this;

        return AppColorScheme(
            brightness: t < 0.5 ? brightness : other.brightness,
            photoBorderColor: Color.lerp(photoBorderColor, other.photoBorderColor, t),
            likeWidgetBackgroundColor: Color.lerp(likeWidgetBackgroundColor, other.likeWidgetBackgroundColor, t),
            likeWidgetBorderColor: Color.lerp(likeWidgetBorderColor, other.likeWidgetBorderColor, t),
            photoAltColor: Color.lerp(photoAltColor, other.photoAltColor, t),
            photoClickIconColor: Color.lerp(photoClickIconColor, other.photoClickIconColor, t),
            photoUserBorderColor: Color.lerp(photoUserBorderColor, other.photoUserBorderColor, t),
            scaffoldBackgroundColor: Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
            photoDividerColor: Color.lerp(photoDividerColor, other.photoDividerColor, t),
            photoUserNameColor: Color.lerp(photoUserNameColor, other.photoUserNameColor, t),
            photoElevationColor: Color.lerp(photoElevationColor, other.photoElevationColor, t),
            photoBackgroundColor: Color.lerp(photoBackgroundColor, other.photoBackgroundColor, t),
            photoLinerGradientColor: _lerpColorList(
                photoLinerGradientColor,
                other.photoLinerGradientColor,
                t,
            ),
        );
    }

    /// Helper method to lerp between two lists of colors
    List<Color>? _lerpColorList(List<Color>? a, List<Color>? b, double t) {
        if (a == null || b == null || a.length != b.length) return b;
        return List<Color>.generate(
            a.length,
                (index) => Color.lerp(a[index], b[index], t) ?? b[index],
        );
    }
}
