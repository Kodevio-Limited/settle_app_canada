import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:settle_app/core/theme/app_colors.dart';
import 'package:settle_app/features/tasks/models/task_data.dart';

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
    // Default first checklist item checked if present in spec (e.g. SIN / Licence)
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
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Color(0xFF123332)),
                    onPressed: () => _showMoreOptions(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Completed banner if done
              if (isDone) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EFE8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E6B4F),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          task.completedText ?? 'Done for everyone · Sep 20',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F4A36),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Undo',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Tag & Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.tag.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: isDone ? const Color(0xFF2E6B4F) : const Color(0xFFA82227),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.1,
                      color: Color(0xFF123332),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // For whom block
                  if (task.forWhom.isNotEmpty) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'For ',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            color: Color(0xFF3B4747),
                          ),
                        ),
                        Wrap(
                          spacing: 6,
                          children: task.forWhom.map((person) {
                            return Container(
                              height: 30,
                              padding: const EdgeInsets.only(left: 4, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: const Color(0xFFDEDEE2)),
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
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 14,
                                      color: Color(0xFF123332),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ] else if (task.forWhomNote != null) ...[
                    Text(
                      task.forWhomNote!,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),

              // Why you're seeing this box
              if (task.whyTags.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2ECEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Why you're seeing this",
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123332),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: task.whyTags.map((tagText) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tagText,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 13,
                                color: Color(0xFF123332),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => context.push('/household-summary'),
                        child: const Text(
                          'Something wrong? Update your answers',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF123332),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // 4-Stat Grid / 2-Stat Grid
              if (task.stats.isNotEmpty) ...[
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.3,
                  ),
                  itemCount: task.stats.length,
                  itemBuilder: (context, idx) {
                    final stat = task.stats[idx];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            stat.label,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 12,
                              color: Color(0xFF5A5F6B),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            stat.value,
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF123332),
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
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: List.generate(task.steps.length, (idx) {
                    final stepNumber = idx + 1;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                              color: isDone ? const Color(0xFF2E6B4F) : const Color(0xFF123332),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$stepNumber',
                                style: const TextStyle(
                                  fontFamily: 'IBM Plex Sans',
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
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 15,
                                height: 1.45,
                                color: Color(0xFF123332),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
              ],

              // What to bring / Have ready Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDEDEE2)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          task.bringTitle,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
                          ),
                        ),
                        if (task.checklist.isNotEmpty)
                          GestureDetector(
                            onTap: () => context.push('/checklists'),
                            child: const Text(
                              'All checklists',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF123332),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: Checkbox(
                                    value: isChecked,
                                    activeColor: const Color(0xFF2E6B4F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
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
                                      fontFamily: 'IBM Plex Sans',
                                      fontSize: 15,
                                      color: Color(0xFF123332),
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
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          height: 1.45,
                          color: Color(0xFF3B4747),
                        ),
                      ),
                    ],
                    if (task.checklistFootnote != null) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          task.checklistFootnote!,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 13,
                            height: 1.4,
                            color: Color(0xFF3B4747),
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
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
                const SizedBox(height: 10),
                if (task.nearbyNote != null) ...[
                  Text(
                    task.nearbyNote!,
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 14,
                      height: 1.45,
                      color: Color(0xFF3B4747),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // Map SVG representation for TaskSIN
                if (task.hasMap) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 150,
                      color: const Color(0xFFE9E9EC),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            width: 100,
                            child: Container(color: const Color(0xFFCFE0EA)),
                          ),
                          Positioned(
                            left: 28,
                            bottom: 18,
                            width: 72,
                            height: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9E6D2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          // Road markings
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 60,
                            height: 6,
                            child: Container(color: Colors.white),
                          ),
                          Positioned(
                            left: 0,
                            right: 58,
                            top: 118,
                            height: 6,
                            child: Container(color: Colors.white),
                          ),
                          Positioned(
                            left: 120,
                            top: 0,
                            bottom: 0,
                            width: 6,
                            child: Container(color: Colors.white),
                          ),
                          Positioned(
                            left: 212,
                            top: 0,
                            bottom: 0,
                            width: 6,
                            child: Container(color: Colors.white),
                          ),
                          // Blue location dot
                          Positioned(
                            left: 135,
                            top: 71,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2F6FB5).withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2F6FB5),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Pin 1
                          Positioned(
                            right: 120,
                            top: 24,
                            child: _buildMapPin('1'),
                          ),
                          // Pin 2
                          Positioned(
                            left: 62,
                            top: 50,
                            child: _buildMapPin('2'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                // Nearby cards
                ...task.nearbyItems.map((item) {
                  return InkWell(
                    onTap: () => context.push('/location-detail'),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFDEDEE2)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(
                              color: Color(0xFF123332),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                item.num,
                                style: const TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
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
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF123332),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  item.sub,
                                  style: const TextStyle(
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 13,
                                    color: Color(0xFF5A5F6B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, size: 20, color: Color(0xFF7A7A83)),
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
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
              ],

              // Official source card
              if (task.sourceName.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFDEDEE2)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.open_in_new, size: 22, color: Color(0xFF123332)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.sourceName,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF123332),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              task.sourceSub,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 13,
                                color: Color(0xFF5A5F6B),
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
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () => context.push('/done-picker'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF123332),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'Mark as done',
                      style: TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                            side: const BorderSide(color: Color(0xFFC8C8CE)),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Remind me later',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF123332),
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
                            side: const BorderSide(color: Color(0xFFC8C8CE)),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Not for me',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF123332),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => context.push('/help'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Ask a settlement worker',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF123332),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/report-outdated'),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Report outdated info',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF123332),
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
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 12,
                  height: 1.45,
                  color: Color(0xFF5A5F6B),
                ),
              ),
              const SizedBox(height: 32),
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
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFF123332),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              num,
              style: const TextStyle(
                fontFamily: 'IBM Plex Sans',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        CustomPaint(
          size: const Size(8, 6),
          painter: _TrianglePainter(color: const Color(0xFF123332)),
        ),
      ],
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share_outlined, color: Color(0xFF123332)),
                title: const Text('Share this step'),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_outline, color: Color(0xFF123332)),
                title: const Text('Bookmark for later'),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                leading: const Icon(Icons.flag_outlined, color: Color(0xFFA82227)),
                title: const Text('Report an issue'),
                onTap: () {
                  Navigator.pop(ctx);
                  _reportOutdated(context);
                },
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
