import '../models/user_profile.dart';

class RulesEngine {
  const RulesEngine();

  List<PlannedTask> generatePlan(UserProfile profile) {
    final tasks = <PlannedTask>[];

    // Stage 1: Status & Arrival
    tasks.add(
      const PlannedTask(
        id: 'task_pr_card',
        title: 'PR Card & Landing Documents',
        stageNumber: 1,
        state: TaskState.open,
        whyYouSeeThis: 'Essential proof of status for entry and settlement in Canada.',
      ),
    );

    // Stage 2: Paperwork (SIN, Health Card, CRA)
    tasks.add(
      const PlannedTask(
        id: 'task_sin',
        title: 'Social Insurance Number (SIN)',
        stageNumber: 2,
        state: TaskState.open,
        whyYouSeeThis: 'Required to work, open bank accounts, and file taxes in Canada.',
      ),
    );

    // CRA Account lock rule: Locked until first tax return is filed
    final craLocked = !profile.hasFiledTaxReturn;
    tasks.add(
      PlannedTask(
        id: 'task_cra',
        title: 'CRA My Account',
        stageNumber: 2,
        state: craLocked ? TaskState.locked : TaskState.open,
        whyYouSeeThis: 'Access Canada Revenue Agency tax notices and benefits directly.',
        lockedReason: craLocked ? 'Unlocks after filing your first Canadian tax return.' : null,
      ),
    );

    // Stage 4: Schools & Language
    final hasSchoolAgeChildren = profile.members.any((m) => m.age >= 4 && m.age <= 18);
    if (hasSchoolAgeChildren) {
      tasks.add(
        const PlannedTask(
          id: 'task_school_reg',
          title: 'Register Children for School',
          stageNumber: 4,
          state: TaskState.open,
          whyYouSeeThis: 'You indicated having school-age children in your household.',
        ),
      );

      // English support rule: Unlocks after school registration
      final eslLocked = !profile.hasRegisteredSchool;
      tasks.add(
        PlannedTask(
          id: 'task_esl_support',
          title: 'English as a Second Language (ESL) Support',
          stageNumber: 4,
          state: eslLocked ? TaskState.locked : TaskState.open,
          whyYouSeeThis: 'Language assessment and support through your local school board.',
          lockedReason: eslLocked ? 'Unlocks after registering at your neighborhood school board.' : null,
        ),
      );
    }

    // Stage 7: Health & Dental
    // Dental plan lock rule: Canadian Dental Care Plan locked until tax return
    final dentalLocked = !profile.hasFiledTaxReturn;
    tasks.add(
      PlannedTask(
        id: 'task_dental_plan',
        title: 'Canadian Dental Care Plan',
        stageNumber: 7,
        state: dentalLocked ? TaskState.locked : TaskState.open,
        whyYouSeeThis: 'Government dental coverage based on adjusted family net income.',
        lockedReason: dentalLocked ? 'Requires proof of income from your notice of assessment.' : null,
      ),
    );

    // Campus services (4.30) lock rule: Always locked until enrollment confirmed
    final hasStudent = profile.members.any((m) => m.isStudent || m.age >= 18);
    if (hasStudent) {
      tasks.add(
        const PlannedTask(
          id: 'task_campus_services',
          title: 'Campus Services & Support',
          stageNumber: 4,
          state: TaskState.locked,
          whyYouSeeThis: 'On-campus health, international student, and career services.',
          lockedReason: 'Unlocks upon verification of active student enrollment.',
        ),
      );
    }

    return tasks;
  }
}

