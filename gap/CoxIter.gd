#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Declarations
#

CoxIterFamily := NewFamily("CoxIterFamily");

DeclareCategory( "IsCoxIter", IsObject );

DeclareAttribute( "Cofinite", IsCoxIter );
DeclareAttribute( "Cocompact", IsCoxIter );

IsCoxIterRep := NewRepresentation("IsCoxIter", IsObject and IsComponentObjectRep and IsAttributeStoringRep, [ "iCoxeterMatrix", "bInvariantsComputed" ]);

CoxIterType := NewType( CoxIterFamily, IsCoxIter and IsCoxIterRep and IsAttributeStoringRep );

DeclareOperation( "CreateCoxIterFromCoxeterGraph", [ IsList ] );
DeclareOperation( "CreateCoxIterFromCoxeterMatrix", [ IsMatrix ] );
DeclareOperation( "CoxIterCompute", [ IsCoxiter ] );


DeclareGlobalFunction( "CoxIter_Example" );
DeclareGlobalFunction( "CoxIter_Compute" );
