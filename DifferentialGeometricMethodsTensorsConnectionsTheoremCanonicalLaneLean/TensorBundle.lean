import DifferentialGeometricMethodsTensorsConnectionsTheorem.FinalTheorem

/-!
# Tensor Bundle Package
-/

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheorem

structure TensorBundlePackage (M : Type u) where
  fiberType : M → Type v
  sectionSpace : Type w
  covariantDerivative : Type z
  tensorProductStructure : Prop
  contractionMaps : Prop

def TensorBundleClosed (T : TensorBundlePackage M) : Prop :=
  T.tensorProductStructure ∧ T.contractionMaps

end DifferentialGeometricMethodsTensorsConnectionsTheorem
end HautevilleHouse