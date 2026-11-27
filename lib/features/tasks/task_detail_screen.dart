import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/router/navigation_helpers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/figma_onboarding_widgets.dart';
import '../../core/widgets/settle_button.dart';
import 'models/task_data.dart';

class TaskDetailScreen extends StatefulWidget {
  final String taskId;
  final TaskModel? initialTask;

  const TaskDetailScreen({
    super.key,
    required this.taskId,
    this.initialTask,
  });

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late TaskModel task;
  late Set<int> checkedItems;
  late bool isDone;

  @override
  void initState() {
    super.initState();
    task = widget.initialTask ?? getTaskById(widget.taskId) ?? allTasksData.first;
    isDone = task.isCompleted;
    checkedItems = (task.id == 'TaskSIN' || task.id == 'TaskLicence') ? {0} : {};
  }

  Color _parseColor(String hex) {
    try {
      final clean = hex.replaceAll('#', '');
      return Color(int.parse('FF$clean', radix: 16));
    } catch (_) {
      return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Figma Top Action Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FigmaCircleBackButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/journey');
                      }
                    },
                  ),
                  FigmaCircleActionButton(
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                      size: 22,
                      color: AppColors.mainFont,
                    ),
                    tooltip: 'More options',
                    onPressed: () => _showMoreOptions(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Completed banner if done
              if (isDone) ...[
                FigmaNoticeBanner(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          task.completedText ?? 'Done for everyone · Sep 20',
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isDone = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Undo',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Eyebrow, Title & For-whom chips
              Text(
                task.tag.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6,
                  color: isDone ? AppColors.secondary : AppColors.red,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                task.title,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.6,
                  height: 1.12,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 12),

              if (task.forWhom.isNotEmpty) ...[
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    const Text(
                      'For ',
                      style: TextStyle(
                        fontFamily: AppTypography.fontBody,
                        fontSize: 13.5,
                        color: AppColors.dark300,
                      ),
                    ),
                    ...task.forWhom.map((person) {
                      return Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 4, right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 11,
                              backgroundColor: _parseColor(person.bgHex),
                              child: Text(
                                person.initial,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              person.name,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainFont,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ] else if (task.forWhomNote != null) ...[
                Text(
                  task.forWhomNote!,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontBody,
                    fontSize: 14,
                    color: AppColors.dark300,
                  ),
                ),
              ],
              const SizedBox(height: 16),

              // Why you're seeing this box (Muted cool teal)
              if (task.whyTags.isNotEmpty) ...[
                FigmaNoticeBanner(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Why you're seeing this",
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: task.whyTags.map((tagText) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              tagText,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 12.5,
                                color: AppColors.mainFont,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () => context.pushSafe('/settings'),
                        child: const Text(
                          'Something wrong? Update your answers',
                          style: TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Stat Grid (borderless white tiles)
              if (task.stats.isNotEmpty) ...[
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.0,
                  ),
                  itemCount: task.stats.length,
                  itemBuilder: (context, idx) {
                    final stat = task.stats[idx];
                    return FigmaSurfaceCard(
                      radius: 14,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            stat.label,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 12,
                              color: AppColors.dark300,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            stat.value,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],

              // Steps List
              if (task.steps.isNotEmpty) ...[
                const Text(
                  'Steps',
                  style: TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  children: List.generate(task.steps.length, (idx) {
                    final stepNumber = idx + 1;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            margin: const EdgeInsets.only(top: 1),
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$stepNumber',
                                style: const TextStyle(
                                  fontFamily: AppTypography.fontBody,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              task.steps[idx],
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 14.5,
                                height: 1.45,
                                color: AppColors.mainFont,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 14),
              ],

              // What to bring / Have ready Section
              FigmaSurfaceCard(
                radius: 16,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            task.bringTitle,
                            style: const TextStyle(
                              fontFamily: AppTypography.fontHeading,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainFont,
                            ),
                          ),
                        ),
                        if (task.checklist.isNotEmpty)
                          GestureDetector(
                            onTap: () => context.push('/checklist'),
                            child: const Text(
                              'All checklists',
                              style: TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (task.checklist.isNotEmpty) ...[
                      ...List.generate(task.checklist.length, (idx) {
                        final isChecked = checkedItems.contains(idx);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (isChecked) {
                                checkedItems.remove(idx);
                              } else {
                                checkedItems.add(idx);
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: Checkbox(
                                    value: isChecked,
                                    activeColor: AppColors.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == true) {
                                          checkedItems.add(idx);
                                        } else {
                                          checkedItems.remove(idx);
                                        }
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    task.checklist[idx],
                                    style: const TextStyle(
                                      fontFamily: AppTypography.fontBody,
                                      fontSize: 14.5,
                                      color: AppColors.mainFont,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                    if (task.bringNote != null) ...[
                      Text(
                        task.bringNote!,
                        style: const TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 14,
                          height: 1.45,
                          color: AppColors.dark300,
                        ),
                      ),
                    ],
                    if (task.checklistFootnote != null) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.bg,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          task.checklistFootnote!,
                          style: const TextStyle(
                            fontFamily: AppTypography.fontBody,
                            fontSize: 12.5,
                            height: 1.4,
                            color: AppColors.dark300,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Nearby Section
              if (task.nearbyTitle.isNotEmpty) ...[
                Text(
                  task.nearbyTitle,
                  style: const TextStyle(
                    fontFamily: AppTypography.fontHeading,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainFont,
                  ),
                ),
                const SizedBox(height: 10),
                if (task.nearbyNote != null) ...[
                  Text(
                    task.nearbyNote!,
                    style: const TextStyle(
                      fontFamily: AppTypography.fontBody,
                      fontSize: 14,
                      height: 1.45,
                      color: AppColors.dark300,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                if (task.hasMap) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 156,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/images/map_preview.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: const Color(0xFFE9E9EC),
                            ),
                          ),
                          Positioned(
                            right: 110,
                            top: 26,
                            child: _buildMapPin('1'),
                          ),
                          Positioned(
                            left: 64,
                            top: 52,
                            child: _buildMapPin('2'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                ...task.nearbyItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FigmaSurfaceCard(
                      radius: 16,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      onTap: () => context.push('/location-detail'),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: AppColors.dark50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              item.num,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.mainFont,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.sub,
                                  style: const TextStyle(
                                    fontFamily: AppTypography.fontBody,
                                    fontSize: 13,
                                    color: AppColors.dark300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 20,
                            color: AppColors.dark200,
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                if (task.nearbyItems.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => context.push('/nearby'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'See all on the map',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
              ],

              // Official source card
              if (task.sourceName.isNotEmpty) ...[
                FigmaSurfaceCard(
                  radius: 16,
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      const FigmaIconTile(
                        icon: Icons.open_in_new_rounded,
                        iconColor: AppColors.primary,
                        backgroundColor: AppColors.dark50,
                        size: 42,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.sourceName,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainFont,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              task.sourceSub,
                              style: const TextStyle(
                                fontFamily: AppTypography.fontBody,
                                fontSize: 13,
                                color: AppColors.dark300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Action buttons (if not done)
              if (!isDone) ...[
                SettleButton(
                  label: 'Mark as done',
                  onPressed: () => context.push('/done-picker'),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () => context.push('/snooze'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.dark100),
                            backgroundColor: AppColors.dark50,
                            foregroundColor: AppColors.mainFont,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Remind me later',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () => context.push('/dismiss'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.dark100),
                            backgroundColor: AppColors.dark50,
                            foregroundColor: AppColors.mainFont,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Not for me',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: AppTypography.fontBody,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => context.pushSafe('/help'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Ask a settlement worker',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/report-outdated'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Report outdated info',
                        style: TextStyle(
                          fontFamily: AppTypography.fontBody,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],

              // Disclaimer text
              Text(
                task.disclaimer,
                style: const TextStyle(
                  fontFamily: AppTypography.fontBody,
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.dark300,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMapPin(String num) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              num,
              style: const TextStyle(
                fontFamily: AppTypography.fontBody,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        CustomPaint(
          size: const Size(8, 6),
          painter: _TrianglePainter(color: AppColors.primary),
        ),
      ],
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const FigmaSheetHandle(),
              const SizedBox(height: 14),
              Text(
                task.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: AppTypography.fontHeading,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainFont,
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.share_outlined,
                  color: AppColors.primary,
                ),
                title: const Text('Share this step'),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.dark200,
                ),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.bookmark_outline_rounded,
                  color: AppColors.primary,
                ),
                title: const Text('Bookmark for later'),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.dark200,
                ),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.flag_outlined,
                  color: AppColors.red,
                ),
                title: const Text('Report an issue'),
                trailing: const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.dark200,
                ),
                onTap: () {
                  Navigator.pop(ctx);
                  _reportOutdated(context);
                },
              ),
              const SizedBox(height: 12),
              FigmaSoftOutlineButton(
                label: 'Cancel',
                onPressed: () => Navigator.pop(ctx),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _reportOutdated(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Thank you! We'll review this information."),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
