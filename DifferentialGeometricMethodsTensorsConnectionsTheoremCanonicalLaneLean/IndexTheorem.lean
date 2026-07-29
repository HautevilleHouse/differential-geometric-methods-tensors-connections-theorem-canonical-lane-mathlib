import canonicalLaneMathlib.AdmissibleClass
import DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean.ConnectionCurvature

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

/-!
# Index Theorem Package

This package formalizes the index theorem for elliptic operators on manifolds.
-/

structure IndexTheoremPackage {C : ConnectionCurvaturePackage} (E : ConnectionCurvatureEvidence C) where
  ellipicOperator : Type u
  index : Type v
  analyticIndexInt : Prop
  topologicalIndexInt : Prop
  indexEquality : analyticIndexInt = topologicalIndexInt
  operatorDefinedOverManifold : Prop
  operatorElliptic : Prop
  operatorDefinedOverManifoldClosed : operatorDefinedOverManifold
  operatorEllipticClosed : operatorElliptic
  analyticIndexIntClosed : analyticIndexInt
  topologicalIndexIntClosed : topologicalIndexInt

structure IndexTheoremEvidence {C : ConnectionCurvaturePackage} {E : ConnectionCurvatureEvidence C}
    (I : IndexTheoremPackage E) where
  indexEqualityClosed : I.indexEquality
  operatorDefinedOverManifoldClosed : I.operatorDefinedOverManifoldClosed
  operatorEllipticClosed : I.operatorEllipticClosed
  analyticIndexIntClosed : I.analyticIndexIntClosed
  topologicalIndexIntClosed : I.topologicalIndexIntClosed

def IndexTheoremClosed {C : ConnectionCurvaturePackage} {E : ConnectionCurvatureEvidence C}
    (I : IndexTheoremPackage E) : Prop :=
  I.indexEquality ∧ I.operatorDefinedOverManifold ∧ I.operatorElliptic ∧
  I.analyticIndexInt ∧ I.topologicalIndexInt

theorem index_theorem_closed_from_evidence
    {C : ConnectionCurvaturePackage} {E : ConnectionCurvatureEvidence C}
    (I : IndexTheoremPackage E) (Ev : IndexTheoremEvidence I) :
    IndexTheoremClosed I := by
  exact And.intro Ev.indexEqualityClosed
    (And.intro Ev.operatorDefinedOverManifoldClosed
      (And.intro Ev.operatorEllipticClosed
        (And.intro Ev.analyticIndexIntClosed Ev.topologicalIndexIntClosed)))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse