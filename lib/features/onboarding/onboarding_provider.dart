import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/user_profile.dart';

class OnboardingState {
  final MoveStage moveStage;
  final String province;
  final String city;
  final String arrivalMonth;
  final bool everyoneArrivedTogether;
  final String? immigrationStatus;
  final List<HouseholdMember> members;
  final Set<String> priorities;
  final bool showThreeAtATime;

  const OnboardingState({
    this.moveStage = MoveStage.arrivedUnder3Months,
    this.province = 'Ontario',
    this.city = 'Mississauga',
    this.arrivalMonth = 'September',
    this.everyoneArrivedTogether = true,
    this.immigrationStatus = 'Permanent resident',
    this.members = const [
      HouseholdMember(
        id: 'self',
        name: 'Layla',
        relationship: 'self',
        age: 34,
      ),
      HouseholdMember(
        id: 'partner',
        name: 'Omar',
        relationship: 'partner',
        age: 36,
        profession: 'Civil engineer',
      ),
      HouseholdMember(
        id: 'student',
        name: 'Yasmin',
        relationship: 'adultChild',
        age: 20,
        isStudent: true,
      ),
      HouseholdMember(
        id: 'child1',
        name: 'Sami',
        relationship: 'child',
        age: 7,
      ),
      HouseholdMember(
        id: 'child2',
        name: 'Nour',
        relationship: 'child',
        age: 13,
      ),
    ],
    this.priorities = const {'Paperwork', 'Housing', 'School'},
    this.showThreeAtATime = true,
  });

  OnboardingState copyWith({
    MoveStage? moveStage,
    String? province,
    String? city,
    String? arrivalMonth,
    bool? everyoneArrivedTogether,
    String? immigrationStatus,
    List<HouseholdMember>? members,
    Set<String>? priorities,
    bool? showThreeAtATime,
  }) {
    return OnboardingState(
      moveStage: moveStage ?? this.moveStage,
      province: province ?? this.province,
      city: city ?? this.city,
      arrivalMonth: arrivalMonth ?? this.arrivalMonth,
      everyoneArrivedTogether: everyoneArrivedTogether ?? this.everyoneArrivedTogether,
      immigrationStatus: immigrationStatus ?? this.immigrationStatus,
      members: members ?? this.members,
      priorities: priorities ?? this.priorities,
      showThreeAtATime: showThreeAtATime ?? this.showThreeAtATime,
    );
  }
}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(const OnboardingState());

  void setMoveStage(MoveStage stage) {
    state = state.copyWith(moveStage: stage);
  }

  void setDestination({
    required String province,
    required String city,
    required String arrivalMonth,
    required bool everyoneTogether,
  }) {
    state = state.copyWith(
      province: province,
      city: city,
      arrivalMonth: arrivalMonth,
      everyoneArrivedTogether: everyoneTogether,
    );
  }

  void setStatus(String? status) {
    state = state.copyWith(immigrationStatus: status);
  }

  void addMember(HouseholdMember member) {
    state = state.copyWith(members: [...state.members, member]);
  }

  void updateMember(HouseholdMember member) {
    state = state.copyWith(
      members: state.members.map((m) => m.id == member.id ? member : m).toList(),
    );
  }

  void removeMember(String id) {
    state = state.copyWith(
      members: state.members.where((m) => m.id != id).toList(),
    );
  }

  void togglePriority(String priority) {
    final next = Set<String>.from(state.priorities);
    if (next.contains(priority)) {
      next.remove(priority);
    } else {
      if (next.length < 3) {
        next.add(priority);
      }
    }
    state = state.copyWith(priorities: next);
  }

  void setDisplayMode(bool threeAtATime) {
    state = state.copyWith(showThreeAtATime: threeAtATime);
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});
