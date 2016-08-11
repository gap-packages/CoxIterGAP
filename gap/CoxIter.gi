#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# Implementations
#
InstallGlobalFunction( CoxIter_Example, function()
	Print( "This is a placeholder function, replace it with your own code.\n" );
end );

InstallGlobalFunction( CoxIter_Compute, function()
local cipath;

    	cipath := Filename(DirectoriesPackagePrograms("coxiter"), "coxiter");
	Print(cipath);

   	Exec(cipath);
end );
