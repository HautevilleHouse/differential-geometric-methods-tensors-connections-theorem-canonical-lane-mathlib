import DifferentialGeometricMethodsTensorsConnectionsTheorem.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheorem

def bridgeClosed (A : AdmissibleClass) : Prop :=
  TensorConnectionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DifferentialGeometricMethodsTensorsConnectionsTheorem
end HautevilleHouse