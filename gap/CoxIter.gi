#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Implementations
#
InstallGlobalFunction( CoxIter_Example, function()
	Print( "This is a placeholder function, replace it with your own code.\n" );
end );

InstallGlobalFunction( CoxIter_Compute, function()
	local cur_dir, ci_file, ci_stream, ci_output;
	
	cur_dir := DirectoryCurrent();
	ci_file := Filename(DirectoriesPackagePrograms("coxiter"), "coxiter");
	ci_stream := InputOutputLocalProcess(cur_dir,ci_file,["test"]);

	WriteLine(ci_stream,"The cat sat on the mat");
	WriteLine(ci_stream,"exit");

	Print(ReadLine(ci_stream));
	Print(ReadLine(ci_stream));
	Print(ReadLine(ci_stream));
	Print(ReadLine(ci_stream));
	CloseStream(ci_stream);
end );

InstallMethod( CoxIterCompute,
	"Call CoxIter to perform the computations of the invariants",
	[ IsCoxIter ],
	function( ci )
		local cur_dir, ci_file, ci_stream, ci_output, mat_size, i, line, data, fnum, fden;
	
		mat_size := Length(ci!.iCoxeterMatrix);
		cur_dir := DirectoryCurrent();
		ci_file := Filename(DirectoriesPackagePrograms("coxiter"), "coxiter");
		ci_stream := InputOutputLocalProcess(cur_dir,ci_file,[]);
		
		# -----------------------------------------
		# Sending information
		WriteLine(ci_stream,Concatenation("dimension:",String(ci!.iDimension)));
		WriteLine(ci_stream,"matrix:start");
		for i in [1..mat_size] do
			WriteLine(ci_stream,String(ci!.iCoxeterMatrix[i]));
		od;
		WriteLine(ci_stream,"matrix:end");
		WriteLine(ci_stream,"exit");
		
		# TODO: gérer mieux si erreur
		
		# -----------------------------------------
		# Reading information
		while true do
			line := ReadLine(ci_stream);
			if line = fail then	break; fi;
			
			data := SplitString( line, ":" );
			
			if data[1] = "error" then Error("One error occured: ", data[2] ); return; fi;
			
			if data[1] = "fv" then ci!.iCofinite := EvalString(data[2]);
			elif data[1] = "c" then ci!.iCocompact := EvalString(data[2]); 
			elif data[1] = "euler" then ci!.rEulerCharacteristic := EvalString(data[2]);
			elif data[1] = "fvector" then ci!.iFVector := EvalString(data[2]);
			elif data[1] = "fnum" then fnum := Concatenation( "Product( [", data[2], "], i -> CyclotomicPolynomial(Rationals,i) )" );
			elif data[1] = "fden" then fden := Concatenation( "ValuePol([", data[2], "], X(Rationals))" );
			fi;
		od;
		CloseStream(ci_stream);
		
		ci!.pGrowthSeries := [EvalString(fnum),EvalString(fden)];
		
		# -----------------------------------------
		# Final
		ci!.bInvariantsComputed := true;
	end );
	
InstallMethod( Cofinite,
	"for hyperbolic Coxeter groups", 
	[IsCoxIter and IsCoxIterRep], 
	function(obj)
		if obj!.bInvariantsComputed = false then CoxIterCompute(obj); fi;
		if obj!.bInvariantsComputed = false then return fail; fi;
		return obj!.iCofinite;
	end);
	
InstallMethod( Cocompact,
	"for hyperbolic Coxeter groups", 
	[IsCoxIter and IsCoxIterRep], 
	function(obj)
		if obj!.bInvariantsComputed = false then CoxIterCompute(obj); fi;
		return obj!.iCocompact;
	end);
	
InstallMethod( FVector,
	"for hyperbolic Coxeter groups", 
	[IsCoxIter and IsCoxIterRep], 
	function(obj)
		if obj!.bInvariantsComputed = false then CoxIterCompute(obj); fi;
		return obj!.iFVector;
	end);
	
InstallMethod( EulerCharacteristic,
	"for hyperbolic Coxeter groups", 
	[IsCoxIter and IsCoxIterRep], 
	function(obj)
		if obj!.bInvariantsComputed = false then CoxIterCompute(obj); fi;
		return obj!.rEulerCharacteristic;
	end);
	
InstallMethod( GrowthSeries,
	"for hyperbolic Coxeter groups", 
	[IsCoxIter and IsCoxIterRep], 
	function(obj)
		if obj!.bInvariantsComputed = false then CoxIterCompute(obj); fi;
		return obj!.pGrowthSeries;
	end);

InstallMethod( CreateCoxIterFromCoxeterMatrix,
	"Create `CoxIter' from the Coxeter matrix",
	[ IsMatrix, IsInt ],
	function( M, Dim )
		if Dim < 0 then
			Dim := 0;
		fi;
		
		return Objectify( CoxIterType, rec( iCoxeterMatrix := M, bInvariantsComputed := false, iDimension := Dim, iCofinite := -2, iCocompact := -2, rEulerCharacteristic := 0, iFVector := [] ) );
	end );
ExpandSquareMatrix := function( mat, n )
	local cur_mat_size, r, c;
	
	cur_mat_size := Length(mat);
	
	if cur_mat_size > n then
		return;
	fi;
	
	for r in [1..cur_mat_size] do
		for c in [(cur_mat_size+1)..n] do
			mat[r][c] :=  2;
		od;
	od;
	
	for r in [(cur_mat_size+1)..n] do
		mat[r] := [];
		for c in [1..n] do 
			if r=c then	
				mat[r][c] := 1;
			else 
				mat[r][c] := 2;
			fi;
		od;
	od;
end;

InstallMethod( CreateCoxIterFromCoxeterGraph,	
	"Create `CoxIter' from the Coxeter graph",
	[ IsList, IsInt ],
	function( G, Dim )
		local graph_size, i, j, temp_size, starting_vertex, vertex, weight, mat;
		mat := [[1]];
		
		if Dim < 0 then
			Dim := 0;
		fi;
		
		graph_size := Length(G);
		for i in [1..graph_size] do
			temp_size := Length( G[i] );
			if temp_size = 0 then
				continue;
			fi;
			
			starting_vertex := G[i][1];
			
			if Length(mat) < starting_vertex then
				ExpandSquareMatrix( mat, starting_vertex );
			fi;
			
			for j in [2..temp_size] do
				if Length(G[i][j]) > 2 then
					Error("Ill formed graph");
				fi;
				
				vertex := G[i][j][1];
				
				if Length(mat) < vertex then
					ExpandSquareMatrix( mat, vertex );
				fi;
				
				if Length(G[i][j]) > 1 then
					weight := G[i][j][2];
					if mat[starting_vertex][vertex] <> 2 and mat[starting_vertex][vertex] <> weight then
						Error("Two different weights for edge(",starting_vertex,",",vertex,") given");
					fi;
					
					mat[starting_vertex][vertex] := weight;
					mat[vertex][starting_vertex] := weight;
				fi;
			od;
		od;
		
		temp_size := Length(mat);
		for i in [1..temp_size] do
			mat[i][i] := 1;
		od;
		
		return CreateCoxIterFromCoxeterMatrix(mat, Dim);;
	end );

InstallMethod( ViewObj,	
	"for object in `IsCoxIter'",
	[ IsCoxIter and IsCoxIterRep ],
	function( obj )
		Print( "CoxIter : Coxeter group with ", Length( obj!.iCoxeterMatrix ) , " generators in dimension " );
		if obj!.iDimension > 0 then 
			Print(obj!.iDimension);
		else 
			Print("?");
		fi;
	end );

InstallMethod( PrintObj,
	"for object in `IsCoxIter'",
	[ IsCoxIter and IsCoxIterRep ],
	function( obj )
		Print( "TODO: printobj" );
	end );
