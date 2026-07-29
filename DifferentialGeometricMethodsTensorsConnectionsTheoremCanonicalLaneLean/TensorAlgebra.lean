import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

structure TensorAlgebraPackage where
  tensorProduct : Type v → Type v → Type v
  symmetryAndBose : Prop
  contractionOperation : Prop
  metricDual : Prop
  tensorBundle : Type w
  tensorAlgebraLaws : Prop
  symmetryAndBoseTerm : symmetryAndBose
  contractionOperationTerm : contractionOperation
  metricDualTerm : metricDual
  tensorAlgebraLawsTerm : tensorAlgebraLaws

structure TensorAlgebraEvidence (A : TensorAlgebraPackage) where
  symmetryAndBoseClosed : A.symmetryAndBose
  contractionOperationClosed : A.contractionOperation
  metricDualClosed : A.metricDual
  tensorAlgebraLawsClosed : A.tensorAlgebraLaws

def TensorAlgebraClosed (A : TensorAlgebraPackage) : Prop :=
  A.symmetryAndBose ∧ A.contractionOperation ∧
  A.metricDual ∧ A.tensorAlgebraLaws

theorem tensor_algebra_closed_from_evidence (A : TensorAlgebraPackage)
    (E : TensorAlgebraEvidence A) : TensorAlgebraClosed A := by
  exact And.intro E.symmetryAndBoseClosed
    (And.intro E.contractionOperationClosed
      (And.intro E.metricDualClosed E.tensorAlgebraLawsClosed))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse