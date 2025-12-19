import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';
import '../../../l10n/localization_extension.dart';

class AppStatusWidget extends StatelessWidget {
  final String? message;
  final String? title;
  final VoidCallback onRetry;
  final IconData? icon;
  final Color? color;

  const AppStatusWidget({
    super.key,
    this.message,
    this.title,
    required this.onRetry,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final effectiveColor = color ?? Colors.redAccent;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: effectiveColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? Icons.cloud_off_rounded,
                size: 50,
                color: effectiveColor,
              ),
            ).animate().scale(curve: Curves.elasticOut, duration: 800.ms),

            const SizedBox(height: 30),

            // Title
            Text(
              title ?? context.l10n.thereIsSomeProblem,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(fontSize: 21),
            ),

            // Message
            if (message != null && message!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],

            const SizedBox(height: 30),

            // Retry Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: Text(context.l10n.tryAgain),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.brandTeal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
          ],
        ),
      ),
    );
  }
}
