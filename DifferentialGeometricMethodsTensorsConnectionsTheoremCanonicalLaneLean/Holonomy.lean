import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean.CurvatureInvariants

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

structure HolonomyPackage {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} where
  holonomyGroup : Prop
  monodromyRepresentation : Prop
  curvatureHolonomyRelation : Prop
  reductionTheorem : Prop
  restrictedHolonomy : Prop
  holonomyGroupTerm : holonomyGroup
  monodromyRepresentationTerm : monodromyRepresentation
  curvatureHolonomyRelationTerm : curvatureHolonomyRelation
  reductionTheoremTerm : reductionTheorem
  restrictedHolonomyTerm : restrictedHolonomy

structure HolonomyEvidence {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} (H : HolonomyPackage C) where
  holonomyGroupClosed : H.holonomyGroup
  monodromyRepresentationClosed : H.monodromyRepresentation
  curvatureHolonomyRelationClosed : H.curvatureHolonomyRelation
  reductionTheoremClosed : H.reductionTheorem
  restrictedHolonomyClosed : H.restrictedHolonomy

def HolonomyClosed {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} (H : HolonomyPackage C) : Prop :=
  H.holonomyGroup ∧ H.monodromyRepresentation ∧
  H.curvatureHolonomyRelation ∧ H.reductionTheorem ∧ H.restrictedHolonomy

theorem holonomy_closed_from_evidence {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} (H : HolonomyPackage C)
    (E : HolonomyEvidence H) : HolonomyClosed H := by
  exact And.intro E.holonomyGroupClosed
    (And.intro E.monodromyRepresentationClosed
      (And.intro E.curvatureHolonomyRelationClosed
        (And.intro E.reductionTheoremClosed E.restrictedHolonomyClosed)))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse