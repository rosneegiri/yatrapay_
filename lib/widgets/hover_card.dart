import 'package:flutter/material.dart';

class HoverEffect extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const HoverEffect({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  State<HoverEffect> createState() => _HoverEffectState();
}

class _HoverEffectState extends State<HoverEffect> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: _hovered
              ? (Matrix4.identity()..translate(0, -3))
              : Matrix4.identity(),
          child: widget.child,
        ),
      ),
    );
  }
}
