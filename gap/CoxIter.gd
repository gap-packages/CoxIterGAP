#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Declarations
#

CoxIterFamily := NewFamily("CoxIterFamily");

DeclareCategory( "IsCoxIter", IsObject );

DeclareAttribute( "Cofinite", IsCoxIter );
DeclareAttribute( "Cocompact", IsCoxIter );
DeclareAttribute( "EulerCharacteristic", IsCoxIter );
DeclareAttribute( "FVector", IsCoxIter );
DeclareAttribute( "GrowthSeries", IsCoxIter );

IsCoxIterRep := NewRepresentation("IsCoxIter", IsObject and IsComponentObjectRep and IsAttributeStoringRep, [ "iCoxeterMatrix", "iDimension", "bInvariantsComputed", "iCofinite", "iCocompact", "iFVector", "rEulerCharacteristic", "pGrowthSeries" ]);

CoxIterType := NewType( CoxIterFamily, IsCoxIter and IsCoxIterRep and IsAttributeStoringRep );

DeclareOperation( "CreateCoxIterFromCoxeterGraph", [ IsList, IsInt ] );
DeclareOperation( "CreateCoxIterFromCoxeterMatrix", [ IsMatrix, IsInt ] );
DeclareOperation( "CoxIterCompute", [ IsCoxIter ] );


DeclareGlobalFunction( "CoxIter_Example" );
DeclareGlobalFunction( "CoxIter_Compute" );
