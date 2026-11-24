import 'package:flutter/material.dart';
import '../../core/services/settle_data_flow_service.dart';

class IntegrationMapScreen extends StatelessWidget {
  const IntegrationMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryDark = Color(0xFF123332);
    const borderCard = Color(0xFFDEDEE2);
    final service = SettleDataFlowService();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      appBar: AppBar(
        title: const Text(
          'API & Integration Map',
          style: TextStyle(
            fontFamily: 'Bricolage Grotesque',
            fontWeight: FontWeight.w800,
            color: primaryDark,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryDark),
      ),
      body: FutureBuilder<List<SystemIntegration>>(
        future: service.getIntegrationDirectory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final integrations = snapshot.data!;
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: integrations.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = integrations[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderCard),
                ),
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
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: primaryDark,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3EFE8),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.phase.name.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: 'IBM Plex Sans',
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F4A36),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.description,
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xFF3B4747),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Screens: ${item.screenReferences.join(" · ")}',
                      style: const TextStyle(
                        fontFamily: 'IBM Plex Sans',
                        fontSize: 12,
                        color: Color(0xFF5A5F6B),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
