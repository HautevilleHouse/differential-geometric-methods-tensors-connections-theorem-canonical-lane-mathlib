import DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean.ConnectionCurvature

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean

structure CurvatureTensorPackage {G : RiemannianCurvaturePackage}
    {C : ConnectionCurvaturePackage G} where
  riemannTensor : Type u
  ricciTensor : Type v
  scalarCurvature : Type w
  symmetries : Prop
  contractionLaw : Prop
  secondBianchi : Prop

structure CurvatureTensorEvidence {G : RiemannianCurvaturePackage}
    {C : ConnectionCurvaturePackage G} (T : CurvatureTensorPackage C) where
  symmetriesClosed : T.symmetries
  contractionLawClosed : T.contractionLaw
  secondBianchiClosed : T.secondBianchi

def CurvatureTensorClosed {G : RiemannianCurvaturePackage}
    {C : ConnectionCurvaturePackage G} (T : CurvatureTensorPackage C) : Prop :=
  T.symmetries ∧ T.contractionLaw ∧ T.secondBianchi

theorem curvature_tensor_closed_from_evidence
    {G : RiemannianCurvaturePackage} {C : ConnectionCurvaturePackage G}
    (T : CurvatureTensorPackage C) (E : CurvatureTensorEvidence T) :
    CurvatureTensorClosed T := by
  exact And.intro E.symmetriesClosed (And.intro E.contractionLawClosed E.secondBianchiClosed)

end DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean
end HautevilleHouse