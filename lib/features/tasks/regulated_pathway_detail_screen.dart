import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:settle_app/features/tasks/models/pathway_data.dart';

class RegulatedPathwayDetailScreen extends StatefulWidget {
  final String pathwayId;

  const RegulatedPathwayDetailScreen({
    super.key,
    required this.pathwayId,
  });

  @override
  State<RegulatedPathwayDetailScreen> createState() =>
      _RegulatedPathwayDetailScreenState();
}

class _RegulatedPathwayDetailScreenState
    extends State<RegulatedPathwayDetailScreen> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    final pathway = allRegulatedPathways[widget.pathwayId];

    if (pathway == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF4F4F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF4F4F5),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
            onPressed: () => context.pop(),
          ),
          title: const Text('Pathway not found'),
        ),
        body: Center(
          child: Text('Pathway ${widget.pathwayId} not found'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF123332)),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Color(0xFF123332)),
                    onPressed: () => _showMoreOptions(context),
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 44, minHeight: 44),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Category tag & Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pathway.category.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                      color: Color(0xFFA82227),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    pathway.title,
                    style: const TextStyle(
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.6,
                      height: 1.08,
                      color: Color(0xFF123332),
                    ),
                  ),
                  if (pathway.regulatorInfo.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      pathway.regulatorInfo,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 15,
                        height: 1.45,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),

              // Needs a licence note box
              if (pathway.noteTitle.isNotEmpty || pathway.noteBody.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2ECEB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (pathway.noteTitle.isNotEmpty)
                        Text(
                          pathway.noteTitle,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF123332),
                          ),
                        ),
                      if (pathway.noteBody.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          pathway.noteBody,
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            height: 1.45,
                            color: Color(0xFF123332),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              if (pathway.noteTitle.isNotEmpty || pathway.noteBody.isNotEmpty)
                const SizedBox(height: 16),

              // Certificates you need
              if (pathway.certificates.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFDEDEE2)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Certificates you need',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123332),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...pathway.certificates.map((cert) {
                        final isGoal = cert.badge.toLowerCase() == 'goal';
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Color(0xFFEAEAEC)),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: isGoal
                                      ? const Color(0xFF123332)
                                      : const Color(0xFFEAEAEC),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  cert.badge,
                                  style: TextStyle(
                                    fontFamily: 'IBM Plex Sans',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: isGoal
                                        ? Colors.white
                                        : const Color(0xFF3B4747),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cert.title,
                                      style: const TextStyle(
                                        fontFamily: 'IBM Plex Sans',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF123332),
                                      ),
                                    ),
                                    if (cert.subtitle.isNotEmpty) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        cert.subtitle,
                                        style: const TextStyle(
                                          fontFamily: 'IBM Plex Sans',
                                          fontSize: 13,
                                          color: Color(0xFF5A5F6B),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Your pathway steps
              if (pathway.steps.isNotEmpty) ...[
                const Text(
                  'Your pathway',
                  style: TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123332),
                  ),
                ),
                const SizedBox(height: 10),
                ...pathway.steps.asMap().entries.map((entry) {
                  final idx = entry.key + 1;
                  final stepText = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xFF123332),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$idx',
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            stepText,
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
                const SizedBox(height: 8),
              ],

              // Free help section
              if (pathway.helpItems.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFDEDEE2)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Free help',
                            style: TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF123332),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3EFE8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Free',
                              style: TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F4A36),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      ...pathway.helpItems.map((item) {
                        return InkWell(
                          onTap: () {
                            if (context.mounted) {
                              context.push('/tasks/task-work');
                            }
                          },
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 52),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0xFFEAEAEC)),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontFamily: 'IBM Plex Sans',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF123332),
                                        ),
                                      ),
                                      if (item.subtitle.isNotEmpty) ...[
                                        const SizedBox(height: 2),
                                        Text(
                                          item.subtitle,
                                          style: const TextStyle(
                                            fontFamily: 'IBM Plex Sans',
                                            fontSize: 13,
                                            color: Color(0xFF5A5F6B),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  size: 18,
                                  color: Color(0xFF7A7A83),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Official source card
              if (pathway.officialSource != null) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFDEDEE2)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.open_in_new,
                        size: 22,
                        color: Color(0xFF123332),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pathway.officialSource!.title,
                              style: const TextStyle(
                                fontFamily: 'IBM Plex Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF123332),
                              ),
                            ),
                            if (pathway.officialSource!.subtitle.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(
                                pathway.officialSource!.subtitle,
                                style: const TextStyle(
                                  fontFamily: 'IBM Plex Sans',
                                  fontSize: 13,
                                  color: Color(0xFF5A5F6B),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Action buttons
              ElevatedButton(
                onPressed: () {
                  setState(() => _isDone = !_isDone);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_isDone
                          ? 'Pathway marked as done'
                          : 'Pathway marked as not done'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDone
                      ? const Color(0xFF2E6B4F)
                      : const Color(0xFF123332),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text(_isDone ? 'Completed' : 'Mark as done'),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Reminder set for later'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF123332),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFC8C8CE)),
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Remind me later'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF123332),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFC8C8CE)),
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Not for me'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push('/help');
                    },
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
                    onPressed: () {
                      _showReportDialog(context);
                    },
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

              // Disclaimer
              if (pathway.disclaimer.isNotEmpty)
                Text(
                  pathway.disclaimer,
                  style: const TextStyle(
                    fontFamily: 'IBM Plex Sans',
                    fontSize: 12,
                    height: 1.45,
                    color: Color(0xFF5A5F6B),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share, color: Color(0xFF123332)),
                title: const Text('Share pathway'),
                onTap: () => Navigator.pop(ctx),
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_border, color: Color(0xFF123332)),
                title: const Text('Save to favourites'),
                onTap: () => Navigator.pop(ctx),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Report outdated info'),
        content: const Text(
            'Thank you for helping us keep licensing pathways up to date. Our team will review this regulatory pathway.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
