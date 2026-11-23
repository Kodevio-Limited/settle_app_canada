import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/settle_button.dart';
import '../../core/widgets/settle_card.dart';
import '../../core/widgets/settle_chip.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Gallery', style: AppTypography.h5),
        backgroundColor: AppColors.white50,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Buttons', style: AppTypography.h4),
          const SizedBox(height: 12),
          SettleButton(
            label: 'Primary Button',
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          SettleButton(
            label: 'Secondary Button',
            variant: SettleButtonVariant.secondary,
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          SettleButton(
            label: 'Outline Button',
            variant: SettleButtonVariant.outline,
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          const Text('Chips', style: AppTypography.h4),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: List.generate(4, (index) {
              return SettleChip(
                label: 'Filter Option $index',
                isSelected: _selectedChipIndex == index,
                onTap: () {
                  setState(() {
                    _selectedChipIndex = index;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 24),
          const Text('Cards', style: AppTypography.h4),
          const SizedBox(height: 12),
          SettleCard(
            onTap: () {},
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Standard Settle Card', style: AppTypography.body1Medium),
                SizedBox(height: 8),
                Text(
                  'Cards have radius 28, 1px border (#DEDEE2), and soft 8% shadow.',
                  style: AppTypography.caption1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

