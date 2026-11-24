library settle_data_flow_service;

/// Models for Settle system integrations and data flow specifications (Section 10)

enum IntegrationType {
  api,
  ios,
  settle,
  data,
  link,
  referral,
}

enum RolloutPhase {
  mvp,
  phase2,
  later,
  never,
}

class SystemIntegration {
  final String category;
  final String name;
  final IntegrationType type;
  final RolloutPhase phase;
  final String description;
  final List<String> screenReferences;

  const SystemIntegration({
    required this.category,
    required this.name,
    required this.type,
    required this.phase,
    required this.description,
    required this.screenReferences,
  });
}

/// Service interface representing on-device & remote sync architecture
abstract class ISettleDataFlowService {
  Future<bool> checkConnectivity();
  Future<Map<String, dynamic>> getOfflineCachedPlan();
  Future<void> syncPendingUpdates();
  Future<List<SystemIntegration>> getIntegrationDirectory();
}

class SettleDataFlowService implements ISettleDataFlowService {
  @override
  Future<bool> checkConnectivity() async {
    // In-app mock connectivity representation
    return true;
  }

  @override
  Future<Map<String, dynamic>> getOfflineCachedPlan() async {
    return {
      'cachedAt': '10:24 am',
      'isOfflineAvailable': true,
      'actions': [
        'Apply for your SIN',
        'Apply for Ontario health cards',
        'Register Sami & Nour for school',
      ],
    };
  }

  @override
  Future<void> syncPendingUpdates() async {
    // Syncs ticks, household, and preferences to Settle backend
  }

  @override
  Future<List<SystemIntegration>> getIntegrationDirectory() async {
    return const [
      SystemIntegration(
        category: 'Identity & accounts',
        name: 'Sign in with Apple',
        type: IntegrationType.api,
        phase: RolloutPhase.mvp,
        description: 'AuthenticationServices on phone; Apple REST endpoints to validate tokens and revoke them on account deletion.',
        screenReferences: ['1.2', '1.4', '8.10'],
      ),
      SystemIntegration(
        category: 'Identity & accounts',
        name: 'Google Sign-In',
        type: IntegrationType.api,
        phase: RolloutPhase.mvp,
        description: 'OAuth 2.0 / OpenID Connect.',
        screenReferences: ['1.2', '1.4'],
      ),
      SystemIntegration(
        category: 'Location & Nearby',
        name: 'Core Location',
        type: IntegrationType.ios,
        phase: RolloutPhase.mvp,
        description: 'Approximate location lookup on-device; never uploaded to server.',
        screenReferences: ['1.7', '5.1', '9.3'],
      ),
      SystemIntegration(
        category: 'Notifications & Calendar',
        name: 'UserNotifications',
        type: IntegrationType.ios,
        phase: RolloutPhase.mvp,
        description: 'Local scheduled notifications on-device.',
        screenReferences: ['1.6', '6.6', '6.8'],
      ),
      SystemIntegration(
        category: 'Notifications & Calendar',
        name: 'EventKit',
        type: IntegrationType.ios,
        phase: RolloutPhase.phase2,
        description: 'Native calendar event export.',
        screenReferences: ['6.7'],
      ),
      SystemIntegration(
        category: 'Offline Cache & Storage',
        name: 'Offline Cache',
        type: IntegrationType.settle,
        phase: RolloutPhase.mvp,
        description: 'Plan, checklists and crisis lines kept available without network.',
        screenReferences: ['9.2', '9.4'],
      ),
    ];
  }
}
