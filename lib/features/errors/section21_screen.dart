import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'section21_data.dart';

class Section21Screen extends StatelessWidget {
  final String screenId;

  const Section21Screen({
    super.key,
    required this.screenId,
  });

  @override
  Widget build(BuildContext context) {
    final model = allSection21Screens[screenId] ??
        Section21Model(
          id: screenId,
          title: screenId,
          tag: 'SETTLE',
          desc: '',
          sections: const [],
        );

    final isRTL = screenId == 'HomeAR' || screenId == 'TaskPrestoAR';
    final isNeutral = screenId == 'LeaveQuickly';

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: isNeutral ? Colors.white : const Color(0xFFF4F4F5),
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top header / back button
                if (!isNeutral)
                  Align(
                    alignment: isRTL
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        isRTL ? Icons.arrow_forward : Icons.arrow_back,
                        color: const Color(0xFF123332),
                      ),
                      onPressed: () => context.pop(),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 44, minHeight: 44),
                    ),
                  ),
                if (!isNeutral) const SizedBox(height: 8),

                // Title block
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (model.tag.isNotEmpty) ...[
                      Text(
                        model.tag.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                          color: Color(0xFFA82227),
                        ),
                      ),
                      const SizedBox(height: 6),
                    ],
                    Text(
                      model.title,
                      style: TextStyle(
                        fontFamily: isRTL ? 'IBM Plex Sans Arabic' : 'Bricolage Grotesque',
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: isRTL ? 0 : -0.6,
                        height: 1.1,
                        color: const Color(0xFF123332),
                      ),
                    ),
                    if (model.desc.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        model.desc,
                        style: TextStyle(
                          fontFamily: isRTL ? 'IBM Plex Sans Arabic' : 'IBM Plex Sans',
                          fontSize: 15,
                          height: 1.45,
                          color: const Color(0xFF3B4747),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),

                // Special handling for LeaveQuickly (neutral weather page)
                if (isNeutral) ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '21°C · Sunny',
                          style: TextStyle(
                            fontFamily: 'Bricolage Grotesque',
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF123332),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Mississauga · Updated 5 min ago',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            color: Color(0xFF5A5F6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

                // Action buttons or sections
                ...model.sections.map((sec) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFDEDEE2)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      sec,
                      style: TextStyle(
                        fontFamily: isRTL ? 'IBM Plex Sans Arabic' : 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.45,
                        color: const Color(0xFF123332),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (isNeutral) {
                      context.go('/');
                    } else {
                      context.pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123332),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isRTL
                        ? 'رجوع'
                        : isNeutral
                            ? 'Close'
                            : 'OK',
                    style: const TextStyle(
                      fontFamily: 'IBM Plex Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
