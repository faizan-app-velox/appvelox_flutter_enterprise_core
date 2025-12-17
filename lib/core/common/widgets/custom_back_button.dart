import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Container handles the Shadow
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.cardTheme.shadowColor ?? Colors.transparent,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // Material handles the Surface (Color + Shape + Border)
      child: Material(
        color: theme.cardColor,
        shape: CircleBorder(
          side: BorderSide(color: theme.colorScheme.outlineVariant),
        ),

        // InkWell handles the Ripple (On Top)
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => context.pop(),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(Icons.adaptive.arrow_back_rounded, size: 20),
          ),
        ),
      ),
    );
  }
}
