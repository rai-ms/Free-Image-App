

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:wall_paper_app/core/utils/space.dart';

import 'app_colors.dart';
import 'app_enum.dart';
import 'app_style.dart';

void toast(String message, {bool isLong = false, BuildContext? context, ToastType toastType = ToastType.success}) {
  BotToast.showCustomNotification(
    duration: const Duration(seconds: 5),
    toastBuilder: (cancel) {
      return Container(
        constraints: const BoxConstraints(
            maxWidth: 750
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
          color: toastType==ToastType.success? AppColors.msuGreen: AppColors.kuCrimson,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Space.w16,
                  Flexible(
                    child: Text(
                        message,
                        textAlign: TextAlign.start,
                        style: AppStyles.medium.semiBold.white
                    ),
                  ),

                ],
              ),
            ),
            Space.w50,
            GestureDetector(
                onTap: cancel,
                child: const Icon(Icons.close, color: AppColors.whiteColor, size: 17)),
          ],
        ),
      );
    },
  );
}