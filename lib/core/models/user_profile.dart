enum MoveStage {
  exploring,
  waiting,
  approved,
  arrivedUnder3Months,
  settled3Plus,
}

enum TaskState {
  open,
  locked,
  done,
  snoozed,
  dismissed,
}

class HouseholdMember {
  final String id;
  final String name;
  final String relationship; // self, partner, child, adultChild
  final int age;
  final bool isStudent;
  final String? profession;

  const HouseholdMember({
    required this.id,
    required this.name,
    required this.relationship,
    required this.age,
    this.isStudent = false,
    this.profession,
  });
}

class UserProfile {
  final String id;
  final String name;
  final MoveStage stage;
  final String province; // e.g. "ON", "BC", "QC", "MB"
  final String city;
  final String? status; // optional immigration status
  final List<HouseholdMember> members;
  final bool hasFiledTaxReturn;
  final bool hasRegisteredSchool;

  const UserProfile({
    required this.id,
    required this.name,
    required this.stage,
    required this.province,
    required this.city,
    this.status,
    this.members = const [],
    this.hasFiledTaxReturn = false,
    this.hasRegisteredSchool = false,
  });
}

class PlannedTask {
  final String id;
  final String title;
  final int stageNumber;
  final TaskState state;
  final String whyYouSeeThis;
  final String? lockedReason;
  final String? assignedMemberId;

  const PlannedTask({
    required this.id,
    required this.title,
    required this.stageNumber,
    required this.state,
    required this.whyYouSeeThis,
    this.lockedReason,
    this.assignedMemberId,
  });
}

