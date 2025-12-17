import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/localization_extension.dart';

class DashboardErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const DashboardErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.redAccent.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cloud_off_rounded,
                size: 50,
                color: Colors.redAccent,
              ),
            ).animate().scale(curve: Curves.elasticOut, duration: 800.ms),

            const SizedBox(height: 20),

            // Error Text
            Text(
              context.l10n.thereIsSomeProblem,
              style: textTheme.titleLarge?.copyWith(fontSize: 18),
            ),

            const SizedBox(height: 8),

            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),

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
                  backgroundColor: AppTheme.brandTeal, // Consistent Brand Color
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
