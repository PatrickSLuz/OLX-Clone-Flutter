import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final ScrollController scrollController;
  final VoidCallback onTap;

  AnimatedButton({this.scrollController, this.onTap});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<EdgeInsets> _edgeAnimation;
  Animation<double> _raduisAnimation;

  ScrollController get scrollController => widget.scrollController;
  VoidCallback get onTap => widget.onTap;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _edgeAnimation = EdgeInsetsTween(
      begin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      end: EdgeInsets.zero,
    ).animate(_controller);

    _raduisAnimation = Tween<double>(begin: 25, end: 0).animate(_controller);

    scrollController.addListener(positionChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    scrollController.removeListener(positionChanged);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: _edgeAnimation.value,
            height: 50,
            child: RaisedButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_raduisAnimation.value),
              ),
              child: const Text(
                "Filtrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: onTap,
            ),
          ),
        );
      },
    );
  }

  void positionChanged() {
    if (scrollController.offset >
        0.98 * scrollController.position.maxScrollExtent) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
