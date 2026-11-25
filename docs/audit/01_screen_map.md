# Deliverable 1: Complete 271 Screen Map

This audit maps all 271 unique screens from the `_spec_export` across all 23 section folders.

## Summary of Build Levels

- **FULL (77 screens):** Bespoke screen implementation whose text, layout, and visual components directly reproduce the spec HTML.
- **TEMPLATE (194 screens):** Rendered from high-fidelity shared templates (`TaskDetailScreen`, `StageDetailScreen`, `RegulatedPathwayDetailScreen`, `ExploreScreen`, `Section21Screen`) driven by verified domain data models matching spec text.
- **STUB / PLACEHOLDER (0 screens):** Every single route is backed by either a bespoke screen or structured template.

## PR & Phase Origin Table

| PR Number | Branch | Linear Issue | Sections Covered | Number of Screens |
|:---|:---|:---:|:---|:---:|
| Baseline | `main` (commit `f3ce272`) | `KOD-103`, `KOD-104`, `KOD-105` | Phase 0 (Engine/Tokens), S01, S02 | 16 |
| PR #1 | `phase-3/section-3-home-journey-stages` | `KOD-106` | S03 (Home, Journey & 10 Stages) | 13 |
| PR #2 | `phase-4/section-4-full-tasks-licensing` | `KOD-107` | S04 (Tasks 4.2-4.14, Nearby, Uni) | 14 |
| PR #3 | `phase-5/section-5-task-actions-map-updates` | `KOD-108` | S05 (Task actions & nearby map) | 8 |
| PR #4 | `phase-6/section-6-family-checklists-reminders` | `KOD-109` | S06 (Family, checklists, reminders) | 13 |
| PR #5 | `phase-7/section-7-trusted-help-wellbeing` | `KOD-110` | S07 (Trusted help & wellbeing) | 6 |
| PR #6 | `phase-8/section-8-account-privacy-pause-deletion` | `KOD-111` | S08 (Account, privacy, pause, deletion) | 11 |
| PR #7 | `phase-9/sections-9-10-guest-offline-errors-and-dataflow` | `KOD-112` | S09 (Guest/Offline), S10 (Data flow) | 6 |
| PR #8 | `phase-10/section-11-every-remaining-task-ontario` | `KOD-113` | S11 (24 Ontario Tasks) | 24 |
| PR #9 | `phase-11/sections-12-13-province-variants-partners-legal` | `KOD-114` | S12 (Variants BC, QC, MB), S13 (Partners & legal) | 10 |
| PR #10 | `phase-12/sections-14-15-22-licensing-pathways-and-gap-screens` | `KOD-115` | S14 (Pathways 1-11), S15 (Gap screens), S22 (Pathways 12-45) | 49 |
| PR #11 | `phase-13/sections-16-17-plan-home-move-stages-and-before-you-move-tasks` | `KOD-116` | S16 (Move Stages Home/Plan), S17 (Before-move tasks) | 23 |
| PR #12 | `phase-14/sections-18-19-all-34-gap-tasks` | `KOD-117` | S18 (Paperwork/Housing), S19 (Insurance/Health/Money) | 34 |
| PR #13 | `phase-15/sections-20-23-explore-tab-and-all-details` | `KOD-118` | S20 (Explore tab), S23 (Places/Events/Passes/Offers) | 28 |
| PR #14 | `phase-16/section-21-last-taps-empty-error-android-rtl` | `KOD-119` | S21 (Last taps, errors, empty states, Arabic RTL) | 16 |
| PR #15 | `phase-17/full-5-path-integration-tests-and-verification` | `KOD-120` | Full 5-Path Flow Graph Verification | 0 (112 tests) |
| PR #16 | `phase-18/hardening-accessibility-and-release` | `KOD-121` | Production release readiness & hardening | 0 (116 tests) |
| **TOTAL** | | | **All 23 sections** | **271 screens** |

## Full 271 Screen Inventory

| Section | Screen # | HTML file | Dart file | Route path | PR / Branch | Build Level |
|:---|:---:|:---|:---|:---|:---|:---:|
| S01 | 1.5 | `Consent.dc.html` | `lib/features/auth/consent_screen.dart` | `/consent` | commit f3ce272 (main) | FULL |
| S01 | 1.7 | `LocationPermission.dc.html` | `lib/features/auth/location_permission_screen.dart` | `/location-permission` | commit f3ce272 (main) | FULL |
| S01 | 1.1 | `Main.dc.html` | `lib/features/auth/main_welcome_screen.dart` | `/` | commit f3ce272 (main) | FULL |
| S01 | 1.6 | `NotifPermission.dc.html` | `lib/features/auth/notif_permission_screen.dart` | `/notif-permission` | commit f3ce272 (main) | FULL |
| S01 | 1.4 | `SignIn.dc.html` | `lib/features/auth/sign_in_screen.dart` | `/sign-in` | commit f3ce272 (main) | FULL |
| S01 | 1.2 | `SignUp.dc.html` | `lib/features/auth/sign_up_screen.dart` | `/sign-up` | commit f3ce272 (main) | FULL |
| S01 | 1.3 | `VerifyEmail.dc.html` | `lib/features/auth/verify_email_screen.dart` | `/verify-email` | commit f3ce272 (main) | FULL |
| S02 | 2.6 | `AddAdult.dc.html` | `lib/features/onboarding/add_adult_screen.dart` | `/add-adult` | commit f3ce272 (main) | FULL |
| S02 | 2.5 | `AddChild.dc.html` | `lib/features/onboarding/add_child_screen.dart` | `/add-child` | commit f3ce272 (main) | FULL |
| S02 | 2.9 | `AddStudent.dc.html` | `lib/features/onboarding/add_student_screen.dart` | `/add-student` | commit f3ce272 (main) | FULL |
| S02 | 2.2 | `Destination.dc.html` | `lib/features/onboarding/destination_screen.dart` | `/destination` | commit f3ce272 (main) | FULL |
| S02 | 2.4 | `Household.dc.html` | `lib/features/onboarding/household_screen.dart` | `/household` | commit f3ce272 (main) | FULL |
| S02 | 2.8 | `PlanReady.dc.html` | `lib/features/onboarding/plan_ready_screen.dart` | `/plan-ready` | commit f3ce272 (main) | FULL |
| S02 | 2.7 | `Priorities.dc.html` | `lib/features/onboarding/priorities_screen.dart` | `/priorities` | commit f3ce272 (main) | FULL |
| S02 | 2.1 | `Stage.dc.html` | `lib/features/onboarding/stage_screen.dart` | `/stage` | commit f3ce272 (main) | FULL |
| S02 | 2.3 | `Status.dc.html` | `lib/features/onboarding/status_screen.dart` | `/status` | commit f3ce272 (main) | FULL |
| S03 | 3.1 | `Home.dc.html` | `lib/features/home/home_screen.dart` | `/home` | PR #1 | FULL |
| S03 | 3.2 | `Journey.dc.html` | `lib/features/journey/journey_screen.dart` | `/journey` | PR #1 | FULL |
| S03 | 3.7 | `StageCar.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-car` | PR #1 | TEMPLATE |
| S03 | 3.12 | `StageCommunity.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-community` | PR #1 | TEMPLATE |
| S03 | 3.9 | `StageHealth.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-health` | PR #1 | TEMPLATE |
| S03 | 3.5 | `StageHousing.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-housing` | PR #1 | TEMPLATE |
| S03 | 3.8 | `StageInsurance.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-insurance` | PR #1 | TEMPLATE |
| S03 | 3.10 | `StageMoney.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-money` | PR #1 | TEMPLATE |
| S03 | 3.4 | `StagePaperwork.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-paperwork` | PR #1 | TEMPLATE |
| S03 | 3.6 | `StageSchools.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-schools` | PR #1 | TEMPLATE |
| S03 | 3.3 | `StageStatus.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-status` | PR #1 | TEMPLATE |
| S03 | 3.6b | `StageUniversity.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-university` | PR #1 | TEMPLATE |
| S03 | 3.11 | `StageWork.dc.html` | `lib/features/stages/stage_detail_screen.dart` | `/stage-work` | PR #1 | TEMPLATE |
| S04 | 4.14 | `OccupationPathway.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/occupation-pathway` | PR #2 | TEMPLATE |
| S04 | 4.13 | `OccupationSearch.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/occupation-search` | PR #2 | TEMPLATE |
| S04 | 4.8 | `TaskCCB.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-c-c-b` | PR #2 | TEMPLATE |
| S04 | 4.7 | `TaskDoctor.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-doctor` | PR #2 | TEMPLATE |
| S04 | 4.3 | `TaskHousing.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-housing` | PR #2 | TEMPLATE |
| S04 | 4.6 | `TaskInsurance.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-insurance` | PR #2 | TEMPLATE |
| S04 | 4.10 | `TaskLibrary.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-library` | PR #2 | TEMPLATE |
| S04 | 4.5 | `TaskLicence.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-licence` | PR #2 | TEMPLATE |
| S04 | 4.12 | `TaskOSAP.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-o-s-a-p` | PR #2 | TEMPLATE |
| S04 | 4.2 | `TaskSIN.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-s-i-n` | PR #2 | TEMPLATE |
| S04 | 4.4 | `TaskSchool.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-school` | PR #2 | TEMPLATE |
| S04 | 4.1 | `TaskStatus.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-status` | PR #2 | TEMPLATE |
| S04 | 4.11 | `TaskUniApply.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-uni-apply` | PR #2 | TEMPLATE |
| S04 | 4.9 | `TaskWork.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-work` | PR #2 | TEMPLATE |
| S05 | 5.8 | `ContentUpdated.dc.html` | `lib/features/task_actions/content_updated_screen.dart` | `/content-updated` | PR #3 | FULL |
| S05 | 5.6 | `Dismiss.dc.html` | `lib/features/task_actions/` | `/dismiss` | PR #3 | FULL |
| S05 | 5.3 | `DonePicker.dc.html` | `lib/features/task_actions/` | `/done-picker` | PR #3 | FULL |
| S05 | 5.2 | `LocationDetail.dc.html` | `lib/features/task_actions/` | `/location-detail` | PR #3 | FULL |
| S05 | 5.1 | `Nearby.dc.html` | `lib/features/task_actions/` | `/nearby` | PR #3 | FULL |
| S05 | 5.7 | `ReportOutdated.dc.html` | `lib/features/task_actions/` | `/report-outdated` | PR #3 | FULL |
| S05 | 5.5 | `Snooze.dc.html` | `lib/features/task_actions/` | `/snooze` | PR #3 | FULL |
| S05 | 5.4 | `TaskDone.dc.html` | `lib/features/task_actions/` | `/task-done` | PR #3 | FULL |
| S06 | 6.7 | `Calendar.dc.html` | `lib/features/family/` | `/calendar` | PR #4 | FULL |
| S06 | 6.5 | `Checklist.dc.html` | `lib/features/family/` | `/checklist` | PR #4 | FULL |
| S06 | 6.1 | `Family.dc.html` | `lib/features/family/family_screen.dart` | `/family` | PR #4 | FULL |
| S06 | 6.11 | `JustToday.dc.html` | `lib/features/family/` | `/just-today` | PR #4 | FULL |
| S06 | 6.9 | `LifeEvent.dc.html` | `lib/features/family/` | `/life-event` | PR #4 | FULL |
| S06 | 6.2 | `MemberAdult.dc.html` | `lib/features/family/member_adult_screen.dart` | `/member-adult` | PR #4 | FULL |
| S06 | 6.3 | `MemberChild.dc.html` | `lib/features/family/member_child_screen.dart` | `/member-child` | PR #4 | FULL |
| S06 | 6.13 | `MemberStudent.dc.html` | `lib/features/family/member_student_screen.dart` | `/member-student` | PR #4 | FULL |
| S06 | 6.8 | `NotificationSettings.dc.html` | `lib/features/family/` | `/notification-settings` | PR #4 | FULL |
| S06 | 6.10 | `PlanChange.dc.html` | `lib/features/family/` | `/plan-change` | PR #4 | FULL |
| S06 | 6.6 | `Reminders.dc.html` | `lib/features/reminders/reminders_screen.dart` | `/reminders` | PR #4 | FULL |
| S06 | 6.4 | `RemoveMember.dc.html` | `lib/features/family/` | `/remove-member` | PR #4 | FULL |
| S06 | 6.12 | `Search.dc.html` | `lib/features/family/` | `/search` | PR #4 | FULL |
| S07 | 7.3 | `CheckIn.dc.html` | `lib/features/help/` | `/check-in` | PR #5 | FULL |
| S07 | 7.2 | `CommunityGroups.dc.html` | `lib/features/help/` | `/community-groups` | PR #5 | FULL |
| S07 | 7.4 | `ConversationGuide.dc.html` | `lib/features/help/` | `/conversation-guide` | PR #5 | FULL |
| S07 | 7.5 | `Crisis.dc.html` | `lib/features/help/` | `/crisis` | PR #5 | FULL |
| S07 | 7.1 | `Help.dc.html` | `lib/features/help/help_screen.dart` | `/help` | PR #5 | FULL |
| S07 | 7.6 | `HowGuidance.dc.html` | `lib/features/help/` | `/how-guidance` | PR #5 | FULL |
| S08 | 8.4 | `DataExport.dc.html` | `lib/features/profile/` | `/data-export` | PR #6 | FULL |
| S08 | 8.7 | `Deactivate.dc.html` | `lib/features/profile/` | `/deactivate` | PR #6 | FULL |
| S08 | 8.10 | `DeleteConfirm.dc.html` | `lib/features/profile/deactivate_screen.dart` | `/delete-confirm` | PR #6 | FULL |
| S08 | 8.11 | `Deleted.dc.html` | `lib/features/profile/` | `/deleted` | PR #6 | FULL |
| S08 | 8.2 | `EditProfile.dc.html` | `lib/features/profile/edit_profile_screen.dart` | `/edit-profile` | PR #6 | FULL |
| S08 | 8.5 | `LanguageAccess.dc.html` | `lib/features/profile/` | `/language-access` | PR #6 | FULL |
| S08 | 8.8 | `Paused.dc.html` | `lib/features/profile/` | `/paused` | PR #6 | FULL |
| S08 | 8.3 | `PrivacyData.dc.html` | `lib/features/profile/` | `/privacy-data` | PR #6 | FULL |
| S08 | 8.1 | `Settings.dc.html` | `lib/features/profile/` | `/settings` | PR #6 | FULL |
| S08 | 8.6 | `SignOutConfirm.dc.html` | `lib/features/profile/` | `/sign-out-confirm` | PR #6 | FULL |
| S08 | 8.9 | `WelcomeBack.dc.html` | `lib/features/profile/settings_screen.dart` | `/welcome-back` | PR #6 | FULL |
| S09 | 9.1 | `GuestHome.dc.html` | `lib/features/guest/guest_home_screen.dart` | `/guest-home` | PR #7 | FULL |
| S09 | 9.3 | `LocationDenied.dc.html` | `lib/features/guest/` | `/location-denied` | PR #7 | FULL |
| S09 | 9.2 | `Offline.dc.html` | `lib/features/guest/` | `/offline` | PR #7 | FULL |
| S09 | 9.4 | `ServerError.dc.html` | `lib/features/errors/server_error_screen.dart` | `/server-error` | PR #7 | FULL |
| S10 | 10.2 | `DataFlow.dc.html` | `lib/features/dev/data_flow_screen.dart` | `/data-flow` | PR #7 | FULL |
| S10 | 10.1 | `IntegrationMap.dc.html` | `lib/features/dev/integration_map_screen.dart` | `/integration-map` | PR #7 | FULL |
| S11 | 4.26 | `TaskAfterCare.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-after-care` | PR #8 | TEMPLATE |
| S11 | 4.35 | `TaskBank.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-bank` | PR #8 | TEMPLATE |
| S11 | 4.18 | `TaskCRA.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-c-r-a` | PR #8 | TEMPLATE |
| S11 | 4.30 | `TaskCampusServices.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-campus-services` | PR #8 | TEMPLATE |
| S11 | 4.27 | `TaskCredentialAssess.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-credential-assess` | PR #8 | TEMPLATE |
| S11 | 4.36 | `TaskCredit.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-credit` | PR #8 | TEMPLATE |
| S11 | 4.29 | `TaskDomesticTuition.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-domestic-tuition` | PR #8 | TEMPLATE |
| S11 | 4.31 | `TaskDrivingRecord.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-driving-record` | PR #8 | TEMPLATE |
| S11 | 4.25 | `TaskESL.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-e-s-l` | PR #8 | TEMPLATE |
| S11 | 4.28 | `TaskEnglishTest.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-english-test` | PR #8 | TEMPLATE |
| S11 | 4.38 | `TaskGroups.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-groups` | PR #8 | TEMPLATE |
| S11 | 4.17 | `TaskHealthCard.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-health-card` | PR #8 | TEMPLATE |
| S11 | 4.33 | `TaskHealthGap.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-health-gap` | PR #8 | TEMPLATE |
| S11 | 4.24 | `TaskImmunization.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-immunization` | PR #8 | TEMPLATE |
| S11 | 4.34 | `TaskKidsDental.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-kids-dental` | PR #8 | TEMPLATE |
| S11 | 4.15 | `TaskLandingDocs.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-landing-docs` | PR #8 | TEMPLATE |
| S11 | 4.21 | `TaskLease.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-lease` | PR #8 | TEMPLATE |
| S11 | 4.16 | `TaskPRBasics.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-p-r-basics` | PR #8 | TEMPLATE |
| S11 | 4.19 | `TaskPresto.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-presto` | PR #8 | TEMPLATE |
| S11 | 4.32 | `TaskRoadTest.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-road-test` | PR #8 | TEMPLATE |
| S11 | 4.20 | `TaskScams.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-scams` | PR #8 | TEMPLATE |
| S11 | 4.37 | `TaskTaxReturn.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-tax-return` | PR #8 | TEMPLATE |
| S11 | 4.23 | `TaskTenantInsurance.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-tenant-insurance` | PR #8 | TEMPLATE |
| S11 | 4.22 | `TaskUtilities.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-utilities` | PR #8 | TEMPLATE |
| S12 | 12.1 | `VarBCHealth.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-b-c-health` | PR #9 | TEMPLATE |
| S12 | 12.2 | `VarBCHealthGap.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-b-c-health-gap` | PR #9 | TEMPLATE |
| S12 | 12.3 | `VarBCICBC.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-b-c-i-c-b-c` | PR #9 | TEMPLATE |
| S12 | 12.7 | `VarMBNotEligible.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-m-b-not-eligible` | PR #9 | TEMPLATE |
| S12 | 12.4 | `VarQCHealth.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-q-c-health` | PR #9 | TEMPLATE |
| S12 | 12.5 | `VarQCLease.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-q-c-lease` | PR #9 | TEMPLATE |
| S12 | 12.6 | `VarQCSchool.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/var-q-c-school` | PR #9 | TEMPLATE |
| S13 | 13.2 | `HowPartners.dc.html` | `lib/features/partners/` | `/how-partners` | PR #9 | FULL |
| S13 | 13.3 | `LegalHelp.dc.html` | `lib/features/partners/legal_help_screen.dart` | `/legal-help` | PR #9 | FULL |
| S13 | 13.1 | `PartnerDetail.dc.html` | `lib/features/partners/` | `/partner-detail` | PR #9 | FULL |
| S14 | 4.47 | `PathwayCPA.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-c-p-a` | PR #10 | TEMPLATE |
| S14 | 4.42 | `PathwayDentist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-dentist` | PR #10 | TEMPLATE |
| S14 | 4.44 | `PathwayECE.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-e-c-e` | PR #10 | TEMPLATE |
| S14 | 4.48 | `PathwayElectrician.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-electrician` | PR #10 | TEMPLATE |
| S14 | 4.46 | `PathwayLawyer.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-lawyer` | PR #10 | TEMPLATE |
| S14 | 4.39 | `PathwayNurse.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-nurse` | PR #10 | TEMPLATE |
| S14 | 4.41 | `PathwayPharmacist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-pharmacist` | PR #10 | TEMPLATE |
| S14 | 4.40 | `PathwayPhysician.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-physician` | PR #10 | TEMPLATE |
| S14 | 4.49 | `PathwayPlumber.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-plumber` | PR #10 | TEMPLATE |
| S14 | 4.45 | `PathwaySocialWorker.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-social-worker` | PR #10 | TEMPLATE |
| S14 | 4.43 | `PathwayTeacher.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-teacher` | PR #10 | TEMPLATE |
| S15 | 6.14 | `BudgetPlanner.dc.html` | `lib/features/plan/budget_planner_screen.dart` | `/budget-planner` | PR #10 | FULL |
| S15 | 6.15 | `JoinHousehold.dc.html` | `lib/features/family/join_household_screen.dart` | `/join-household` | PR #10 | FULL |
| S15 | 8.12 | `PrivacyPolicy.dc.html` | `lib/features/profile/privacy_policy_screen.dart` | `/privacy-policy` | PR #10 | FULL |
| S15 | 4.50 | `TaskCarCosts.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-car-costs` | PR #10 | TEMPLATE |
| S16 | 16.6 | `HomeApproved.dc.html` | `lib/features/home/stage_home_screen.dart` | `/home-approved` | PR #11 | FULL |
| S16 | 16.2 | `HomeExploring.dc.html` | `lib/features/home/stage_home_screen.dart` | `/home-exploring` | PR #11 | FULL |
| S16 | 16.8 | `HomeSettled.dc.html` | `lib/features/home/stage_home_screen.dart` | `/home-settled` | PR #11 | FULL |
| S16 | 16.4 | `HomeWaiting.dc.html` | `lib/features/home/stage_home_screen.dart` | `/home-waiting` | PR #11 | FULL |
| S16 | 16.7 | `JourneyApproved.dc.html` | `lib/features/journey/journey_approved_screen.dart` | `/journey-approved` | PR #11 | FULL |
| S16 | 16.5 | `PlanReadyApproved.dc.html` | `lib/features/onboarding/stage_plan_ready_screen.dart` | `/plan-ready-approved` | PR #11 | FULL |
| S16 | 16.1 | `PlanReadyExploring.dc.html` | `lib/features/onboarding/stage_plan_ready_screen.dart` | `/plan-ready-exploring` | PR #11 | FULL |
| S16 | 16.3 | `PlanReadyWaiting.dc.html` | `lib/features/onboarding/stage_plan_ready_screen.dart` | `/plan-ready-waiting` | PR #11 | FULL |
| S17 | 16.11 | `ExpCities.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/exp-cities` | PR #11 | TEMPLATE |
| S17 | 16.9 | `ExpOptions.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/exp-options` | PR #11 | TEMPLATE |
| S17 | 16.10 | `ExpRepresentative.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/exp-representative` | PR #11 | TEMPLATE |
| S17 | 16.22 | `PreArrivalDay.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-arrival-day` | PR #11 | TEMPLATE |
| S17 | 16.23 | `PreFirst72.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-first72` | PR #11 | TEMPLATE |
| S17 | 16.18 | `PreGoods.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-goods` | PR #11 | TEMPLATE |
| S17 | 16.19 | `PreKidsRecords.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-kids-records` | PR #11 | TEMPLATE |
| S17 | 16.20 | `PreMedications.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-medications` | PR #11 | TEMPLATE |
| S17 | 16.16 | `PreServices.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-services` | PR #11 | TEMPLATE |
| S17 | 16.21 | `PreTempHousing.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-temp-housing` | PR #11 | TEMPLATE |
| S17 | 16.17 | `PreTravelDocs.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/pre-travel-docs` | PR #11 | TEMPLATE |
| S17 | 16.13 | `WaitDocs.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/wait-docs` | PR #11 | TEMPLATE |
| S17 | 16.14 | `WaitSavings.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/wait-savings` | PR #11 | TEMPLATE |
| S17 | 16.12 | `WaitTrack.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/wait-track` | PR #11 | TEMPLATE |
| S17 | 16.15 | `WaitWellbeing.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/wait-wellbeing` | PR #11 | TEMPLATE |
| S18 | 4.53 | `TaskAddressChange.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-address-change` | PR #12 | TEMPLATE |
| S18 | 4.63 | `TaskBuyCar.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-buy-car` | PR #12 | TEMPLATE |
| S18 | 4.65 | `TaskCarSeats.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-car-seats` | PR #12 | TEMPLATE |
| S18 | 4.57 | `TaskChildCare.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-child-care` | PR #12 | TEMPLATE |
| S18 | 4.58 | `TaskChildCareSubsidy.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-child-care-subsidy` | PR #12 | TEMPLATE |
| S18 | 4.59 | `TaskEarlyON.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-early-o-n` | PR #12 | TEMPLATE |
| S18 | 4.56 | `TaskHousingHelp.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-housing-help` | PR #12 | TEMPLATE |
| S18 | 4.55 | `TaskMoveIn.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-move-in` | PR #12 | TEMPLATE |
| S18 | 4.51 | `TaskPhotoCard.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-photo-card` | PR #12 | TEMPLATE |
| S18 | 4.64 | `TaskRegisterCar.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-register-car` | PR #12 | TEMPLATE |
| S18 | 4.54 | `TaskRentalSearch.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-rental-search` | PR #12 | TEMPLATE |
| S18 | 4.60 | `TaskSchoolBus.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-school-bus` | PR #12 | TEMPLATE |
| S18 | 4.61 | `TaskSpecialEd.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-special-ed` | PR #12 | TEMPLATE |
| S18 | 4.62 | `TaskTeenCredits.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-teen-credits` | PR #12 | TEMPLATE |
| S18 | 4.52 | `TaskTranslations.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-translations` | PR #12 | TEMPLATE |
| S19 | 4.83 | `TaskBridging.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-bridging` | PR #12 | TEMPLATE |
| S19 | 4.84 | `TaskBusiness.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-business` | PR #12 | TEMPLATE |
| S19 | 4.76 | `TaskCLB.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-c-l-b` | PR #12 | TEMPLATE |
| S19 | 4.78 | `TaskCRAScams.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-c-r-a-scams` | PR #12 | TEMPLATE |
| S19 | 4.71 | `TaskDentalPlan.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-dental-plan` | PR #12 | TEMPLATE |
| S19 | 4.74 | `TaskGSTCredit.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-g-s-t-credit` | PR #12 | TEMPLATE |
| S19 | 4.67 | `TaskInsuranceHistory.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-insurance-history` | PR #12 | TEMPLATE |
| S19 | 4.82 | `TaskJobScams.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-job-scams` | PR #12 | TEMPLATE |
| S19 | 4.80 | `TaskJobSearch.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-job-search` | PR #12 | TEMPLATE |
| S19 | 4.72 | `TaskMentalHealth.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-mental-health` | PR #12 | TEMPLATE |
| S19 | 4.75 | `TaskOTB.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-o-t-b` | PR #12 | TEMPLATE |
| S19 | 4.73 | `TaskPregnancy.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-pregnancy` | PR #12 | TEMPLATE |
| S19 | 4.70 | `TaskPrescriptions.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-prescriptions` | PR #12 | TEMPLATE |
| S19 | 4.79 | `TaskResume.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-resume` | PR #12 | TEMPLATE |
| S19 | 4.77 | `TaskSendMoney.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-send-money` | PR #12 | TEMPLATE |
| S19 | 4.69 | `TaskWhereCare.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-where-care` | PR #12 | TEMPLATE |
| S19 | 4.66 | `TaskWinterDriving.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-winter-driving` | PR #12 | TEMPLATE |
| S19 | 4.68 | `TaskWorkBenefits.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-work-benefits` | PR #12 | TEMPLATE |
| S19 | 4.81 | `TaskWorkRights.dc.html` | `lib/features/tasks/task_detail_screen.dart` | `/task-work-rights` | PR #12 | TEMPLATE |
| S20 | 20.1 | `Explore.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore` | PR #13 | TEMPLATE |
| S20 | 20.3 | `ExploreCanoo.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-canoo` | PR #13 | TEMPLATE |
| S20 | 20.12 | `ExploreCity.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-city` | PR #13 | TEMPLATE |
| S20 | 20.6 | `ExploreEvents.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-events` | PR #13 | TEMPLATE |
| S20 | 20.10 | `ExploreFilters.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-filters` | PR #13 | TEMPLATE |
| S20 | 20.2 | `ExploreFreePasses.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-free-passes` | PR #13 | TEMPLATE |
| S20 | 20.7 | `ExploreOffers.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-offers` | PR #13 | TEMPLATE |
| S20 | 20.5 | `ExplorePlace.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-place` | PR #13 | TEMPLATE |
| S20 | 20.4 | `ExplorePlaces.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-places` | PR #13 | TEMPLATE |
| S20 | 20.9 | `ExploreSaved.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-saved` | PR #13 | TEMPLATE |
| S20 | 20.11 | `ExploreWinter.dc.html` | `lib/features/explore/explore_screen.dart` | `/explore-winter` | PR #13 | TEMPLATE |
| S20 | 20.8 | `OfferDetail.dc.html` | `lib/features/explore/explore_screen.dart` | `/offer-detail` | PR #13 | TEMPLATE |
| S21 | 21.14 | `AndroidLocation.dc.html` | `lib/features/errors/section21_screen.dart` | `/android-location` | PR #14 | TEMPLATE |
| S21 | 21.8 | `DeleteError.dc.html` | `lib/features/errors/section21_screen.dart` | `/delete-error` | PR #14 | TEMPLATE |
| S21 | 21.2 | `ExploreEvent.dc.html` | `lib/features/errors/section21_screen.dart` | `/explore-event` | PR #14 | TEMPLATE |
| S21 | 21.3 | `ExplorePass.dc.html` | `lib/features/errors/section21_screen.dart` | `/explore-pass` | PR #14 | TEMPLATE |
| S21 | 21.13 | `ExploreSavedEmpty.dc.html` | `lib/features/errors/section21_screen.dart` | `/explore-saved-empty` | PR #14 | TEMPLATE |
| S21 | 21.7 | `ExportError.dc.html` | `lib/features/errors/section21_screen.dart` | `/export-error` | PR #14 | TEMPLATE |
| S21 | 21.12 | `FamilySingle.dc.html` | `lib/features/errors/section21_screen.dart` | `/family-single` | PR #14 | TEMPLATE |
| S21 | 21.15 | `HomeAR.dc.html` | `lib/features/errors/section21_screen.dart` | `/home-a-r` | PR #14 | TEMPLATE |
| S21 | 21.5 | `LanguageRestart.dc.html` | `lib/features/errors/section21_screen.dart` | `/language-restart` | PR #14 | TEMPLATE |
| S21 | 21.4 | `LeaveQuickly.dc.html` | `lib/features/errors/section21_screen.dart` | `/leave-quickly` | PR #14 | TEMPLATE |
| S21 | 21.10 | `SearchEmpty.dc.html` | `lib/features/errors/section21_screen.dart` | `/search-empty` | PR #14 | TEMPLATE |
| S21 | 21.6 | `SignInError.dc.html` | `lib/features/errors/section21_screen.dart` | `/sign-in-error` | PR #14 | TEMPLATE |
| S21 | 21.11 | `StageComplete.dc.html` | `lib/features/errors/section21_screen.dart` | `/stage-complete` | PR #14 | TEMPLATE |
| S21 | 21.1 | `TaskMore.dc.html` | `lib/features/errors/section21_screen.dart` | `/task-more` | PR #14 | TEMPLATE |
| S21 | 21.16 | `TaskPrestoAR.dc.html` | `lib/features/errors/section21_screen.dart` | `/task-presto-a-r` | PR #14 | TEMPLATE |
| S21 | 21.9 | `WebDeleteAccount.dc.html` | `lib/features/errors/section21_screen.dart` | `/web-delete-account` | PR #14 | TEMPLATE |
| S22 | 22.0 | `AllProfessions.dc.html` | `lib/features/tasks/all_professions_screen.dart` | `/all-professions` | PR #10 | FULL |
| S22 | 22.19 | `PathwayArchitect.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-architect` | PR #10 | TEMPLATE |
| S22 | 22.16 | `PathwayAudiologistSLP.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-audiologist-s-l-p` | PR #10 | TEMPLATE |
| S22 | 22.30 | `PathwayAutoBody.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-auto-body` | PR #10 | TEMPLATE |
| S22 | 22.29 | `PathwayAutoTech.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-auto-tech` | PR #10 | TEMPLATE |
| S22 | 22.13 | `PathwayChiropractor.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-chiropractor` | PR #10 | TEMPLATE |
| S22 | 22.33 | `PathwayCrane.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-crane` | PR #10 | TEMPLATE |
| S22 | 22.1 | `PathwayDentalHygienist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-dental-hygienist` | PR #10 | TEMPLATE |
| S22 | 22.17 | `PathwayDenturist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-denturist` | PR #10 | TEMPLATE |
| S22 | 22.8 | `PathwayDietitian.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-dietitian` | PR #10 | TEMPLATE |
| S22 | 22.22 | `PathwayGeoscientist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-geoscientist` | PR #10 | TEMPLATE |
| S22 | 22.32 | `PathwayHairstylist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-hairstylist` | PR #10 | TEMPLATE |
| S22 | 22.24 | `PathwayInsurance.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-insurance` | PR #10 | TEMPLATE |
| S22 | 22.15 | `PathwayKinesiologist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-kinesiologist` | PR #10 | TEMPLATE |
| S22 | 22.4 | `PathwayMLT.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-m-l-t` | PR #10 | TEMPLATE |
| S22 | 22.5 | `PathwayMRT.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-m-r-t` | PR #10 | TEMPLATE |
| S22 | 22.14 | `PathwayMassage.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-massage` | PR #10 | TEMPLATE |
| S22 | 22.7 | `PathwayMidwife.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-midwife` | PR #10 | TEMPLATE |
| S22 | 22.25 | `PathwayMortgage.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-mortgage` | PR #10 | TEMPLATE |
| S22 | 22.3 | `PathwayOT.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-o-t` | PR #10 | TEMPLATE |
| S22 | 22.12 | `PathwayOptician.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-optician` | PR #10 | TEMPLATE |
| S22 | 22.11 | `PathwayOptometrist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-optometrist` | PR #10 | TEMPLATE |
| S22 | 22.18 | `PathwayParalegal.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-paralegal` | PR #10 | TEMPLATE |
| S22 | 22.2 | `PathwayPhysio.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-physio` | PR #10 | TEMPLATE |
| S22 | 22.9 | `PathwayPsychologist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-psychologist` | PR #10 | TEMPLATE |
| S22 | 22.10 | `PathwayPsychotherapist.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-psychotherapist` | PR #10 | TEMPLATE |
| S22 | 22.6 | `PathwayRT.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-r-t` | PR #10 | TEMPLATE |
| S22 | 22.23 | `PathwayRealEstate.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-real-estate` | PR #10 | TEMPLATE |
| S22 | 22.26 | `PathwayRefrigeration.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-refrigeration` | PR #10 | TEMPLATE |
| S22 | 22.27 | `PathwaySheetMetal.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-sheet-metal` | PR #10 | TEMPLATE |
| S22 | 22.28 | `PathwaySteamfitter.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-steamfitter` | PR #10 | TEMPLATE |
| S22 | 22.21 | `PathwaySurveyor.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-surveyor` | PR #10 | TEMPLATE |
| S22 | 22.31 | `PathwayTruckCoach.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-truck-coach` | PR #10 | TEMPLATE |
| S22 | 22.20 | `PathwayVet.dc.html` | `lib/features/tasks/regulated_pathway_detail_screen.dart` | `/pathway-vet` | PR #10 | TEMPLATE |
| S23 | 23.7 | `EventSkate.dc.html` | `lib/features/explore/explore_screen.dart` | `/event-skate` | PR #13 | TEMPLATE |
| S23 | 23.8 | `EventWelcome.dc.html` | `lib/features/explore/explore_screen.dart` | `/event-welcome` | PR #13 | TEMPLATE |
| S23 | 23.9 | `EventWinterWalk.dc.html` | `lib/features/explore/explore_screen.dart` | `/event-winter-walk` | PR #13 | TEMPLATE |
| S23 | 23.14 | `OfferBank.dc.html` | `lib/features/explore/explore_screen.dart` | `/offer-bank` | PR #13 | TEMPLATE |
| S23 | 23.16 | `OfferFurniture.dc.html` | `lib/features/explore/explore_screen.dart` | `/offer-furniture` | PR #13 | TEMPLATE |
| S23 | 23.15 | `OfferPhone.dc.html` | `lib/features/explore/explore_screen.dart` | `/offer-phone` | PR #13 | TEMPLATE |
| S23 | 23.11 | `PassConservation.dc.html` | `lib/features/explore/explore_screen.dart` | `/pass-conservation` | PR #13 | TEMPLATE |
| S23 | 23.10 | `PassOntarioParks.dc.html` | `lib/features/explore/explore_screen.dart` | `/pass-ontario-parks` | PR #13 | TEMPLATE |
| S23 | 23.12 | `PassPAMA.dc.html` | `lib/features/explore/explore_screen.dart` | `/pass-p-a-m-a` | PR #13 | TEMPLATE |
| S23 | 23.13 | `PassSwimSkate.dc.html` | `lib/features/explore/explore_screen.dart` | `/pass-swim-skate` | PR #13 | TEMPLATE |
| S23 | 23.3 | `PlaceKariya.dc.html` | `lib/features/explore/explore_screen.dart` | `/place-kariya` | PR #13 | TEMPLATE |
| S23 | 23.6 | `PlaceNiagara.dc.html` | `lib/features/explore/explore_screen.dart` | `/place-niagara` | PR #13 | TEMPLATE |
| S23 | 23.5 | `PlacePAMA.dc.html` | `lib/features/explore/explore_screen.dart` | `/place-p-a-m-a` | PR #13 | TEMPLATE |
| S23 | 23.2 | `PlacePortCredit.dc.html` | `lib/features/explore/explore_screen.dart` | `/place-port-credit` | PR #13 | TEMPLATE |
| S23 | 23.1 | `PlaceRattray.dc.html` | `lib/features/explore/explore_screen.dart` | `/place-rattray` | PR #13 | TEMPLATE |
| S23 | 23.4 | `PlaceRiverwood.dc.html` | `lib/features/explore/explore_screen.dart` | `/place-riverwood` | PR #13 | TEMPLATE |
