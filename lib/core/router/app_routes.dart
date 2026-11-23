// GENERATED FILE - DO NOT MODIFY DIRECTLY
// Generated from canvas.json and _spec_export screens

enum ScreenKind { screen, sheet, dialog, state }

class AppRouteInfo {
  final String name;
  final String path;
  final String file;
  final String title;
  final ScreenKind kind;

  const AppRouteInfo({
    required this.name,
    required this.path,
    required this.file,
    required this.title,
    required this.kind,
  });
}

abstract final class AppRoutes {
  static const AppRouteInfo main = AppRouteInfo(
    name: 'main',
    path: '/',
    file: 'Main.dc.html',
    title: '1.1 Welcome',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo signup = AppRouteInfo(
    name: 'signup',
    path: '/sign-up',
    file: 'SignUp.dc.html',
    title: '1.2 Create account',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo verifyemail = AppRouteInfo(
    name: 'verifyemail',
    path: '/verify-email',
    file: 'VerifyEmail.dc.html',
    title: '1.3 Verify email',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo signin = AppRouteInfo(
    name: 'signin',
    path: '/sign-in',
    file: 'SignIn.dc.html',
    title: '1.4 Sign in (returning)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo consent = AppRouteInfo(
    name: 'consent',
    path: '/consent',
    file: 'Consent.dc.html',
    title: '1.5 Privacy consent',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo notifpermission = AppRouteInfo(
    name: 'notifpermission',
    path: '/notif-permission',
    file: 'NotifPermission.dc.html',
    title: '1.6 Reminders permission',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo locationpermission = AppRouteInfo(
    name: 'locationpermission',
    path: '/location-permission',
    file: 'LocationPermission.dc.html',
    title: '1.7 Location permission',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stage = AppRouteInfo(
    name: 'stage',
    path: '/stage',
    file: 'Stage.dc.html',
    title: '2.1 Onboarding · Stage',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo destination = AppRouteInfo(
    name: 'destination',
    path: '/destination',
    file: 'Destination.dc.html',
    title: '2.2 Onboarding · Destination',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo status = AppRouteInfo(
    name: 'status',
    path: '/status',
    file: 'Status.dc.html',
    title: '2.3 Onboarding · Status (optional)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo household = AppRouteInfo(
    name: 'household',
    path: '/household',
    file: 'Household.dc.html',
    title: '2.4 Onboarding · Household',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo addchild = AppRouteInfo(
    name: 'addchild',
    path: '/add-child',
    file: 'AddChild.dc.html',
    title: '2.5 Add a child',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo addadult = AppRouteInfo(
    name: 'addadult',
    path: '/add-adult',
    file: 'AddAdult.dc.html',
    title: '2.6 Add an adult',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo priorities = AppRouteInfo(
    name: 'priorities',
    path: '/priorities',
    file: 'Priorities.dc.html',
    title: '2.7 Onboarding · Priorities',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo planready = AppRouteInfo(
    name: 'planready',
    path: '/plan-ready',
    file: 'PlanReady.dc.html',
    title: '2.8 Plan ready',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo addstudent = AppRouteInfo(
    name: 'addstudent',
    path: '/add-student',
    file: 'AddStudent.dc.html',
    title: '2.9 Add an adult child (student)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo home = AppRouteInfo(
    name: 'home',
    path: '/home',
    file: 'Home.dc.html',
    title: '3.1 Home · Next 3 actions',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo journey = AppRouteInfo(
    name: 'journey',
    path: '/journey',
    file: 'Journey.dc.html',
    title: '3.2 Journey · 10 stages',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagestatus = AppRouteInfo(
    name: 'stagestatus',
    path: '/stage-status',
    file: 'StageStatus.dc.html',
    title: '3.3 Stage 1 · Status & arrival documents',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagepaperwork = AppRouteInfo(
    name: 'stagepaperwork',
    path: '/stage-paperwork',
    file: 'StagePaperwork.dc.html',
    title: '3.4 Stage 2 · Paperwork',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagehousing = AppRouteInfo(
    name: 'stagehousing',
    path: '/stage-housing',
    file: 'StageHousing.dc.html',
    title: '3.5 Stage 3 · Housing',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stageschools = AppRouteInfo(
    name: 'stageschools',
    path: '/stage-schools',
    file: 'StageSchools.dc.html',
    title: '3.6 Stage 4 · School, college & university',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagecar = AppRouteInfo(
    name: 'stagecar',
    path: '/stage-car',
    file: 'StageCar.dc.html',
    title: '3.7 Stage 5 · Car & driving',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stageinsurance = AppRouteInfo(
    name: 'stageinsurance',
    path: '/stage-insurance',
    file: 'StageInsurance.dc.html',
    title: '3.8 Stage 6 · Insurance',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagehealth = AppRouteInfo(
    name: 'stagehealth',
    path: '/stage-health',
    file: 'StageHealth.dc.html',
    title: '3.9 Stage 7 · Health care',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagemoney = AppRouteInfo(
    name: 'stagemoney',
    path: '/stage-money',
    file: 'StageMoney.dc.html',
    title: '3.10 Stage 8 · Money & benefits',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagework = AppRouteInfo(
    name: 'stagework',
    path: '/stage-work',
    file: 'StageWork.dc.html',
    title: '3.11 Stage 9 · Work & credentials',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stagecommunity = AppRouteInfo(
    name: 'stagecommunity',
    path: '/stage-community',
    file: 'StageCommunity.dc.html',
    title: '3.12 Stage 10 · Community & belonging',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo stageuniversity = AppRouteInfo(
    name: 'stageuniversity',
    path: '/stage-university',
    file: 'StageUniversity.dc.html',
    title: '3.6b Stage 4 · University & college stream',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskstatus = AppRouteInfo(
    name: 'taskstatus',
    path: '/task-status',
    file: 'TaskStatus.dc.html',
    title: '4.1 Task · PR card (completed state)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasksin = AppRouteInfo(
    name: 'tasksin',
    path: '/task-s-i-n',
    file: 'TaskSIN.dc.html',
    title: '4.2 Task · SIN (full detail)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskhousing = AppRouteInfo(
    name: 'taskhousing',
    path: '/task-housing',
    file: 'TaskHousing.dc.html',
    title: '4.3 Task · Tenant rights before a lease',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskschool = AppRouteInfo(
    name: 'taskschool',
    path: '/task-school',
    file: 'TaskSchool.dc.html',
    title: '4.4 Task · School registration',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasklicence = AppRouteInfo(
    name: 'tasklicence',
    path: '/task-licence',
    file: 'TaskLicence.dc.html',
    title: '4.5 Task · Driver\'s licence',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskinsurance = AppRouteInfo(
    name: 'taskinsurance',
    path: '/task-insurance',
    file: 'TaskInsurance.dc.html',
    title: '4.6 Task · Auto insurance',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskdoctor = AppRouteInfo(
    name: 'taskdoctor',
    path: '/task-doctor',
    file: 'TaskDoctor.dc.html',
    title: '4.7 Task · Family doctor',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskccb = AppRouteInfo(
    name: 'taskccb',
    path: '/task-c-c-b',
    file: 'TaskCCB.dc.html',
    title: '4.8 Task · Canada Child Benefit',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskwork = AppRouteInfo(
    name: 'taskwork',
    path: '/task-work',
    file: 'TaskWork.dc.html',
    title: '4.9 Task · Employment services',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasklibrary = AppRouteInfo(
    name: 'tasklibrary',
    path: '/task-library',
    file: 'TaskLibrary.dc.html',
    title: '4.10 Task · Library card',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskuniapply = AppRouteInfo(
    name: 'taskuniapply',
    path: '/task-uni-apply',
    file: 'TaskUniApply.dc.html',
    title: '4.11 Task · Apply to university or college',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskosap = AppRouteInfo(
    name: 'taskosap',
    path: '/task-o-s-a-p',
    file: 'TaskOSAP.dc.html',
    title: '4.12 Task · OSAP student aid',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo occupationsearch = AppRouteInfo(
    name: 'occupationsearch',
    path: '/occupation-search',
    file: 'OccupationSearch.dc.html',
    title: '4.13 Does your job need a licence?',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo occupationpathway = AppRouteInfo(
    name: 'occupationpathway',
    path: '/occupation-pathway',
    file: 'OccupationPathway.dc.html',
    title: '4.14 Licensing pathway · P.Eng.',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo nearby = AppRouteInfo(
    name: 'nearby',
    path: '/nearby',
    file: 'Nearby.dc.html',
    title: '5.1 Nearby locations (map)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo locationdetail = AppRouteInfo(
    name: 'locationdetail',
    path: '/location-detail',
    file: 'LocationDetail.dc.html',
    title: '5.2 Location detail',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo donepicker = AppRouteInfo(
    name: 'donepicker',
    path: '/done-picker',
    file: 'DonePicker.dc.html',
    title: '5.3 Mark done · who did it',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo taskdone = AppRouteInfo(
    name: 'taskdone',
    path: '/task-done',
    file: 'TaskDone.dc.html',
    title: '5.4 Task done · unlocked next',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo snooze = AppRouteInfo(
    name: 'snooze',
    path: '/snooze',
    file: 'Snooze.dc.html',
    title: '5.5 Remind me later',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo dismiss = AppRouteInfo(
    name: 'dismiss',
    path: '/dismiss',
    file: 'Dismiss.dc.html',
    title: '5.6 Not for me',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo reportoutdated = AppRouteInfo(
    name: 'reportoutdated',
    path: '/report-outdated',
    file: 'ReportOutdated.dc.html',
    title: '5.7 Report outdated info',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo contentupdated = AppRouteInfo(
    name: 'contentupdated',
    path: '/content-updated',
    file: 'ContentUpdated.dc.html',
    title: '5.8 A step changed (content update)',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo family = AppRouteInfo(
    name: 'family',
    path: '/family',
    file: 'Family.dc.html',
    title: '6.1 Family',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo memberadult = AppRouteInfo(
    name: 'memberadult',
    path: '/member-adult',
    file: 'MemberAdult.dc.html',
    title: '6.2 Family member · adult',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo memberchild = AppRouteInfo(
    name: 'memberchild',
    path: '/member-child',
    file: 'MemberChild.dc.html',
    title: '6.3 Family member · child',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo removemember = AppRouteInfo(
    name: 'removemember',
    path: '/remove-member',
    file: 'RemoveMember.dc.html',
    title: '6.4 Remove a family member',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo checklist = AppRouteInfo(
    name: 'checklist',
    path: '/checklist',
    file: 'Checklist.dc.html',
    title: '6.5 What to bring (replaces uploads)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo reminders = AppRouteInfo(
    name: 'reminders',
    path: '/reminders',
    file: 'Reminders.dc.html',
    title: '6.6 Reminders · upcoming',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo calendar = AppRouteInfo(
    name: 'calendar',
    path: '/calendar',
    file: 'Calendar.dc.html',
    title: '6.7 Reminders · calendar',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo notificationsettings = AppRouteInfo(
    name: 'notificationsettings',
    path: '/notification-settings',
    file: 'NotificationSettings.dc.html',
    title: '6.8 Notification settings',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo lifeevent = AppRouteInfo(
    name: 'lifeevent',
    path: '/life-event',
    file: 'LifeEvent.dc.html',
    title: '6.9 Something changed?',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo planchange = AppRouteInfo(
    name: 'planchange',
    path: '/plan-change',
    file: 'PlanChange.dc.html',
    title: '6.10 Plan recalculated',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo justtoday = AppRouteInfo(
    name: 'justtoday',
    path: '/just-today',
    file: 'JustToday.dc.html',
    title: '6.11 Just today mode',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo search = AppRouteInfo(
    name: 'search',
    path: '/search',
    file: 'Search.dc.html',
    title: '6.12 Search',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo memberstudent = AppRouteInfo(
    name: 'memberstudent',
    path: '/member-student',
    file: 'MemberStudent.dc.html',
    title: '6.13 Family member · university student',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo help = AppRouteInfo(
    name: 'help',
    path: '/help',
    file: 'Help.dc.html',
    title: '7.1 Trusted help',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo communitygroups = AppRouteInfo(
    name: 'communitygroups',
    path: '/community-groups',
    file: 'CommunityGroups.dc.html',
    title: '7.2 Community groups',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo checkin = AppRouteInfo(
    name: 'checkin',
    path: '/check-in',
    file: 'CheckIn.dc.html',
    title: '7.3 Weekly check-in',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo conversationguide = AppRouteInfo(
    name: 'conversationguide',
    path: '/conversation-guide',
    file: 'ConversationGuide.dc.html',
    title: '7.4 Family conversation guide',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo crisis = AppRouteInfo(
    name: 'crisis',
    path: '/crisis',
    file: 'Crisis.dc.html',
    title: '7.5 Get help now',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo howguidance = AppRouteInfo(
    name: 'howguidance',
    path: '/how-guidance',
    file: 'HowGuidance.dc.html',
    title: '7.6 How our guidance works',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo settings = AppRouteInfo(
    name: 'settings',
    path: '/settings',
    file: 'Settings.dc.html',
    title: '8.1 Me · Settings',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo editprofile = AppRouteInfo(
    name: 'editprofile',
    path: '/edit-profile',
    file: 'EditProfile.dc.html',
    title: '8.2 Edit profile',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo privacydata = AppRouteInfo(
    name: 'privacydata',
    path: '/privacy-data',
    file: 'PrivacyData.dc.html',
    title: '8.3 Privacy & my data',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo dataexport = AppRouteInfo(
    name: 'dataexport',
    path: '/data-export',
    file: 'DataExport.dc.html',
    title: '8.4 Download my data',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo languageaccess = AppRouteInfo(
    name: 'languageaccess',
    path: '/language-access',
    file: 'LanguageAccess.dc.html',
    title: '8.5 Language & accessibility',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo signoutconfirm = AppRouteInfo(
    name: 'signoutconfirm',
    path: '/sign-out-confirm',
    file: 'SignOutConfirm.dc.html',
    title: '8.6 Sign out',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo deactivate = AppRouteInfo(
    name: 'deactivate',
    path: '/deactivate',
    file: 'Deactivate.dc.html',
    title: '8.7 Pause or delete',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo paused = AppRouteInfo(
    name: 'paused',
    path: '/paused',
    file: 'Paused.dc.html',
    title: '8.8 Account paused',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo welcomeback = AppRouteInfo(
    name: 'welcomeback',
    path: '/welcome-back',
    file: 'WelcomeBack.dc.html',
    title: '8.9 Welcome back (after pause)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo deleteconfirm = AppRouteInfo(
    name: 'deleteconfirm',
    path: '/delete-confirm',
    file: 'DeleteConfirm.dc.html',
    title: '8.10 Confirm deletion',
    kind: ScreenKind.dialog,
  );

  static const AppRouteInfo deleted = AppRouteInfo(
    name: 'deleted',
    path: '/deleted',
    file: 'Deleted.dc.html',
    title: '8.11 Account deleted',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo guesthome = AppRouteInfo(
    name: 'guesthome',
    path: '/guest-home',
    file: 'GuestHome.dc.html',
    title: '9.1 Exploring without an account',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo offline = AppRouteInfo(
    name: 'offline',
    path: '/offline',
    file: 'Offline.dc.html',
    title: '9.2 Offline',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo locationdenied = AppRouteInfo(
    name: 'locationdenied',
    path: '/location-denied',
    file: 'LocationDenied.dc.html',
    title: '9.3 Location turned off',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo servererror = AppRouteInfo(
    name: 'servererror',
    path: '/server-error',
    file: 'ServerError.dc.html',
    title: '9.4 Something went wrong',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo integrationmap = AppRouteInfo(
    name: 'integrationmap',
    path: '/integration-map',
    file: 'IntegrationMap.dc.html',
    title: '10.1 API & integration map',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo dataflow = AppRouteInfo(
    name: 'dataflow',
    path: '/data-flow',
    file: 'DataFlow.dc.html',
    title: '10.2 System data flow',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasklandingdocs = AppRouteInfo(
    name: 'tasklandingdocs',
    path: '/task-landing-docs',
    file: 'TaskLandingDocs.dc.html',
    title: '4.15 Task · Landing documents',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskprbasics = AppRouteInfo(
    name: 'taskprbasics',
    path: '/task-p-r-basics',
    file: 'TaskPRBasics.dc.html',
    title: '4.16 Task · Keeping PR status',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskhealthcard = AppRouteInfo(
    name: 'taskhealthcard',
    path: '/task-health-card',
    file: 'TaskHealthCard.dc.html',
    title: '4.17 Task · Ontario health cards',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcra = AppRouteInfo(
    name: 'taskcra',
    path: '/task-c-r-a',
    file: 'TaskCRA.dc.html',
    title: '4.18 Task · CRA account (locked)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskpresto = AppRouteInfo(
    name: 'taskpresto',
    path: '/task-presto',
    file: 'TaskPresto.dc.html',
    title: '4.19 Task · PRESTO card',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskscams = AppRouteInfo(
    name: 'taskscams',
    path: '/task-scams',
    file: 'TaskScams.dc.html',
    title: '4.20 Task · Rental scams',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasklease = AppRouteInfo(
    name: 'tasklease',
    path: '/task-lease',
    file: 'TaskLease.dc.html',
    title: '4.21 Task · Standard lease',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskutilities = AppRouteInfo(
    name: 'taskutilities',
    path: '/task-utilities',
    file: 'TaskUtilities.dc.html',
    title: '4.22 Task · Hydro, gas & internet',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasktenantinsurance = AppRouteInfo(
    name: 'tasktenantinsurance',
    path: '/task-tenant-insurance',
    file: 'TaskTenantInsurance.dc.html',
    title: '4.23 Task · Tenant insurance',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskimmunization = AppRouteInfo(
    name: 'taskimmunization',
    path: '/task-immunization',
    file: 'TaskImmunization.dc.html',
    title: '4.24 Task · School vaccines',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskesl = AppRouteInfo(
    name: 'taskesl',
    path: '/task-e-s-l',
    file: 'TaskESL.dc.html',
    title: '4.25 Task · English support',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskaftercare = AppRouteInfo(
    name: 'taskaftercare',
    path: '/task-after-care',
    file: 'TaskAfterCare.dc.html',
    title: '4.26 Task · Before/after-school care',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcredentialassess = AppRouteInfo(
    name: 'taskcredentialassess',
    path: '/task-credential-assess',
    file: 'TaskCredentialAssess.dc.html',
    title: '4.27 Task · Assess past studies',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskenglishtest = AppRouteInfo(
    name: 'taskenglishtest',
    path: '/task-english-test',
    file: 'TaskEnglishTest.dc.html',
    title: '4.28 Task · English test',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskdomestictuition = AppRouteInfo(
    name: 'taskdomestictuition',
    path: '/task-domestic-tuition',
    file: 'TaskDomesticTuition.dc.html',
    title: '4.29 Task · Domestic tuition',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcampusservices = AppRouteInfo(
    name: 'taskcampusservices',
    path: '/task-campus-services',
    file: 'TaskCampusServices.dc.html',
    title: '4.30 Task · Campus services (locked)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskdrivingrecord = AppRouteInfo(
    name: 'taskdrivingrecord',
    path: '/task-driving-record',
    file: 'TaskDrivingRecord.dc.html',
    title: '4.31 Task · Driving record',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskroadtest = AppRouteInfo(
    name: 'taskroadtest',
    path: '/task-road-test',
    file: 'TaskRoadTest.dc.html',
    title: '4.32 Task · Knowledge or road test',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskhealthgap = AppRouteInfo(
    name: 'taskhealthgap',
    path: '/task-health-gap',
    file: 'TaskHealthGap.dc.html',
    title: '4.33 Task · Health coverage gaps',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskkidsdental = AppRouteInfo(
    name: 'taskkidsdental',
    path: '/task-kids-dental',
    file: 'TaskKidsDental.dc.html',
    title: '4.34 Task · Kids dental & eyes',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskbank = AppRouteInfo(
    name: 'taskbank',
    path: '/task-bank',
    file: 'TaskBank.dc.html',
    title: '4.35 Task · Bank account (with partners)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcredit = AppRouteInfo(
    name: 'taskcredit',
    path: '/task-credit',
    file: 'TaskCredit.dc.html',
    title: '4.36 Task · Build credit',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasktaxreturn = AppRouteInfo(
    name: 'tasktaxreturn',
    path: '/task-tax-return',
    file: 'TaskTaxReturn.dc.html',
    title: '4.37 Task · First tax return (new)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskgroups = AppRouteInfo(
    name: 'taskgroups',
    path: '/task-groups',
    file: 'TaskGroups.dc.html',
    title: '4.38 Task · Find a group',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varbchealth = AppRouteInfo(
    name: 'varbchealth',
    path: '/var-b-c-health',
    file: 'VarBCHealth.dc.html',
    title: '12.1 BC · MSP wait period',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varbchealthgap = AppRouteInfo(
    name: 'varbchealthgap',
    path: '/var-b-c-health-gap',
    file: 'VarBCHealthGap.dc.html',
    title: '12.2 BC · Cover the wait',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varbcicbc = AppRouteInfo(
    name: 'varbcicbc',
    path: '/var-b-c-i-c-b-c',
    file: 'VarBCICBC.dc.html',
    title: '12.3 BC · ICBC licence + insurance',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varqchealth = AppRouteInfo(
    name: 'varqchealth',
    path: '/var-q-c-health',
    file: 'VarQCHealth.dc.html',
    title: '12.4 QC · RAMQ (children exempt)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varqclease = AppRouteInfo(
    name: 'varqclease',
    path: '/var-q-c-lease',
    file: 'VarQCLease.dc.html',
    title: '12.5 QC · Lease & no deposit',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varqcschool = AppRouteInfo(
    name: 'varqcschool',
    path: '/var-q-c-school',
    file: 'VarQCSchool.dc.html',
    title: '12.6 QC · French-language school',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo varmbnoteligible = AppRouteInfo(
    name: 'varmbnoteligible',
    path: '/var-m-b-not-eligible',
    file: 'VarMBNotEligible.dc.html',
    title: '12.7 MB · Not covered for your status',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo partnerdetail = AppRouteInfo(
    name: 'partnerdetail',
    path: '/partner-detail',
    file: 'PartnerDetail.dc.html',
    title: '13.1 Partner detail (sponsored)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo howpartners = AppRouteInfo(
    name: 'howpartners',
    path: '/how-partners',
    file: 'HowPartners.dc.html',
    title: '13.2 How we choose partners',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo legalhelp = AppRouteInfo(
    name: 'legalhelp',
    path: '/legal-help',
    file: 'LegalHelp.dc.html',
    title: '13.3 Legal help (free + licensed)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaynurse = AppRouteInfo(
    name: 'pathwaynurse',
    path: '/pathway-nurse',
    file: 'PathwayNurse.dc.html',
    title: '4.39 Pathway · Registered nurse',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayphysician = AppRouteInfo(
    name: 'pathwayphysician',
    path: '/pathway-physician',
    file: 'PathwayPhysician.dc.html',
    title: '4.40 Pathway · Physician',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaypharmacist = AppRouteInfo(
    name: 'pathwaypharmacist',
    path: '/pathway-pharmacist',
    file: 'PathwayPharmacist.dc.html',
    title: '4.41 Pathway · Pharmacist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaydentist = AppRouteInfo(
    name: 'pathwaydentist',
    path: '/pathway-dentist',
    file: 'PathwayDentist.dc.html',
    title: '4.42 Pathway · Dentist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayteacher = AppRouteInfo(
    name: 'pathwayteacher',
    path: '/pathway-teacher',
    file: 'PathwayTeacher.dc.html',
    title: '4.43 Pathway · Teacher (K–12)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayece = AppRouteInfo(
    name: 'pathwayece',
    path: '/pathway-e-c-e',
    file: 'PathwayECE.dc.html',
    title: '4.44 Pathway · Early childhood educator',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaysocialworker = AppRouteInfo(
    name: 'pathwaysocialworker',
    path: '/pathway-social-worker',
    file: 'PathwaySocialWorker.dc.html',
    title: '4.45 Pathway · Social worker',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaylawyer = AppRouteInfo(
    name: 'pathwaylawyer',
    path: '/pathway-lawyer',
    file: 'PathwayLawyer.dc.html',
    title: '4.46 Pathway · Lawyer',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaycpa = AppRouteInfo(
    name: 'pathwaycpa',
    path: '/pathway-c-p-a',
    file: 'PathwayCPA.dc.html',
    title: '4.47 Pathway · Accountant (CPA)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayelectrician = AppRouteInfo(
    name: 'pathwayelectrician',
    path: '/pathway-electrician',
    file: 'PathwayElectrician.dc.html',
    title: '4.48 Pathway · Electrician',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayplumber = AppRouteInfo(
    name: 'pathwayplumber',
    path: '/pathway-plumber',
    file: 'PathwayPlumber.dc.html',
    title: '4.49 Pathway · Plumber',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo privacypolicy = AppRouteInfo(
    name: 'privacypolicy',
    path: '/privacy-policy',
    file: 'PrivacyPolicy.dc.html',
    title: '8.12 Terms & Privacy Policy',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcarcosts = AppRouteInfo(
    name: 'taskcarcosts',
    path: '/task-car-costs',
    file: 'TaskCarCosts.dc.html',
    title: '4.50 Task · Plan car costs (optional)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo budgetplanner = AppRouteInfo(
    name: 'budgetplanner',
    path: '/budget-planner',
    file: 'BudgetPlanner.dc.html',
    title: '6.14 Budget planner (phase 2)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo joinhousehold = AppRouteInfo(
    name: 'joinhousehold',
    path: '/join-household',
    file: 'JoinHousehold.dc.html',
    title: '6.15 Join a household (invitee)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo planreadyexploring = AppRouteInfo(
    name: 'planreadyexploring',
    path: '/plan-ready-exploring',
    file: 'PlanReadyExploring.dc.html',
    title: '16.1 Plan ready · Exploring',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo homeexploring = AppRouteInfo(
    name: 'homeexploring',
    path: '/home-exploring',
    file: 'HomeExploring.dc.html',
    title: '16.2 Home · Exploring',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo planreadywaiting = AppRouteInfo(
    name: 'planreadywaiting',
    path: '/plan-ready-waiting',
    file: 'PlanReadyWaiting.dc.html',
    title: '16.3 Plan ready · Waiting',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo homewaiting = AppRouteInfo(
    name: 'homewaiting',
    path: '/home-waiting',
    file: 'HomeWaiting.dc.html',
    title: '16.4 Home · Waiting',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo planreadyapproved = AppRouteInfo(
    name: 'planreadyapproved',
    path: '/plan-ready-approved',
    file: 'PlanReadyApproved.dc.html',
    title: '16.5 Plan ready · Approved',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo homeapproved = AppRouteInfo(
    name: 'homeapproved',
    path: '/home-approved',
    file: 'HomeApproved.dc.html',
    title: '16.6 Home · Approved (countdown)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo journeyapproved = AppRouteInfo(
    name: 'journeyapproved',
    path: '/journey-approved',
    file: 'JourneyApproved.dc.html',
    title: '16.7 Journey · Before you move',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo homesettled = AppRouteInfo(
    name: 'homesettled',
    path: '/home-settled',
    file: 'HomeSettled.dc.html',
    title: '16.8 Home · In Canada 3+ months',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo expoptions = AppRouteInfo(
    name: 'expoptions',
    path: '/exp-options',
    file: 'ExpOptions.dc.html',
    title: '16.9 Task · learn the official ways to immigrate',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exprepresentative = AppRouteInfo(
    name: 'exprepresentative',
    path: '/exp-representative',
    file: 'ExpRepresentative.dc.html',
    title: '16.10 Task · check a consultant or lawyer is licensed',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo expcities = AppRouteInfo(
    name: 'expcities',
    path: '/exp-cities',
    file: 'ExpCities.dc.html',
    title: '16.11 Task · compare cities and living costs',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo waittrack = AppRouteInfo(
    name: 'waittrack',
    path: '/wait-track',
    file: 'WaitTrack.dc.html',
    title: '16.12 Task · check your application status',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo waitdocs = AppRouteInfo(
    name: 'waitdocs',
    path: '/wait-docs',
    file: 'WaitDocs.dc.html',
    title: '16.13 Task · gather your family\'s documents',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo waitsavings = AppRouteInfo(
    name: 'waitsavings',
    path: '/wait-savings',
    file: 'WaitSavings.dc.html',
    title: '16.14 Task · plan money for your first months',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo waitwellbeing = AppRouteInfo(
    name: 'waitwellbeing',
    path: '/wait-wellbeing',
    file: 'WaitWellbeing.dc.html',
    title: '16.15 Task · when waiting feels hard',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo preservices = AppRouteInfo(
    name: 'preservices',
    path: '/pre-services',
    file: 'PreServices.dc.html',
    title: '16.16 Task · sign up for free pre-arrival services',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pretraveldocs = AppRouteInfo(
    name: 'pretraveldocs',
    path: '/pre-travel-docs',
    file: 'PreTravelDocs.dc.html',
    title: '16.17 Task · get your travel documents ready',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pregoods = AppRouteInfo(
    name: 'pregoods',
    path: '/pre-goods',
    file: 'PreGoods.dc.html',
    title: '16.18 Task · list what you\'re bringing',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo prekidsrecords = AppRouteInfo(
    name: 'prekidsrecords',
    path: '/pre-kids-records',
    file: 'PreKidsRecords.dc.html',
    title: '16.19 Task · get children\'s school and vaccine records',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo premedications = AppRouteInfo(
    name: 'premedications',
    path: '/pre-medications',
    file: 'PreMedications.dc.html',
    title: '16.20 Task · plan your medications',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pretemphousing = AppRouteInfo(
    name: 'pretemphousing',
    path: '/pre-temp-housing',
    file: 'PreTempHousing.dc.html',
    title: '16.21 Task · book a place for your first weeks',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo prearrivalday = AppRouteInfo(
    name: 'prearrivalday',
    path: '/pre-arrival-day',
    file: 'PreArrivalDay.dc.html',
    title: '16.22 Task · know what happens at the airport',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo prefirst72 = AppRouteInfo(
    name: 'prefirst72',
    path: '/pre-first72',
    file: 'PreFirst72.dc.html',
    title: '16.23 Task · plan your first 72 hours',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskphotocard = AppRouteInfo(
    name: 'taskphotocard',
    path: '/task-photo-card',
    file: 'TaskPhotoCard.dc.html',
    title: '4.51 Task · get an Ontario Photo Card',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasktranslations = AppRouteInfo(
    name: 'tasktranslations',
    path: '/task-translations',
    file: 'TaskTranslations.dc.html',
    title: '4.52 Task · get certified translations',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskaddresschange = AppRouteInfo(
    name: 'taskaddresschange',
    path: '/task-address-change',
    file: 'TaskAddressChange.dc.html',
    title: '4.53 Task · update your address everywhere',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskrentalsearch = AppRouteInfo(
    name: 'taskrentalsearch',
    path: '/task-rental-search',
    file: 'TaskRentalSearch.dc.html',
    title: '4.54 Task · find and apply for a rental',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskmovein = AppRouteInfo(
    name: 'taskmovein',
    path: '/task-move-in',
    file: 'TaskMoveIn.dc.html',
    title: '4.55 Task · move in and check the unit',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskhousinghelp = AppRouteInfo(
    name: 'taskhousinghelp',
    path: '/task-housing-help',
    file: 'TaskHousingHelp.dc.html',
    title: '4.56 Task · get help if rent is too high or you have nowhere to stay',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskchildcare = AppRouteInfo(
    name: 'taskchildcare',
    path: '/task-child-care',
    file: 'TaskChildCare.dc.html',
    title: '4.57 Task · find licensed child care',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskchildcaresubsidy = AppRouteInfo(
    name: 'taskchildcaresubsidy',
    path: '/task-child-care-subsidy',
    file: 'TaskChildCareSubsidy.dc.html',
    title: '4.58 Task · apply for a child care subsidy',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskearlyon = AppRouteInfo(
    name: 'taskearlyon',
    path: '/task-early-o-n',
    file: 'TaskEarlyON.dc.html',
    title: '4.59 Task · visit a free EarlyON centre',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskschoolbus = AppRouteInfo(
    name: 'taskschoolbus',
    path: '/task-school-bus',
    file: 'TaskSchoolBus.dc.html',
    title: '4.60 Task · check if your child gets a school bus',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskspecialed = AppRouteInfo(
    name: 'taskspecialed',
    path: '/task-special-ed',
    file: 'TaskSpecialEd.dc.html',
    title: '4.61 Task · get support for learning needs',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskteencredits = AppRouteInfo(
    name: 'taskteencredits',
    path: '/task-teen-credits',
    file: 'TaskTeenCredits.dc.html',
    title: '4.62 Task · get credit for past high school',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskbuycar = AppRouteInfo(
    name: 'taskbuycar',
    path: '/task-buy-car',
    file: 'TaskBuyCar.dc.html',
    title: '4.63 Task · buy a used car safely',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskregistercar = AppRouteInfo(
    name: 'taskregistercar',
    path: '/task-register-car',
    file: 'TaskRegisterCar.dc.html',
    title: '4.64 Task · register your car and get plates',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcarseats = AppRouteInfo(
    name: 'taskcarseats',
    path: '/task-car-seats',
    file: 'TaskCarSeats.dc.html',
    title: '4.65 Task · use the right car seat',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskwinterdriving = AppRouteInfo(
    name: 'taskwinterdriving',
    path: '/task-winter-driving',
    file: 'TaskWinterDriving.dc.html',
    title: '4.66 Task · get ready for winter driving',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskinsurancehistory = AppRouteInfo(
    name: 'taskinsurancehistory',
    path: '/task-insurance-history',
    file: 'TaskInsuranceHistory.dc.html',
    title: '4.67 Task · bring proof of your insurance history',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskworkbenefits = AppRouteInfo(
    name: 'taskworkbenefits',
    path: '/task-work-benefits',
    file: 'TaskWorkBenefits.dc.html',
    title: '4.68 Task · understand your workplace benefits',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskwherecare = AppRouteInfo(
    name: 'taskwherecare',
    path: '/task-where-care',
    file: 'TaskWhereCare.dc.html',
    title: '4.69 Task · know where to go when someone is sick',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskprescriptions = AppRouteInfo(
    name: 'taskprescriptions',
    path: '/task-prescriptions',
    file: 'TaskPrescriptions.dc.html',
    title: '4.70 Task · pay less for prescriptions',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskdentalplan = AppRouteInfo(
    name: 'taskdentalplan',
    path: '/task-dental-plan',
    file: 'TaskDentalPlan.dc.html',
    title: '4.71 Task · apply for the Canadian Dental Care Plan',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskmentalhealth = AppRouteInfo(
    name: 'taskmentalhealth',
    path: '/task-mental-health',
    file: 'TaskMentalHealth.dc.html',
    title: '4.72 Task · find free mental health support',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskpregnancy = AppRouteInfo(
    name: 'taskpregnancy',
    path: '/task-pregnancy',
    file: 'TaskPregnancy.dc.html',
    title: '4.73 Task · pregnancy and a new baby',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskgstcredit = AppRouteInfo(
    name: 'taskgstcredit',
    path: '/task-g-s-t-credit',
    file: 'TaskGSTCredit.dc.html',
    title: '4.74 Task · apply for the GST/HST credit',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskotb = AppRouteInfo(
    name: 'taskotb',
    path: '/task-o-t-b',
    file: 'TaskOTB.dc.html',
    title: '4.75 Task · get the Ontario Trillium Benefit',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskclb = AppRouteInfo(
    name: 'taskclb',
    path: '/task-c-l-b',
    file: 'TaskCLB.dc.html',
    title: '4.76 Task · get the Canada Learning Bond',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo tasksendmoney = AppRouteInfo(
    name: 'tasksendmoney',
    path: '/task-send-money',
    file: 'TaskSendMoney.dc.html',
    title: '4.77 Task · send money home safely',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskcrascams = AppRouteInfo(
    name: 'taskcrascams',
    path: '/task-c-r-a-scams',
    file: 'TaskCRAScams.dc.html',
    title: '4.78 Task · spot government and money scams',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskresume = AppRouteInfo(
    name: 'taskresume',
    path: '/task-resume',
    file: 'TaskResume.dc.html',
    title: '4.79 Task · make a Canadian-style résumé',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskjobsearch = AppRouteInfo(
    name: 'taskjobsearch',
    path: '/task-job-search',
    file: 'TaskJobSearch.dc.html',
    title: '4.80 Task · search for jobs',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskworkrights = AppRouteInfo(
    name: 'taskworkrights',
    path: '/task-work-rights',
    file: 'TaskWorkRights.dc.html',
    title: '4.81 Task · know your rights at work',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskjobscams = AppRouteInfo(
    name: 'taskjobscams',
    path: '/task-job-scams',
    file: 'TaskJobScams.dc.html',
    title: '4.82 Task · spot job scams',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskbridging = AppRouteInfo(
    name: 'taskbridging',
    path: '/task-bridging',
    file: 'TaskBridging.dc.html',
    title: '4.83 Task · join a bridging program or mentorship',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskbusiness = AppRouteInfo(
    name: 'taskbusiness',
    path: '/task-business',
    file: 'TaskBusiness.dc.html',
    title: '4.84 Task · start a business or work for yourself',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo explore = AppRouteInfo(
    name: 'explore',
    path: '/explore',
    file: 'Explore.dc.html',
    title: '20.1 Explore (tab)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo explorefreepasses = AppRouteInfo(
    name: 'explorefreepasses',
    path: '/explore-free-passes',
    file: 'ExploreFreePasses.dc.html',
    title: '20.2 Explore · Free passes',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo explorecanoo = AppRouteInfo(
    name: 'explorecanoo',
    path: '/explore-canoo',
    file: 'ExploreCanoo.dc.html',
    title: '20.3 Explore · Canoo free year',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exploreplaces = AppRouteInfo(
    name: 'exploreplaces',
    path: '/explore-places',
    file: 'ExplorePlaces.dc.html',
    title: '20.4 Explore · Places list',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exploreplace = AppRouteInfo(
    name: 'exploreplace',
    path: '/explore-place',
    file: 'ExplorePlace.dc.html',
    title: '20.5 Explore · Place detail',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exploreevents = AppRouteInfo(
    name: 'exploreevents',
    path: '/explore-events',
    file: 'ExploreEvents.dc.html',
    title: '20.6 Explore · Events',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exploreoffers = AppRouteInfo(
    name: 'exploreoffers',
    path: '/explore-offers',
    file: 'ExploreOffers.dc.html',
    title: '20.7 Explore · Offers',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo offerdetail = AppRouteInfo(
    name: 'offerdetail',
    path: '/offer-detail',
    file: 'OfferDetail.dc.html',
    title: '20.8 Explore · Offer / coupon',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exploresaved = AppRouteInfo(
    name: 'exploresaved',
    path: '/explore-saved',
    file: 'ExploreSaved.dc.html',
    title: '20.9 Explore · Saved',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo explorefilters = AppRouteInfo(
    name: 'explorefilters',
    path: '/explore-filters',
    file: 'ExploreFilters.dc.html',
    title: '20.10 Explore · Filters sheet',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo explorewinter = AppRouteInfo(
    name: 'explorewinter',
    path: '/explore-winter',
    file: 'ExploreWinter.dc.html',
    title: '20.11 Explore · First winter',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo explorecity = AppRouteInfo(
    name: 'explorecity',
    path: '/explore-city',
    file: 'ExploreCity.dc.html',
    title: '20.12 Explore · Choose city (location off)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskmore = AppRouteInfo(
    name: 'taskmore',
    path: '/task-more',
    file: 'TaskMore.dc.html',
    title: '21.1 Task · More options (⋯ sheet)',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo exploreevent = AppRouteInfo(
    name: 'exploreevent',
    path: '/explore-event',
    file: 'ExploreEvent.dc.html',
    title: '21.2 Explore · Event detail',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo explorepass = AppRouteInfo(
    name: 'explorepass',
    path: '/explore-pass',
    file: 'ExplorePass.dc.html',
    title: '21.3 Explore · Library pass detail',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo leavequickly = AppRouteInfo(
    name: 'leavequickly',
    path: '/leave-quickly',
    file: 'LeaveQuickly.dc.html',
    title: '21.4 Crisis · Leave quickly → neutral page',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo languagerestart = AppRouteInfo(
    name: 'languagerestart',
    path: '/language-restart',
    file: 'LanguageRestart.dc.html',
    title: '21.5 Settings · Language restart (RTL)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo signinerror = AppRouteInfo(
    name: 'signinerror',
    path: '/sign-in-error',
    file: 'SignInError.dc.html',
    title: '21.6 Error · Sign-in failed',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo exporterror = AppRouteInfo(
    name: 'exporterror',
    path: '/export-error',
    file: 'ExportError.dc.html',
    title: '21.7 Error · Data export failed',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo deleteerror = AppRouteInfo(
    name: 'deleteerror',
    path: '/delete-error',
    file: 'DeleteError.dc.html',
    title: '21.8 Error · Account deletion failed',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo webdeleteaccount = AppRouteInfo(
    name: 'webdeleteaccount',
    path: '/web-delete-account',
    file: 'WebDeleteAccount.dc.html',
    title: '21.9 Web · Delete account (Google Play)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo searchempty = AppRouteInfo(
    name: 'searchempty',
    path: '/search-empty',
    file: 'SearchEmpty.dc.html',
    title: '21.10 Empty · Search, no results',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo stagecomplete = AppRouteInfo(
    name: 'stagecomplete',
    path: '/stage-complete',
    file: 'StageComplete.dc.html',
    title: '21.11 Empty · Stage complete',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo familysingle = AppRouteInfo(
    name: 'familysingle',
    path: '/family-single',
    file: 'FamilySingle.dc.html',
    title: '21.12 Empty · Family, one adult',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo exploresavedempty = AppRouteInfo(
    name: 'exploresavedempty',
    path: '/explore-saved-empty',
    file: 'ExploreSavedEmpty.dc.html',
    title: '21.13 Empty · Explore saved',
    kind: ScreenKind.state,
  );

  static const AppRouteInfo androidlocation = AppRouteInfo(
    name: 'androidlocation',
    path: '/android-location',
    file: 'AndroidLocation.dc.html',
    title: '21.14 Android · Location permission',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo homear = AppRouteInfo(
    name: 'homear',
    path: '/home-a-r',
    file: 'HomeAR.dc.html',
    title: '21.15 RTL · Home in Arabic',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo taskprestoar = AppRouteInfo(
    name: 'taskprestoar',
    path: '/task-presto-a-r',
    file: 'TaskPrestoAR.dc.html',
    title: '21.16 RTL · Task in Arabic',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo allprofessions = AppRouteInfo(
    name: 'allprofessions',
    path: '/all-professions',
    file: 'AllProfessions.dc.html',
    title: '22.0 Work · All regulated jobs (index)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaydentalhygienist = AppRouteInfo(
    name: 'pathwaydentalhygienist',
    path: '/pathway-dental-hygienist',
    file: 'PathwayDentalHygienist.dc.html',
    title: '22.1 Pathway · Dental hygienist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayphysio = AppRouteInfo(
    name: 'pathwayphysio',
    path: '/pathway-physio',
    file: 'PathwayPhysio.dc.html',
    title: '22.2 Pathway · Physiotherapist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayot = AppRouteInfo(
    name: 'pathwayot',
    path: '/pathway-o-t',
    file: 'PathwayOT.dc.html',
    title: '22.3 Pathway · Occupational therapist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaymlt = AppRouteInfo(
    name: 'pathwaymlt',
    path: '/pathway-m-l-t',
    file: 'PathwayMLT.dc.html',
    title: '22.4 Pathway · Medical laboratory technologist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaymrt = AppRouteInfo(
    name: 'pathwaymrt',
    path: '/pathway-m-r-t',
    file: 'PathwayMRT.dc.html',
    title: '22.5 Pathway · Medical radiation technologist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayrt = AppRouteInfo(
    name: 'pathwayrt',
    path: '/pathway-r-t',
    file: 'PathwayRT.dc.html',
    title: '22.6 Pathway · Respiratory therapist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaymidwife = AppRouteInfo(
    name: 'pathwaymidwife',
    path: '/pathway-midwife',
    file: 'PathwayMidwife.dc.html',
    title: '22.7 Pathway · Midwife',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaydietitian = AppRouteInfo(
    name: 'pathwaydietitian',
    path: '/pathway-dietitian',
    file: 'PathwayDietitian.dc.html',
    title: '22.8 Pathway · Dietitian',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaypsychologist = AppRouteInfo(
    name: 'pathwaypsychologist',
    path: '/pathway-psychologist',
    file: 'PathwayPsychologist.dc.html',
    title: '22.9 Pathway · Psychologist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaypsychotherapist = AppRouteInfo(
    name: 'pathwaypsychotherapist',
    path: '/pathway-psychotherapist',
    file: 'PathwayPsychotherapist.dc.html',
    title: '22.10 Pathway · Psychotherapist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayoptometrist = AppRouteInfo(
    name: 'pathwayoptometrist',
    path: '/pathway-optometrist',
    file: 'PathwayOptometrist.dc.html',
    title: '22.11 Pathway · Optometrist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayoptician = AppRouteInfo(
    name: 'pathwayoptician',
    path: '/pathway-optician',
    file: 'PathwayOptician.dc.html',
    title: '22.12 Pathway · Optician',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaychiropractor = AppRouteInfo(
    name: 'pathwaychiropractor',
    path: '/pathway-chiropractor',
    file: 'PathwayChiropractor.dc.html',
    title: '22.13 Pathway · Chiropractor',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaymassage = AppRouteInfo(
    name: 'pathwaymassage',
    path: '/pathway-massage',
    file: 'PathwayMassage.dc.html',
    title: '22.14 Pathway · Massage therapist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaykinesiologist = AppRouteInfo(
    name: 'pathwaykinesiologist',
    path: '/pathway-kinesiologist',
    file: 'PathwayKinesiologist.dc.html',
    title: '22.15 Pathway · Kinesiologist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayaudiologistslp = AppRouteInfo(
    name: 'pathwayaudiologistslp',
    path: '/pathway-audiologist-s-l-p',
    file: 'PathwayAudiologistSLP.dc.html',
    title: '22.16 Pathway · Audiologist or speech-language pathologist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaydenturist = AppRouteInfo(
    name: 'pathwaydenturist',
    path: '/pathway-denturist',
    file: 'PathwayDenturist.dc.html',
    title: '22.17 Pathway · Denturist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayparalegal = AppRouteInfo(
    name: 'pathwayparalegal',
    path: '/pathway-paralegal',
    file: 'PathwayParalegal.dc.html',
    title: '22.18 Pathway · Paralegal',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayarchitect = AppRouteInfo(
    name: 'pathwayarchitect',
    path: '/pathway-architect',
    file: 'PathwayArchitect.dc.html',
    title: '22.19 Pathway · Architect',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayvet = AppRouteInfo(
    name: 'pathwayvet',
    path: '/pathway-vet',
    file: 'PathwayVet.dc.html',
    title: '22.20 Pathway · Veterinarian',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaysurveyor = AppRouteInfo(
    name: 'pathwaysurveyor',
    path: '/pathway-surveyor',
    file: 'PathwaySurveyor.dc.html',
    title: '22.21 Pathway · Land surveyor',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaygeoscientist = AppRouteInfo(
    name: 'pathwaygeoscientist',
    path: '/pathway-geoscientist',
    file: 'PathwayGeoscientist.dc.html',
    title: '22.22 Pathway · Geoscientist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayrealestate = AppRouteInfo(
    name: 'pathwayrealestate',
    path: '/pathway-real-estate',
    file: 'PathwayRealEstate.dc.html',
    title: '22.23 Pathway · Real estate agent',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayinsurance = AppRouteInfo(
    name: 'pathwayinsurance',
    path: '/pathway-insurance',
    file: 'PathwayInsurance.dc.html',
    title: '22.24 Pathway · Life insurance agent',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaymortgage = AppRouteInfo(
    name: 'pathwaymortgage',
    path: '/pathway-mortgage',
    file: 'PathwayMortgage.dc.html',
    title: '22.25 Pathway · Mortgage agent',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayrefrigeration = AppRouteInfo(
    name: 'pathwayrefrigeration',
    path: '/pathway-refrigeration',
    file: 'PathwayRefrigeration.dc.html',
    title: '22.26 Pathway · Refrigeration and air conditioning mechanic',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaysheetmetal = AppRouteInfo(
    name: 'pathwaysheetmetal',
    path: '/pathway-sheet-metal',
    file: 'PathwaySheetMetal.dc.html',
    title: '22.27 Pathway · Sheet metal worker',
    kind: ScreenKind.sheet,
  );

  static const AppRouteInfo pathwaysteamfitter = AppRouteInfo(
    name: 'pathwaysteamfitter',
    path: '/pathway-steamfitter',
    file: 'PathwaySteamfitter.dc.html',
    title: '22.28 Pathway · Steamfitter',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayautotech = AppRouteInfo(
    name: 'pathwayautotech',
    path: '/pathway-auto-tech',
    file: 'PathwayAutoTech.dc.html',
    title: '22.29 Pathway · Automotive service technician',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayautobody = AppRouteInfo(
    name: 'pathwayautobody',
    path: '/pathway-auto-body',
    file: 'PathwayAutoBody.dc.html',
    title: '22.30 Pathway · Auto body and collision repairer',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaytruckcoach = AppRouteInfo(
    name: 'pathwaytruckcoach',
    path: '/pathway-truck-coach',
    file: 'PathwayTruckCoach.dc.html',
    title: '22.31 Pathway · Truck and coach technician',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwayhairstylist = AppRouteInfo(
    name: 'pathwayhairstylist',
    path: '/pathway-hairstylist',
    file: 'PathwayHairstylist.dc.html',
    title: '22.32 Pathway · Hairstylist',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo pathwaycrane = AppRouteInfo(
    name: 'pathwaycrane',
    path: '/pathway-crane',
    file: 'PathwayCrane.dc.html',
    title: '22.33 Pathway · Mobile crane operator (hoisting engineer)',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo placerattray = AppRouteInfo(
    name: 'placerattray',
    path: '/place-rattray',
    file: 'PlaceRattray.dc.html',
    title: '23.1 Place · Rattray Marsh',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo placeportcredit = AppRouteInfo(
    name: 'placeportcredit',
    path: '/place-port-credit',
    file: 'PlacePortCredit.dc.html',
    title: '23.2 Place · Port Credit waterfront',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo placekariya = AppRouteInfo(
    name: 'placekariya',
    path: '/place-kariya',
    file: 'PlaceKariya.dc.html',
    title: '23.3 Place · Kariya Park',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo placeriverwood = AppRouteInfo(
    name: 'placeriverwood',
    path: '/place-riverwood',
    file: 'PlaceRiverwood.dc.html',
    title: '23.4 Place · The Riverwood Conservancy',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo placepama = AppRouteInfo(
    name: 'placepama',
    path: '/place-p-a-m-a',
    file: 'PlacePAMA.dc.html',
    title: '23.5 Place · PAMA',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo placeniagara = AppRouteInfo(
    name: 'placeniagara',
    path: '/place-niagara',
    file: 'PlaceNiagara.dc.html',
    title: '23.6 Place · Niagara Falls',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo eventskate = AppRouteInfo(
    name: 'eventskate',
    path: '/event-skate',
    file: 'EventSkate.dc.html',
    title: '23.7 Event · Fun skate',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo eventwelcome = AppRouteInfo(
    name: 'eventwelcome',
    path: '/event-welcome',
    file: 'EventWelcome.dc.html',
    title: '23.8 Event · Newcomer welcome',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo eventwinterwalk = AppRouteInfo(
    name: 'eventwinterwalk',
    path: '/event-winter-walk',
    file: 'EventWinterWalk.dc.html',
    title: '23.9 Event · Winter walk',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo passontarioparks = AppRouteInfo(
    name: 'passontarioparks',
    path: '/pass-ontario-parks',
    file: 'PassOntarioParks.dc.html',
    title: '23.10 Pass · Ontario Parks',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo passconservation = AppRouteInfo(
    name: 'passconservation',
    path: '/pass-conservation',
    file: 'PassConservation.dc.html',
    title: '23.11 Pass · Conservation parks',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo passpama = AppRouteInfo(
    name: 'passpama',
    path: '/pass-p-a-m-a',
    file: 'PassPAMA.dc.html',
    title: '23.12 Pass · PAMA family',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo passswimskate = AppRouteInfo(
    name: 'passswimskate',
    path: '/pass-swim-skate',
    file: 'PassSwimSkate.dc.html',
    title: '23.13 Pass · Swim & skate',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo offerbank = AppRouteInfo(
    name: 'offerbank',
    path: '/offer-bank',
    file: 'OfferBank.dc.html',
    title: '23.14 Offer · Newcomer banking',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo offerphone = AppRouteInfo(
    name: 'offerphone',
    path: '/offer-phone',
    file: 'OfferPhone.dc.html',
    title: '23.15 Offer · Phone plan',
    kind: ScreenKind.screen,
  );

  static const AppRouteInfo offerfurniture = AppRouteInfo(
    name: 'offerfurniture',
    path: '/offer-furniture',
    file: 'OfferFurniture.dc.html',
    title: '23.16 Offer · Furniture',
    kind: ScreenKind.screen,
  );

  static const List<AppRouteInfo> allRoutes = [
    main,
    signup,
    verifyemail,
    signin,
    consent,
    notifpermission,
    locationpermission,
    stage,
    destination,
    status,
    household,
    addchild,
    addadult,
    priorities,
    planready,
    addstudent,
    home,
    journey,
    stagestatus,
    stagepaperwork,
    stagehousing,
    stageschools,
    stagecar,
    stageinsurance,
    stagehealth,
    stagemoney,
    stagework,
    stagecommunity,
    stageuniversity,
    taskstatus,
    tasksin,
    taskhousing,
    taskschool,
    tasklicence,
    taskinsurance,
    taskdoctor,
    taskccb,
    taskwork,
    tasklibrary,
    taskuniapply,
    taskosap,
    occupationsearch,
    occupationpathway,
    nearby,
    locationdetail,
    donepicker,
    taskdone,
    snooze,
    dismiss,
    reportoutdated,
    contentupdated,
    family,
    memberadult,
    memberchild,
    removemember,
    checklist,
    reminders,
    calendar,
    notificationsettings,
    lifeevent,
    planchange,
    justtoday,
    search,
    memberstudent,
    help,
    communitygroups,
    checkin,
    conversationguide,
    crisis,
    howguidance,
    settings,
    editprofile,
    privacydata,
    dataexport,
    languageaccess,
    signoutconfirm,
    deactivate,
    paused,
    welcomeback,
    deleteconfirm,
    deleted,
    guesthome,
    offline,
    locationdenied,
    servererror,
    integrationmap,
    dataflow,
    tasklandingdocs,
    taskprbasics,
    taskhealthcard,
    taskcra,
    taskpresto,
    taskscams,
    tasklease,
    taskutilities,
    tasktenantinsurance,
    taskimmunization,
    taskesl,
    taskaftercare,
    taskcredentialassess,
    taskenglishtest,
    taskdomestictuition,
    taskcampusservices,
    taskdrivingrecord,
    taskroadtest,
    taskhealthgap,
    taskkidsdental,
    taskbank,
    taskcredit,
    tasktaxreturn,
    taskgroups,
    varbchealth,
    varbchealthgap,
    varbcicbc,
    varqchealth,
    varqclease,
    varqcschool,
    varmbnoteligible,
    partnerdetail,
    howpartners,
    legalhelp,
    pathwaynurse,
    pathwayphysician,
    pathwaypharmacist,
    pathwaydentist,
    pathwayteacher,
    pathwayece,
    pathwaysocialworker,
    pathwaylawyer,
    pathwaycpa,
    pathwayelectrician,
    pathwayplumber,
    privacypolicy,
    taskcarcosts,
    budgetplanner,
    joinhousehold,
    planreadyexploring,
    homeexploring,
    planreadywaiting,
    homewaiting,
    planreadyapproved,
    homeapproved,
    journeyapproved,
    homesettled,
    expoptions,
    exprepresentative,
    expcities,
    waittrack,
    waitdocs,
    waitsavings,
    waitwellbeing,
    preservices,
    pretraveldocs,
    pregoods,
    prekidsrecords,
    premedications,
    pretemphousing,
    prearrivalday,
    prefirst72,
    taskphotocard,
    tasktranslations,
    taskaddresschange,
    taskrentalsearch,
    taskmovein,
    taskhousinghelp,
    taskchildcare,
    taskchildcaresubsidy,
    taskearlyon,
    taskschoolbus,
    taskspecialed,
    taskteencredits,
    taskbuycar,
    taskregistercar,
    taskcarseats,
    taskwinterdriving,
    taskinsurancehistory,
    taskworkbenefits,
    taskwherecare,
    taskprescriptions,
    taskdentalplan,
    taskmentalhealth,
    taskpregnancy,
    taskgstcredit,
    taskotb,
    taskclb,
    tasksendmoney,
    taskcrascams,
    taskresume,
    taskjobsearch,
    taskworkrights,
    taskjobscams,
    taskbridging,
    taskbusiness,
    explore,
    explorefreepasses,
    explorecanoo,
    exploreplaces,
    exploreplace,
    exploreevents,
    exploreoffers,
    offerdetail,
    exploresaved,
    explorefilters,
    explorewinter,
    explorecity,
    taskmore,
    exploreevent,
    explorepass,
    leavequickly,
    languagerestart,
    signinerror,
    exporterror,
    deleteerror,
    webdeleteaccount,
    searchempty,
    stagecomplete,
    familysingle,
    exploresavedempty,
    androidlocation,
    homear,
    taskprestoar,
    allprofessions,
    pathwaydentalhygienist,
    pathwayphysio,
    pathwayot,
    pathwaymlt,
    pathwaymrt,
    pathwayrt,
    pathwaymidwife,
    pathwaydietitian,
    pathwaypsychologist,
    pathwaypsychotherapist,
    pathwayoptometrist,
    pathwayoptician,
    pathwaychiropractor,
    pathwaymassage,
    pathwaykinesiologist,
    pathwayaudiologistslp,
    pathwaydenturist,
    pathwayparalegal,
    pathwayarchitect,
    pathwayvet,
    pathwaysurveyor,
    pathwaygeoscientist,
    pathwayrealestate,
    pathwayinsurance,
    pathwaymortgage,
    pathwayrefrigeration,
    pathwaysheetmetal,
    pathwaysteamfitter,
    pathwayautotech,
    pathwayautobody,
    pathwaytruckcoach,
    pathwayhairstylist,
    pathwaycrane,
    placerattray,
    placeportcredit,
    placekariya,
    placeriverwood,
    placepama,
    placeniagara,
    eventskate,
    eventwelcome,
    eventwinterwalk,
    passontarioparks,
    passconservation,
    passpama,
    passswimskate,
    offerbank,
    offerphone,
    offerfurniture,
  ];
}
