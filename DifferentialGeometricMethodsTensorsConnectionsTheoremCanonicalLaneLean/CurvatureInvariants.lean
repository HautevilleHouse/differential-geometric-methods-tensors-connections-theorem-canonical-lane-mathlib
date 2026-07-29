import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean.ConnectionForm

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

structure CurvatureInvariantsPackage {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} where
  riemannCurvatureTensor : Prop
  ricciCurvature : Prop
  scalarCurvature : Prop
  sectionalCurvature : Prop
  einsteinTensor : Prop
  riemannCurvatureTensorTerm : riemannCurvatureTensor
  ricciCurvatureTerm : ricciCurvature
  scalarCurvatureTerm : scalarCurvature
  sectionalCurvatureTerm : sectionalCurvature
  einsteinTensorTerm : einsteinTensor

structure CurvatureInvariantsEvidence {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} (K : CurvatureInvariantsPackage C) where
  riemannCurvatureTensorClosed : K.riemannCurvatureTensor
  ricciCurvatureClosed : K.ricciCurvature
  scalarCurvatureClosed : K.scalarCurvature
  sectionalCurvatureClosed : K.sectionalCurvature
  einsteinTensorClosed : K.einsteinTensor

def CurvatureInvariantsClosed {B : BundleGeometryPackage}
    {C : ConnectionFormPackage B} (K : CurvatureInvariantsPackage C) : Prop :=
  K.riemannCurvatureTensor ∧ K.ricciCurvature ∧
  K.scalarCurvature ∧ K.sectionalCurvature ∧ K.einsteinTensor

theorem curvature_invariants_closed_from_evidence
    {B : BundleGeometryPackage} {C : ConnectionFormPackage B}
    (K : CurvatureInvariantsPackage C)
    (E : CurvatureInvariantsEvidence K) : CurvatureInvariantsClosed K := by
  exact And.intro E.riemannCurvatureTensorClosed
    (And.intro E.ricciCurvatureClosed
      (And.intro E.scalarCurvatureClosed
        (And.intro E.sectionalCurvatureClosed E.einsteinTensorClosed)))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse