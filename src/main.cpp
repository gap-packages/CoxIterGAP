#include <iostream>
#include <string>
#include <vector>

#include "coxiter.h"

using namespace std;

int main(int argc, char *argv[]) 
{
	cout << "a" << endl;
	
	vector< vector< unsigned int > > iCoxeterMatrix( vector< vector< unsigned int > >( 3, vector< unsigned int >( 3, 2 ) ) );
	iCoxeterMatrix[0][1] = iCoxeterMatrix[1][0] = 4;
	iCoxeterMatrix[1][2] = iCoxeterMatrix[2][1] = 0;
	
	CoxIter ci( iCoxeterMatrix, 2 );
	cout << "Run: " << ci.bRunAllComputations() << endl;
	cout << implode( ", ", ci.get_iFVector() ) << endl;
	unsigned int iDimension(4);
	MPZ_rational cov( ( iDimension / 2 ) % 2 ? -1 : 1 );
	for( unsigned int i( 1 ); i <= iDimension; i++ )
	{
		cov *= 2;
		cov /= i;
		if( i <= ( iDimension / 2 ) )
			cov *= i;
	}
	
	cout << "Euler char: " << cov * ci.get_brEulerCaracteristic( ) << endl;
	cout << "pi^" << ( iDimension / 2 ) << " * " << cov * ci.get_brEulerCaracteristic( ) << endl;
	
	return 0;
}
