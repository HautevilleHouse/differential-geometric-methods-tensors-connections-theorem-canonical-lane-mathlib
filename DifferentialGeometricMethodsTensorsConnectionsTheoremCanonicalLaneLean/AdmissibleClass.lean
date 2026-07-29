import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheorem

structure AdmissibleClass where
  object : TensorConnectionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TensorConnectionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentialGeometricMethodsTensorsConnectionsTheorem
end HautevilleHouse