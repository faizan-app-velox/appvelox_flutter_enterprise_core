import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/presentation/widgets/skeleton_box.dart';

class TransactionSkeleton extends StatelessWidget {
  const TransactionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final baseColor = colorScheme.outlineVariant;
    final highlightColor = colorScheme.surface;

    // Helper color for inner elements (text lines, circles)
    final innerContentColor = colorScheme.onSurface.withValues(alpha: 0.1);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: colorScheme.surface),
              ),
              child: Row(
                children: [
                  // Circle Avatar style
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: innerContentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Title & Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonBox(
                          width: 120,
                          height: 14,
                          color: innerContentColor,
                        ),
                        const SizedBox(height: 8),
                        SkeletonBox(
                          width: 80,
                          height: 10,
                          color: innerContentColor,
                        ),
                      ],
                    ),
                  ),

                  // Amount Box
                  SkeletonBox(width: 60, height: 16, color: innerContentColor),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
