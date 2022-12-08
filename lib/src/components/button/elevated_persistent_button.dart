import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ElevatedPersistentButton extends StatelessWidget {
  final BloC bloc;
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Widget? onPersisting;
  final Widget? onIdle;
  final Widget? onError;

  const ElevatedPersistentButton({
    required this.bloc,
    required this.text,
    required this.onPressed,
    this.color,
    this.onPersisting,
    this.onIdle,
    this.onError,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PersistingState?>(
      stream: bloc.streamOf<PersistingState?>(),
      builder: (streamContext, snapshot) {
        final state = snapshot.data;
        final isIdle =
            snapshot.data == null || snapshot.data == PersistingState.idle;
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(color ?? primaryColor),
          ),
          onPressed: !isIdle ? null : onPressed,
          child: _buildButtonContent(streamContext, state),
        );
      },
    );
  }

  Widget _buildButtonContent(BuildContext context, PersistingState? state) {
    return Container(
      height: 48.0,
      width: double.infinity,
      alignment: Alignment.center,
      child: state == null
          ? _buildText()
          : state.isError
              ? onError ?? _buildText()
              : state.isIdle
                  ? onIdle ?? _buildText()
                  : state.isLoading
                      ? onPersisting ??
                          LoadingAnimationWidget.horizontalRotatingDots(
                            color: secondaryTextColor,
                            size: 32.0,
                          )
                      : _buildText(),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: subtitle,
    );
  }
}
