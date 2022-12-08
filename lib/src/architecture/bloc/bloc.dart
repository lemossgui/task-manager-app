import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BloC<Event> extends GetxController
    with FancyMixin, HudMixin, NavigatorMixin {
  BuildContext? get context => Get.context;

  @override
  void onInit() {
    listen<Event>(handleEvent);
    dispatchState(LoadingState());
    super.onInit();
  }

  @override
  void onReady() {
    dispatchState(StableState());
    super.onReady();
  }

  @override
  void onClose() {
    fancy.dispose();
    super.onClose();
  }

  Future<void> handleListing({
    required Function action,
    Function? onError,
    Function? onFinish,
  }) async {
    try {
      dispatch<ScreenState>(LoadingState());
      await action();
    } on Exception catch (_) {
      dispatch<ScreenState>(ErrorState());
      onError?.call();
    } finally {
      dispatch<ScreenState>(StableState());
      onFinish?.call();
    }
  }

  Future<void> doPersist({
    required Function action,
    Function? onError,
    Function? onFinish,
  }) async {
    try {
      dispatch<PersistingState?>(PersistingState.loading);
      await action();
    } on Exception catch (_) {
      dispatch<PersistingState?>(PersistingState.error);
      onError?.call();
    } finally {
      dispatch<PersistingState?>(PersistingState.idle);
      onFinish?.call();
    }
  }

  @protected
  void handleEvent(Event event);

  void dispatchEvent(Event event) => dispatch<Event>(event);

  @protected
  void dispatchState(ScreenState state) => dispatch<ScreenState>(state);

  @protected
  dynamic get arguments => Get.arguments;
}
