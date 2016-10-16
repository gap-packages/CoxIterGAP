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

#! @Arguments gr, dimension
#! @Returns a CoxIter object
#! @Description
#!  Creates a CoxIter object from the Coxeter graph <A>gr</A>. If the dimension <A>dim</A> is unknown, 0 can be given.
DeclareOperation( "CreateCoxIterFromCoxeterGraph", [ IsList, IsInt ] );

#! @Arguments mat, dimension
#! @Returns a CoxIter object
#! @Description
#!  Creates a CoxIter object from the Coxeter matrix <A>mat</A>. If the dimension <A>dim</A> is unknown, 0 can be given.
DeclareOperation( "CreateCoxIterFromCoxeterMatrix", [ IsMatrix, IsInt ] );

#! @Arguments ci
#! @Description
#!  Compute the invariants of the Coxiter object <A>ci</A>
DeclareOperation( "CoxIterCompute", [ IsCoxIter ] );

DeclareGlobalVariable( "_CoxIter_MAXSIZES", "Maximum: weight for an edge, index for a vertex, dimension" );
