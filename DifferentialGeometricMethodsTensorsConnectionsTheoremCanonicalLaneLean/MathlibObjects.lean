import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheorem

structure TensorConnectionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure TensorConnectionAdmittedObject where
  space : TensorConnectionSpace
  connectionDefined : Prop
  curvatureTensorDefined : Prop
  metricCompatibility : Prop
  conclusion : metricCompatibility

def TensorConnectionWitnessClosed (O : TensorConnectionAdmittedObject) : Prop :=
  O.metricCompatibility

end DifferentialGeometricMethodsTensorsConnectionsTheorem
end HautevilleHouse