import 'package:go_router/go_router.dart';

import '../../features/partners/how_partners_screen.dart';
import '../../features/partners/legal_help_screen.dart';
import '../../features/partners/partner_detail_screen.dart';
import '../../features/pathways/all_professions_screen.dart';
import '../../features/pathways/pathway_data.dart';
import '../../features/pathways/regulated_pathway_screen.dart';
import '../../features/provinces/province_variant_data.dart';
import '../../features/provinces/province_variant_screen.dart';

/// Implemented routes for S12 (province variants), S13 (partners/legal), and S22 (pathways).
final List<RouteBase> s12S13S22Routes = [
  // S12: Province variants
  for (final path in provinceVariants.keys)
    GoRoute(
      path: path,
      builder: (context, state) => ProvinceVariantScreen(routePath: path),
    ),

  // S13: Partners & Legal help
  GoRoute(
    path: '/partner-detail',
    builder: (context, state) => const PartnerDetailScreen(),
  ),
  GoRoute(
    path: '/how-partners',
    builder: (context, state) => const HowPartnersScreen(),
  ),
  GoRoute(
    path: '/legal-help',
    builder: (context, state) => const LegalHelpScreen(),
  ),

  // S22: Regulated jobs index & 33 pathways
  GoRoute(
    path: '/all-professions',
    builder: (context, state) => const AllProfessionsScreen(),
  ),
  for (final occ in regulatedOccupations)
    GoRoute(
      path: occ.routePath,
      builder: (context, state) =>
          RegulatedPathwayScreen(routePath: occ.routePath),
    ),
];
