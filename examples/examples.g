#! @Chapter Some examples

#! First, we consider the 8 dimensional cocompact group found by Bugaenko.
#! @BeginExample
LoadPackage( "CoxIter" );

buga8 := CreateCoxIterFromCoxeterGraph([[1,[2,5]],[2,[3,3]],[3,[4,3]],[4,
[5,3],[10,3]],[5,[6,3]],[6,[7,3],[11,3]],[7,[8,3]],[8,[9,5]],[10,[11,1]]],8);
#! CoxIter : Coxeter group with 11 generators in dimension 8
Cofinite(buga8);
#! 1
Cocompact(buga8);
#! 1
FVector(buga8);
#! [ 41, 164, 316, 374, 294, 156, 54, 11, 1 ]
EulerCharacteristic(buga8);
#! 24187/8709120000
#! @EndExample
