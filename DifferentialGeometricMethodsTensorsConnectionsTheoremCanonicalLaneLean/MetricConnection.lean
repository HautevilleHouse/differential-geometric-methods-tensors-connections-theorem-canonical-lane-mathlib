import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

structure MetricConnectionPackage where
  connection : Type u
  covariantDerivative : Type v
  metricCompatibility : Prop
  torsionFree : Prop
  leviCivitaExists : Prop
  connectionDetermined : Prop

structure MetricConnectionEvidence (M : MetricConnectionPackage) where
  metricCompatibilityClosed : M.metricCompatibility
  torsionFreeClosed : M.torsionFree
  leviCivitaExistsClosed : M.leviCivitaExists
  connectionDeterminedClosed : M.connectionDetermined

def MetricConnectionClosed (M : MetricConnectionPackage) : Prop :=
  M.metricCompatibility ∧ M.torsionFree ∧ M.leviCivitaExists ∧ M.connectionDetermined

theorem metric_connection_closed_from_evidence (M : MetricConnectionPackage)
    (E : MetricConnectionEvidence M) : MetricConnectionClosed M := by
  exact And.intro E.metricCompatibilityClosed
    (And.intro E.torsionFreeClosed
      (And.intro E.leviCivitaExistsClosed E.connectionDeterminedClosed))

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse
