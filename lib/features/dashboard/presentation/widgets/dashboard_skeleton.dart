import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/presentation/widgets/skeleton_box.dart';

class DashboardSkeleton extends StatelessWidget {
  const DashboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final baseColor = colorScheme.outlineVariant;
    final highlightColor = colorScheme.surface;

    final innerContentColor = colorScheme.onSurface.withValues(alpha: 0.1);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STATS SECTION
            SkeletonBox(width: 120, height: 16, color: colorScheme.surface),
            const SizedBox(height: 8),
            SkeletonBox(width: 200, height: 42, color: colorScheme.surface),
            const SizedBox(height: 30),

            // Chart
            SkeletonBox(
              width: double.infinity,
              height: 150,
              color: colorScheme.surface,
              radius: 16, // Use the new radius parameter if needed
            ),
            const SizedBox(height: 50),

            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkeletonBox(width: 150, height: 23, color: colorScheme.surface),
                SkeletonBox(width: 60, height: 20, color: colorScheme.surface),
              ],
            ),
            const SizedBox(height: 35),

            // Transaction list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: colorScheme.surface),
                    ),
                    child: Row(
                      children: [
                        // Circle
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: innerContentColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Text Lines
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SkeletonBox(
                                width: double.infinity,
                                height: 16,
                                color: innerContentColor,
                              ),
                              const SizedBox(height: 6),
                              SkeletonBox(
                                width: 100,
                                height: 12,
                                color: innerContentColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
