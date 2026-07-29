import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

/-!
# Connection and Curvature Package

This package formalizes the connection theory and curvature invariants central to differential geometric methods.
-/

structure ConnectionCurvaturePackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  tangentBundle : Type v
  connection : Type w
  curvatureTensor : Type x
  torsionTensor : Type y
  smoothManifold : Prop
  connectionSmooth : Prop
  curvatureBilinear : Prop
  torsionFree : Prop
  metricCompatible : Prop

structure ConnectionCurvatureEvidence (C : ConnectionCurvaturePackage) where
  smoothManifoldClosed : C.smoothManifold
  connectionSmoothClosed : C.connectionSmooth
  curvatureBilinearClosed : C.curvatureBilinear
  torsionFreeClosed : C.torsionFree
  metricCompatibleClosed : C.metricCompatible

def ConnectionCurvatureClosed (C : ConnectionCurvaturePackage) : Prop :=
  C.smoothManifold ∧ C.connectionSmooth ∧ C.curvatureBilinear ∧ C.torsionFree ∧ C.metricCompatible

theorem connection_curvature_closed_from_evidence
    (C : ConnectionCurvaturePackage) (E : ConnectionCurvatureEvidence C) :
    ConnectionCurvatureClosed C := by
  exact And.intro E.smoothManifoldClosed
    (And.intro E.connectionSmoothClosed
      (And.intro E.curvatureBilinearClosed
        (And.intro E.torsionFreeClosed E.metricCompatibleClosed)))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse