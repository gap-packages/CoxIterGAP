LoadPackage( "CoxIter" );

cibugaenko8 := CreateCoxIterFromCoxeterGraph([[1,[2,5]],[2,[3,3]],[3,[4,3]],[4,[5,3],[10,3]],[5,[6,3]],[6,[7,3],[11,3]],[7,[8,3]],[8,[9,5]],[10,[11,1]]],8);

Assert( 0, Cofinite( cibugaenko8 ) = 1 );
Assert( 0, Cocompact( cibugaenko8 ) = 1 );
Assert( 0, FVector( cibugaenko8 ) = [41,164,316,374,294,156,54,11,1] );
Assert( 0, EulerCharacteristic( cibugaenko8 ) = 24187/8709120000 );
