import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/services/settle_data_flow_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';

class IntegrationMapScreen extends StatelessWidget {
  const IntegrationMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = SettleDataFlowService();

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            FigmaSubPageHeader(
              title: 'API & Integration Map',
              onBack: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/guest');
                }
              },
            ),
            Expanded(
              child: FutureBuilder<List<SystemIntegration>>(
                future: service.getIntegrationDirectory(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    );
                  }
                  final integrations = snapshot.data!;
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: integrations.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = integrations[index];
                      return FigmaSurfaceCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: AppTypography.body2Bold.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.successSurface,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    item.phase.name.toUpperCase(),
                                    style: AppTypography.caption2.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.success,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.description,
                              style: AppTypography.body2.copyWith(
                                color: AppColors.dark300,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Screens: ${item.screenReferences.join(" · ")}',
                              style: AppTypography.caption1.copyWith(
                                color: AppColors.dark200,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
