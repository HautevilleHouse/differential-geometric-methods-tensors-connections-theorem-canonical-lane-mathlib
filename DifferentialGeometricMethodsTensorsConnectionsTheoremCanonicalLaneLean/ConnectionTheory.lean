import DifferentialGeometricMethodsTensorsConnectionsTheorem.TensorBundle

/-!
# Connection Theory Package
-/

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheorem

structure ConnectionTheoryPackage {M : Type u} (T : TensorBundlePackage M) where
  connectionMap : T.sectionSpace → T.sectionSpace
  curvatureEndomorphism : T.sectionSpace → T.sectionSpace
  torsionTensor : Prop
  metricCompatibility : Prop
  connectionMapClosed : connectionMap = connectionMap
  torsionTensorClosed : torsionTensor

structure ConnectionTheoryEvidence {M : Type u} {T : TensorBundlePackage M}
    (C : ConnectionTheoryPackage T) where
  metricCompatibilityClosed : C.metricCompatibility
  torsionTensorClosed : C.torsionTensor

def ConnectionTheoryClosed {M : Type u} {T : TensorBundlePackage M}
    (C : ConnectionTheoryPackage T) : Prop :=
  C.metricCompatibility ∧ C.torsionTensor

theorem connection_theory_closed_from_evidence
    {M : Type u} {T : TensorBundlePackage M}
    (C : ConnectionTheoryPackage T) (E : ConnectionTheoryEvidence C) :
    ConnectionTheoryClosed C := by
  exact And.intro E.metricCompatibilityClosed E.torsionTensorClosed

end DifferentialGeometricMethodsTensorsConnectionsTheorem
end HautevilleHouse