import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';

ClassicHeader classicHeader(BuildContext context) {
  final localizations = context.localizations();

  final dragText = localizations.easyRefreshDragText;
  final armedText = localizations.easyRefreshArmedText;
  final readyText = localizations.easyRefreshReadyText;
  final processingText = localizations.easyRefreshProcessingText;
  final processedText = localizations.easyRefreshProcessedText;
  final noMoreText = localizations.easyRefreshNoMoreText;
  final failedText = localizations.easyRefreshFailedText;
  final messageText = localizations.easyRefreshMessageText;

  return ClassicHeader(
    dragText: dragText,
    armedText: armedText,
    readyText: readyText,
    processingText: processingText,
    processedText: processedText,
    noMoreText: noMoreText,
    failedText: failedText,
    messageText: messageText,
  );
}

ClassicFooter classicFooter(BuildContext context) {
  final localizations = context.localizations();

  final dragText = localizations.easyRefreshFooterDragText;
  final armedText = localizations.easyRefreshFooterArmedText;
  final readyText = localizations.easyRefreshFooterReadyText;
  final processingText = localizations.easyRefreshFooterProcessingText;
  final processedText = localizations.easyRefreshFooterProcessedText;
  final noMoreText = localizations.easyRefreshFooterNoMoreText;
  final failedText = localizations.easyRefreshFooterFailedText;
  final messageText = localizations.easyRefreshFooterMessageText;

  return ClassicFooter(
    dragText: dragText,
    armedText: armedText,
    readyText: readyText,
    processingText: processingText,
    processedText: processedText,
    noMoreText: noMoreText,
    failedText: failedText,
    messageText: messageText,
  );
}
