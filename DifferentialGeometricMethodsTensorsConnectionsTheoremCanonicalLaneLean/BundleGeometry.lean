import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean

structure BundleGeometryPackage where
  baseManifold : Type u
  typicalFiber : Type v
  bundleProjection : baseManifold → Type w
  smoothStructure : Prop
  localTrivialization : Prop
  transitionFunctionSmooth : Prop
  totalSpace : Type t
  bundleProjectionTotal : totalSpace → baseManifold
  smoothStructureTerm : smoothStructure
  localTrivializationTerm : localTrivialization
  transitionFunctionSmoothTerm : transitionFunctionSmooth

structure BundleGeometryEvidence (B : BundleGeometryPackage) where
  smoothStructureClosed : B.smoothStructure
  localTrivializationClosed : B.localTrivialization
  transitionFunctionSmoothClosed : B.transitionFunctionSmooth

def BundleGeometryClosed (B : BundleGeometryPackage) : Prop :=
  B.smoothStructure ∧ B.localTrivialization ∧ B.transitionFunctionSmooth

theorem bundle_geometry_closed_from_evidence (B : BundleGeometryPackage)
    (E : BundleGeometryEvidence B) : BundleGeometryClosed B := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.localTrivializationClosed E.transitionFunctionSmoothClosed)

end DifferentialGeometricMethodsTensorsConnectionsTheoremCanonicalLaneLean
end HautevilleHouse