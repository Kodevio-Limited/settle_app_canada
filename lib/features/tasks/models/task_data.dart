// GENERATED FROM LOCAL SPEC HTML FILES - ZERO ASSUMPTIONS
class TaskPerson {
  final String name;
  final String initial;
  final String bgHex;

  const TaskPerson({
    required this.name,
    required this.initial,
    required this.bgHex,
  });
}

class TaskStat {
  final String label;
  final String value;

  const TaskStat({
    required this.label,
    required this.value,
  });
}

class TaskNearbyItem {
  final String num;
  final String name;
  final String sub;

  const TaskNearbyItem({
    required this.num,
    required this.name,
    required this.sub,
  });
}

class TaskModel {
  final String id;
  final String tag;
  final String title;
  final List<TaskPerson> forWhom;
  final String? forWhomNote;
  final List<String> whyTags;
  final List<TaskStat> stats;
  final List<String> steps;
  final String bringTitle;
  final String? bringNote;
  final List<String> checklist;
  final String? checklistFootnote;
  final String nearbyTitle;
  final String? nearbyNote;
  final List<TaskNearbyItem> nearbyItems;
  final bool hasMap;
  final String sourceName;
  final String sourceSub;
  final bool isCompleted;
  final String? completedText;
  final String disclaimer;

  const TaskModel({
    required this.id,
    required this.tag,
    required this.title,
    this.forWhom = const [],
    this.forWhomNote,
    this.whyTags = const [],
    this.stats = const [],
    this.steps = const [],
    required this.bringTitle,
    this.bringNote,
    this.checklist = const [],
    this.checklistFootnote,
    required this.nearbyTitle,
    this.nearbyNote,
    this.nearbyItems = const [],
    this.hasMap = false,
    required this.sourceName,
    required this.sourceSub,
    this.isCompleted = false,
    this.completedText,
    required this.disclaimer,
  });
}

final List<TaskModel> allTasksData = [
  TaskModel(
    id: 'TaskCCB',
    tag: "Money & benefits \u00b7 Stage 8 of 10",
    title: "Apply for the Canada Child Benefit",
    forWhom: const [
      TaskPerson(name: 'Sami', initial: 'S', bgHex: '#CA292E'),
      TaskPerson(name: 'Nour', initial: 'N', bgHex: '#6B4C8A'),
    ],
    whyTags: const ["Children under 18", "SIN marked done"],
    stats: const [
      TaskStat(label: "Where", value: "CRA"),
      TaskStat(label: "How", value: "CRA My Account or form"),
    ],
    steps: const ["Check the eligibility rules on the CRA's page.", "Apply through CRA My Account, or by form. The CRA may ask about income from before you arrived.", "File a tax return every year to keep benefits going. We'll remind you."],
    bringTitle: "What to have ready",
    checklist: const ["Your SIN (you enter it on CRA's site, not here)", "Proof of status for each child", "The date you arrived"],
    nearbyTitle: "Free help near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Free tax clinic (volunteer program)", sub: "[distance] \u00b7 seasonal hours"),
      TaskNearbyItem(num: '2', name: "Service Canada Centre \u00b7 Mississauga", sub: "2.1 km \u00b7 Open now"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Canada.ca (CRA)",
    sourceSub: "Canada Child Benefit \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "Whether you qualify depends on your residency and status \u2014 the CRA decides, not Settle.",
  ),
  TaskModel(
    id: 'TaskDoctor',
    tag: "Health care \u00b7 Stage 7 of 10",
    title: "Find a family doctor or nurse practitioner",
    forWhomNote: "For everyone in the household",
    whyTags: const ["Living in Ontario", "No family doctor yet"],
    stats: const [
      TaskStat(label: "Where", value: "Health Care Connect"),
      TaskStat(label: "Timing", value: "Can take a while"),
    ],
    steps: const ["Register with Health Care Connect, Ontario's doctor-matching service, once you have health cards.", "While you wait, use walk-in clinics or call Health811 to speak to a nurse.", "In an emergency, go to a hospital or call 911."],
    bringTitle: "What to have ready",
    checklist: const ["Everyone's Ontario health cards", "A list of current medications, for your own reference"],
    nearbyTitle: "Care near you while you wait",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Walk-in clinic \u00b7 [name]", sub: "1.2 km \u00b7 Open now"),
      TaskNearbyItem(num: '2', name: "Walk-in clinic \u00b7 [name]", sub: "2.4 km \u00b7 closes [TIME]"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Ontario.ca",
    sourceSub: "Health Care Connect \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "Settle gives no medical advice and does not register you \u2014 you do that on the official service.",
  ),
  TaskModel(
    id: 'TaskHousing',
    tag: "Housing \u00b7 Stage 3 of 10",
    title: "Know your rights before you sign a lease",
    forWhom: const [
      TaskPerson(name: 'Layla', initial: 'L', bgHex: '#123332'),
      TaskPerson(name: 'Omar', initial: 'O', bgHex: '#2E6B4F'),
    ],
    whyTags: const ["You're renting in Ontario", "You picked \"Finding a home\""],
    stats: const [
      TaskStat(label: "Cost", value: "Free"),
      TaskStat(label: "Unlocks", value: "Address for school & health"),
    ],
    steps: const ["See the place in person and meet the landlord before paying anything.", "Ask for Ontario's standard lease, which most private rentals use.", "Check the official rules on deposits and what a landlord may ask for."],
    bringTitle: "What to bring to a viewing",
    checklist: const ["Photo ID", "Job letter or proof of income, if you have it", "References"],
    nearbyTitle: "Free tenant help near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Community legal clinic \u00b7 Mississauga", sub: "3.0 km \u00b7 Open now"),
      TaskNearbyItem(num: '', name: "Landlord and Tenant Board", sub: "Online and by phone"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Ontario.ca",
    sourceSub: "Renting in Ontario: your rights \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "General information, not legal advice. For a dispute, contact a legal clinic.",
  ),
  TaskModel(
    id: 'TaskInsurance',
    tag: "Insurance \u00b7 Stage 6 of 10",
    title: "Get auto insurance before you drive",
    forWhom: const [
      TaskPerson(name: 'Layla', initial: 'L', bgHex: '#123332'),
      TaskPerson(name: 'Omar', initial: 'O', bgHex: '#2E6B4F'),
    ],
    whyTags: const ["You plan to drive", "Required by law in Ontario"],
    stats: const [
      TaskStat(label: "Cost", value: "Varies a lot"),
      TaskStat(label: "Depends on", value: "Your licence step"),
    ],
    steps: const ["Ask your previous insurer for a letter showing your driving and claims history.", "Get quotes from more than one licensed broker or insurer.", "Check the broker or agent is licensed before you pay."],
    bringTitle: "Have ready when you call",
    checklist: const ["Your licence (or licence step)", "Letter from your previous insurer", "The car's details"],
    nearbyTitle: "No nearby offices here, on purpose",
    nearbyNote: "Settle doesn't sell, rank or recommend insurance. Use the official registers to check who you're buying from.",
    nearbyItems: const [
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 FSRA",
    sourceSub: "Auto insurance basics \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "General information, not insurance advice.",
  ),
  TaskModel(
    id: 'TaskLibrary',
    tag: "Community \u00b7 Stage 10 of 10",
    title: "Get free library cards for the family",
    forWhomNote: "For everyone \u2014 each person can have their own card",
    whyTags: const ["Living in Mississauga", "Kids in the household", "You picked \"Feeling at home\""],
    stats: const [
      TaskStat(label: "Cost", value: "Free"),
      TaskStat(label: "Unlocks", value: "Programs, Wi-Fi, books"),
    ],
    steps: const ["Visit any branch with proof of your Mississauga address.", "Ask about newcomer programs and English conversation circles.", "Let the kids pick a book in your home language too."],
    bringTitle: "What to bring",
    checklist: const ["Photo ID", "Proof of address (e.g. lease or a bill)"],
    nearbyTitle: "Libraries near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Mississauga Central Library", sub: "1.5 km \u00b7 Open now"),
      TaskNearbyItem(num: '2', name: "Mississauga Library \u00b7 [branch]", sub: "2.8 km \u00b7 Open now"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Mississauga Library",
    sourceSub: "Get a library card \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "",
  ),
  TaskModel(
    id: 'TaskLicence',
    tag: "Car & driving \u00b7 Stage 5 of 10",
    title: "Exchange or start your Ontario driver's licence",
    forWhom: const [
      TaskPerson(name: 'Layla', initial: 'L', bgHex: '#123332'),
      TaskPerson(name: 'Omar', initial: 'O', bgHex: '#2E6B4F'),
    ],
    whyTags: const ["You both drive", "Licences from outside Canada", "Living in Ontario"],
    stats: const [
      TaskStat(label: "Cost", value: "Fees apply [from DriveTest]"),
      TaskStat(label: "Unlocks", value: "Car insurance"),
    ],
    steps: const ["Check if Ontario has a licence exchange agreement with your country.", "Check how long you may drive on your current licence here.", "Visit a DriveTest centre with your documents. Some people need tests."],
    bringTitle: "What to bring",
    checklist: const ["Your current licence", "Proof of driving experience or record", "Certified translation, if not English or French", "Proof of identity and status"],
    nearbyTitle: "DriveTest centres near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "DriveTest Centre \u00b7 Mississauga", sub: "4.2 km \u00b7 Open now"),
      TaskNearbyItem(num: '2', name: "DriveTest Centre \u00b7 Brampton", sub: "9.8 km \u00b7 Opens [TIME]"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Ontario.ca & DriveTest",
    sourceSub: "Book online at DriveTest \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "",
  ),
  TaskModel(
    id: 'TaskOSAP',
    tag: "University stream \u00b7 Stage 4",
    title: "Apply for OSAP student aid",
    forWhom: const [
      TaskPerson(name: 'Yasmin', initial: 'Y', bgHex: '#4A6FA5'),
    ],
    whyTags: const ["Planning post-secondary study", "You told us: permanent resident"],
    stats: const [
      TaskStat(label: "Where", value: "OSAP website"),
      TaskStat(label: "What it is", value: "Grants & loans"),
    ],
    steps: const ["Use the OSAP estimator to see roughly what Yasmin may get.", "Apply online on the OSAP website, ideally soon after accepting an offer.", "Visit the school's financial aid office if anything is unclear \u2014 they confirm enrolment."],
    bringTitle: "Have ready",
    checklist: const ["Yasmin's SIN (typed on OSAP, never here)", "Proof of PR status", "Parents' income details, if she's a dependent student", "Program and school details"],
    nearbyTitle: "Financial aid help near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "UTM \u00b7 financial aid office", sub: "[distance] \u00b7 drop-in hours"),
      TaskNearbyItem(num: '2', name: "Newcomer youth advising \u00b7 [agency]", sub: "Settlement agency \u00b7 [distance]"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Ontario.ca",
    sourceSub: "Learn about OSAP \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "OSAP is for Ontario residents who are citizens, permanent residents or protected persons. The amount depends on financial need \u2014 Ontario decides, not Settle.",
  ),
  TaskModel(
    id: 'TaskSIN',
    tag: "Paperwork \u00b7 Stage 2 of 10",
    title: "Apply for your Social Insurance Number (SIN)",
    forWhom: const [
      TaskPerson(name: 'Layla', initial: 'L', bgHex: '#123332'),
      TaskPerson(name: 'Omar', initial: 'O', bgHex: '#2E6B4F'),
      TaskPerson(name: 'Yasmin', initial: 'Y', bgHex: '#4A6FA5'),
    ],
    whyTags: const ["You told us: permanent resident", "Arrived Sep 2026", "Needed to work & get benefits"],
    stats: const [
      TaskStat(label: "Cost", value: "Free"),
      TaskStat(label: "Where", value: "Service Canada"),
      TaskStat(label: "How", value: "Online, in person or mail"),
      TaskStat(label: "Unlocks", value: "Child benefit, tax"),
    ],
    steps: const ["Check which documents Service Canada accepts for your status on the official page.", "Choose how to apply: online, at an office nearby, or by mail.", "Each adult applies for themselves, with their own original documents.", "Keep your SIN private. Share it only with employers, banks and government."],
    bringTitle: "What to bring",
    checklist: const ["Status document (e.g. PR confirmation) \u2014 Layla", "Status document (e.g. PR confirmation) \u2014 Omar", "Name-change proof, only if your name differs"],
    checklistFootnote: "Originals stay with you. Nothing is uploaded \u2014 we only remember your ticks. Confirm the list on the official page.",
    nearbyTitle: "Nearby Service Canada centres",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Service Canada Centre \u00b7 Mississauga", sub: "2.1 km \u00b7 Open now"),
      TaskNearbyItem(num: '2', name: "Service Canada Centre \u00b7 Brampton", sub: "8.6 km \u00b7 Open now"),
    ],
    hasMap: true,
    sourceName: "Official source \u00b7 Canada.ca",
    sourceSub: "Social Insurance Number \u00b7 Last verified [DATE]",
    isCompleted: false,
    disclaimer: "General information to help you organize. Not immigration or legal advice. Always confirm on the official source.",
  ),
  TaskModel(
    id: 'TaskSchool',
    tag: "Schools \u00b7 Stage 4 of 10",
    title: "Register Sami & Nour with your school board",
    forWhom: const [
      TaskPerson(name: 'Sami', initial: 'S', bgHex: '#CA292E'),
      TaskPerson(name: 'Nour', initial: 'N', bgHex: '#6B4C8A'),
    ],
    whyTags: const ["Children aged 6\u20139 and 12\u201314", "Living in Peel Region", "You picked \"Kids' school\""],
    stats: const [
      TaskStat(label: "Cost", value: "Free (public boards)"),
      TaskStat(label: "How", value: "Book an appointment"),
    ],
    steps: const ["Choose a board: Peel District (public) or Dufferin-Peel (Catholic). Each has its own rules.", "Find your home school from your address with the board's school locator.", "Book a newcomer registration appointment and bring your documents."],
    bringTitle: "What to bring",
    checklist: const ["Proof of address in the school area", "Proof of age and status for each child", "Vaccination records", "Past report cards, if you have them"],
    nearbyTitle: "Registration offices near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Peel District School Board", sub: "Newcomer registration \u00b7 3.4 km"),
      TaskNearbyItem(num: '2', name: "Dufferin-Peel Catholic DSB", sub: "Newcomer registration \u00b7 5.1 km"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 school boards",
    sourceSub: "Registering a new student \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "",
  ),
  TaskModel(
    id: 'TaskStatus',
    tag: "Status & arrival \u00b7 Stage 1 of 10",
    title: "Make sure your PR cards reach you",
    forWhomNote: "For everyone in the household",
    whyTags: const ["You told us: permanent resident", "Arrived Sep 2026", "Cards are mailed to you"],
    stats: const [
      TaskStat(label: "Where", value: "IRCC, online"),
      TaskStat(label: "Office visit", value: "Not needed"),
    ],
    steps: const ["Check the mailing address IRCC has for you is where you live now.", "If you've moved, update it through IRCC's official online form.", "Card taking a while? Check IRCC's current processing times."],
    bringTitle: "What to bring",
    bringNote: "Nothing \u2014 this is done online. Keep your landing document safe until your card arrives.",
    checklist: const [],
    nearbyTitle: "Help near you",
    nearbyNote: "No office visit is needed. If something's wrong with your card or case, a settlement worker can help you understand your options.",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Newcomer Centre of Peel", sub: "Settlement agency \u00b7 [distance]"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 IRCC",
    sourceSub: "PR card \u00b7 Last verified [DATE]",
    isCompleted: true,
    completedText: "Done for everyone \u00b7 Sep 20",
    disclaimer: "General information to help you organize. Not immigration advice. Settle never contacts IRCC for you.",
  ),
  TaskModel(
    id: 'TaskUniApply',
    tag: "University stream \u00b7 Stage 4",
    title: "Apply to university or college in Ontario",
    forWhom: const [
      TaskPerson(name: 'Yasmin', initial: 'Y', bgHex: '#4A6FA5'),
    ],
    whyTags: const ["Adult child, 18\u201321", "Planning university", "Living in Ontario"],
    stats: const [
      TaskStat(label: "Universities", value: "Apply via OUAC"),
      TaskStat(label: "Colleges", value: "ontariocolleges.ca"),
      TaskStat(label: "Cost", value: "Application fees apply"),
      TaskStat(label: "Unlocks", value: "OSAP, campus services"),
    ],
    steps: const ["Shortlist programs and read each one's requirements for students educated outside Canada.", "Apply online \u2014 universities through OUAC, colleges through ontariocolleges.ca. Watch each program's deadline.", "Send transcripts the way each school asks \u2014 sometimes with an assessment or certified translation.", "Ask admissions to confirm Yasmin is charged domestic fees as a permanent resident."],
    bringTitle: "Have ready",
    checklist: const ["High-school transcripts and diploma", "Certified translations, if not English or French", "Proof of PR status, for domestic fees", "English test results, only if a school asks"],
    nearbyTitle: "Campuses near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "University of Toronto Mississauga", sub: "University \u00b7 [distance] \u00b7 admissions office"),
      TaskNearbyItem(num: '2', name: "Sheridan College \u00b7 Mississauga campus", sub: "College \u00b7 [distance]"),
      TaskNearbyItem(num: '3', name: "Sheridan College \u00b7 Brampton campus", sub: "College \u00b7 [distance]"),
    ],
    hasMap: false,
    sourceName: "Official sources \u00b7 OUAC & ontariocolleges.ca",
    sourceSub: "Applying from outside Canada's school system \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "",
  ),
  TaskModel(
    id: 'TaskWork',
    tag: "Work & credentials \u00b7 Stage 9 of 10",
    title: "Connect with free employment services",
    forWhom: const [
      TaskPerson(name: 'Omar', initial: 'O', bgHex: '#2E6B4F'),
    ],
    whyTags: const ["Omar is looking for work", "Living in Ontario"],
    stats: const [
      TaskStat(label: "Cost", value: "Free"),
      TaskStat(label: "What you get", value: "Resume help, job leads"),
    ],
    steps: const ["Visit or call an Employment Ontario centre near you.", "Ask about newcomer programs, mentoring and bridging programs for your field.", "If your job is regulated, check with its regulator before you apply for roles."],
    bringTitle: "What to bring",
    checklist: const ["Your resume, even if it's not Canadian-style yet", "Education documents", "Work references"],
    nearbyTitle: "Employment Ontario near you",
    nearbyItems: const [
      TaskNearbyItem(num: '1', name: "Employment Ontario centre \u00b7 [name]", sub: "1.9 km \u00b7 Open now"),
      TaskNearbyItem(num: '2', name: "Employment Ontario centre \u00b7 [name]", sub: "4.6 km \u00b7 Open now"),
    ],
    hasMap: false,
    sourceName: "Official source \u00b7 Ontario.ca",
    sourceSub: "Employment Ontario \u00b7 verified [DATE]",
    isCompleted: false,
    disclaimer: "",
  ),
];

TaskModel? getTaskById(String id) {
  try {
    return allTasksData.firstWhere(
      (t) => t.id.toLowerCase() == id.toLowerCase(),
    );
  } catch (_) {
    return null;
  }
}
