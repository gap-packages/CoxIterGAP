#include <iostream>
#include <string>

#include "coxiter.h"

using namespace std;

bool bParseMatrixLine( vector< vector< unsigned int > >& iCoxeterMatrix, string strLine )
{
	vector< unsigned int > iRow;
	
	str_replace( strLine, " ", "" );
	str_replace( strLine, "[", "" );
	str_replace( strLine, "]", "" );
	
	explode( ",", strLine, iRow );
	
	iCoxeterMatrix.push_back( iRow );
	return true;
}

int main(int argc, char *argv[]) 
{
	string strReadingMode; ///< Current reading mode
	
	bool bCriticalError( false );
	
	int iDimension(0);
	vector< vector< unsigned int > > iCoxeterMatrix;
	unsigned int iCoxeterMatrixSize;
	
	// --------------------------------------------
	// Reading the stuff
	string strInput;
	do{ 
		getline( std::cin, strInput );
		
		if( strInput.find( "exit" ) != string::npos )
			break;
		else if( strInput.find( "matrix:start" ) != string::npos )
			strReadingMode = "matrix";
		else if( strInput.find( "matrix:end" ) != string::npos )
			strReadingMode = "";
		else if( strInput.find( "dimension:" ) != string::npos )
		{
			str_replace( strInput, "dimension:", "" );
			try
			{
				iDimension = stoi( strInput );
			}
			catch (const std::invalid_argument& ia) { cout << "dimension:CANNOT_READ" << endl; return 0; };
		}
		else
		{
			if( strReadingMode == "matrix" )
			{
				if( !bParseMatrixLine( iCoxeterMatrix, strInput ) )
				{
					bCriticalError = true;
					break;
				}
			}
		}
	}
	while( true );
	
	// --------------------------------------------
	// Some verifications
	if( bCriticalError )
		return 0;
	
	iCoxeterMatrixSize = iCoxeterMatrix.size();
	if( !iCoxeterMatrixSize )
	{
		cout << "matrix:NOT_READ" << endl;
		return 0;
	}
	
	for( unsigned int i(0); i < iCoxeterMatrixSize; i++ )
	{
		if( iCoxeterMatrix[i].size() != iCoxeterMatrixSize )
		{
			cout << "matrix:NOT_SQUARE" << endl;
			return 0;
		}
	}
	
	// --------------------------------------------
	// Computations
	CoxIter ci( iCoxeterMatrix, iDimension );
	
	ci.set_checkCocompactness( true );
	ci.set_checkCofiniteness( true );
	ci.set_ouputMathematicalFormat( "pari" ); // Pretty much the same syntax for polynomials and vectors
	
	
	ci.exploreGraph();
	ci.computeGraphsProducts();
	
	if( !ci.computeEulerCharacteristicFVector() )
	{
		cout << "error:The specified graph contains a spherical subgraph which has too big rank." << endl;
		return 0;
	}
	
	ci.checkCovolumeFiniteness();
	ci.isGraphCocompact();
	
	// --------------------------------------------
	// Displaying result
	cout << "fv:" << ci.get_isFiniteCovolume() << endl;
	cout << "c:" << ci.get_isCocompact() << endl;
	cout << "euler:" << ci.get_brEulerCaracteristic() << endl;
	if( ci.get_dimensionGuessed() )
		cout << "dimensionguessed:" << ci.get_dimension() << endl;
	if( ci.get_dimension() )
		cout << "fvector:[" << implode( ",", ci.get_fVector() ) << "]" << endl;
	else
		cout << "[]" << endl;
		
	// Growth series
	vector<unsigned int> iCyclotomicNumerator;
	vector< mpz_class > iPolynomialDenominator;
	bool bReduced;
	ci.get_growthSeries( iCyclotomicNumerator, iPolynomialDenominator, bReduced );
	unsigned int iDenominatorSize( iPolynomialDenominator.size() );
	cout << "fnum:" << implode( ",", iCyclotomicNumerator ) << endl;
	cout << "fden:";
	for( unsigned int i(0); i < iDenominatorSize; i++ )
		cout << ( i ? "," : "" ) << iPolynomialDenominator[i];
	cout << endl;
	
	return 0;
}
