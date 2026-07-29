import DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean.CurvatureTensor

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean

structure GeodesicsExponentialMapPackage {G : RiemannianCurvaturePackage}
    {C : ConnectionCurvaturePackage G} where
  geodesicFlow : Type u
  exponentialMap : Type v
  normalCoordinates : Prop
  GaussLemma : Prop
  completenessCondition : Prop

structure GeodesicsExponentialMapEvidence (E : GeodesicsExponentialMapPackage) where
  normalCoordinatesClosed : E.normalCoordinates
  GaussLemmaClosed : E.GaussLemma
  completenessConditionClosed : E.completenessCondition

def GeodesicsExponentialMapClosed (E : GeodesicsExponentialMapPackage) : Prop :=
  E.normalCoordinates ∧ E.GaussLemma ∧ E.completenessCondition

theorem geodesics_exponential_map_closed_from_evidence
    (E : GeodesicsExponentialMapPackage) (Ev : GeodesicsExponentialMapEvidence E) :
    GeodesicsExponentialMapClosed E := by
  exact And.intro Ev.normalCoordinatesClosed (And.intro Ev.GaussLemmaClosed Ev.completenessConditionClosed)

end DifferentialGeometricMethodsTensorsConnectionsCanonicalLaneLean
end HautevilleHouse