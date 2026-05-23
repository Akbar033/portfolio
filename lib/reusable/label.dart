import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_likndin_website/core/Utils/responsive.dart';

/// PROFESSIONAL REUSABLE CONTACT LABEL
/// Features:
/// - Animated popup effect
/// - Reusable
/// - Custom text
/// - Custom icon
/// - Foreground color
/// - Background color
/// - Hover animation (Web/Desktop)
/// - Modern UI
/// - Responsive
///
/// USAGE:
///
/// AnimatedContactLabel(
///   text: "Contact Me",
///   icon: Icons.mail_outline,
///   foregroundColor: Colors.white,
///   backgroundColor: Colors.blue,
///   onTap: () {},
/// )
///

class AnimatedContactLabel extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const AnimatedContactLabel({
    super.key,
    required this.text,
    required this.icon,
    required this.foregroundColor,
    required this.backgroundColor,
    this.onTap,
  });

  @override
  State<AnimatedContactLabel> createState() => _AnimatedContactLabelState();
}

class _AnimatedContactLabelState extends State<AnimatedContactLabel>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _slideAnimation = Tween<double>(
      begin: 40,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    /// Auto popup animation
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Transform.scale(
            scale: isHovered
                ? _scaleAnimation.value * 1.1
                : _scaleAnimation.value,
            child: MouseRegion(
              onEnter: (_) {
                setState(() => isHovered = true);
              },
              onExit: (_) {
                setState(() => isHovered = false);
              },
              child: GestureDetector(
                onTap: widget.onTap,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: widget.backgroundColor.withOpacity(
                          isHovered ? 0.45 : 0.25,
                        ),
                        blurRadius: isHovered ? 30 : 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(
                        turns: isHovered ? 0.08 : 0,
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          widget.icon,
                          color: widget.foregroundColor,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 250),
                        style: TextStyle(
                          color: widget.foregroundColor,
                          fontSize: isHovered ? 17 : 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                        child: Text(widget.text),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
