#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Declarations
#

CoxIterFamily := NewFamily("CoxIterFamily");

DeclareCategory( "IsCoxIter", IsObject );

DeclareAttribute( "Cofinite", IsCoxIter );
DeclareAttribute( "Cocompact", IsCoxIter );

IsCoxIterRep := NewRepresentation("IsCoxIter", IsObject and IsComponentObjectRep and IsAttributeStoringRep, [ "coxetermatrix"]);

CoxIterType := NewType( CoxIterFamily, IsCoxIter and IsCoxIterRep and IsAttributeStoringRep );

DeclareOperation( "CreateCoxIterFromCoxeterGraph", [ IsList ] );

#! @Description
#!   Insert documentation for you function here
DeclareGlobalFunction( "CoxIter_Example" );

DeclareGlobalFunction( "CoxIter_Compute" );
