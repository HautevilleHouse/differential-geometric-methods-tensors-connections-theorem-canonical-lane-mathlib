import DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean.GeodesicsExponentialMap

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean

structure HolonomyParallelTransportPackage {G : RiemannianCurvaturePackage}
    {C : ConnectionCurvaturePackage G} where
  parallelTransport : Type u
  holonomyGroup : Type v
  flatnessCondition : Prop
  AmbroseSingerTheorem : Prop
  curvatureHolonomyRelation : Prop

structure HolonomyParallelTransportEvidence (H : HolonomyParallelTransportPackage) where
  flatnessConditionClosed : H.flatnessCondition
  AmbroseSingerTheoremClosed : H.AmbroseSingerTheorem
  curvatureHolonomyRelationClosed : H.curvatureHolonomyRelation

def HolonomyParallelTransportClosed (H : HolonomyParallelTransportPackage) : Prop :=
  H.flatnessCondition ∧ H.AmbroseSingerTheorem ∧ H.curvatureHolonomyRelation

theorem holonomy_parallel_transport_closed_from_evidence
    (H : HolonomyParallelTransportPackage) (Ev : HolonomyParallelTransportEvidence H) :
    HolonomyParallelTransportClosed H := by
  exact And.intro Ev.flatnessConditionClosed (And.intro Ev.AmbroseSingerTheoremClosed Ev.curvatureHolonomyRelationClosed)

end DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean
end HautevilleHouse