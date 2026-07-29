import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean.BundleGeometry

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

structure ConnectionFormPackage {B : BundleGeometryPackage} where
  connectionOneForm : B.totalSpace → Type v
  horizontalityCondition : Prop
  verticalProjection : Prop
  parallelTransport : Prop
  curvatureTwoForm : Prop
  horizontalityConditionTerm : horizontalityCondition
  verticalProjectionTerm : verticalProjection
  parallelTransportTerm : parallelTransport
  curvatureTwoFormTerm : curvatureTwoForm

structure ConnectionFormEvidence {B : BundleGeometryPackage}
    (C : ConnectionFormPackage B) where
  horizontalityConditionClosed : C.horizontalityCondition
  verticalProjectionClosed : C.verticalProjection
  parallelTransportClosed : C.parallelTransport
  curvatureTwoFormClosed : C.curvatureTwoForm

def ConnectionFormClosed {B : BundleGeometryPackage}
    (C : ConnectionFormPackage B) : Prop :=
  C.horizontalityCondition ∧ C.verticalProjection ∧
  C.parallelTransport ∧ C.curvatureTwoForm

theorem connection_form_closed_from_evidence {B : BundleGeometryPackage}
    (C : ConnectionFormPackage B) (E : ConnectionFormEvidence C) :
    ConnectionFormClosed C := by
  exact And.intro E.horizontalityConditionClosed
    (And.intro E.verticalProjectionClosed
      (And.intro E.parallelTransportClosed E.curvatureTwoFormClosed))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse