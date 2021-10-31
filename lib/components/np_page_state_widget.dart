import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:necessary_pink_demo/components/error_switcher.dart';
import 'package:necessary_pink_demo/components/np_images.dart';
import 'package:necessary_pink_demo/components/np_no_data.dart';

enum PageState { loading, loaded, noData, error }

class NPPageStateWidget extends StatelessWidget {
  final PageState pageState;
  final Widget loadingWidget;
  final WidgetBuilder builder;
  final WidgetBuilder noDataBuilder;
  final String textUnderLoader;
  final Function onRetry;
  final dynamic error;
  final String noDataMessage;

  NPPageStateWidget({
    this.pageState,
    this.loadingWidget,
    this.builder,
    this.noDataBuilder,
    this.textUnderLoader,
    this.onRetry,
    this.error,
    this.noDataMessage,
  });

  @override
  Widget build(BuildContext context) {
    Widget pageBody = SizedBox.shrink();
    switch (pageState) {
      case PageState.loading:
        pageBody = loadingWidget ?? Lottie.asset(NPImages.loadingLottie);
        break;
      case PageState.loaded:
        if (builder != null) pageBody = Builder(builder: builder);
        break;
      case PageState.error:
        pageBody = ErrorSwitcher(
          message: 'An error has occurred',
          onRetry: onRetry,
          error: error,
        );
        break;
      case PageState.noData:
        if (noDataBuilder != null)
          pageBody = Builder(builder: noDataBuilder);
        else if (noDataMessage != null) pageBody = NoData(noDataMessage);
        break;
    }

    return pageBody;
  }
}
