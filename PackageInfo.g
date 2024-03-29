#
# CoxIter: Computation of invariants of hyperbolic Coxeter groups
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "CoxIter",
Subtitle := "Computations of invariants of hyperbolic Coxeter groups",
Version := "1.0b",
Date := "17/08/2016", # dd/mm/yyyy format
License := "GPL-3.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Rafael",
    LastName := "Guglielmetti",
    WWWHome := "https://rgug.ch",
    Email := "rafael@rgug.ch",
    PostalAddress := "Chemin du Musee, CH-1700 Fribourg",
    Place := "Fribourg",
    Institution := "University of Fribourg",
  ),
],

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/rgugliel/", ~.PackageName ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
#SupportEmail   := "TODO",
PackageWWWHome  := "https://github.com/rgugliel/CoxIterGAP",
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "CoxIter",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Computation of invariants of hyperbolic Coxeter groups",
),

Dependencies := rec(
  GAP := ">= 4.8",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
  local path, file;
    # test for existence of the compiled binary
    path:= DirectoriesPackagePrograms( "coxiter" );
    file:= Filename( path, "coxiter" );
    if file = fail then
      LogPackageLoadingMessage( PACKAGE_WARNING,
          [ "The program `CoxIter' is not compiled.",
            "See the installation instructions;",
            "type: ?Installing the Example package" ] ); # TODO: update this
    fi;
    return file <> fail;
  end,
  
BannerString := Concatenation( 
    "----------------------------------------------------------------\n",
    "Loading CoxIter ", ~.Version, "\n",
    ~.Subtitle, "\n",
    "by ",
    JoinStringsWithSeparator( List( Filtered( ~.Persons, r -> r.IsAuthor ),
                                    r -> Concatenation(
        r.FirstNames, " ", r.LastName, " (", r.WWWHome, ")\n" ) ), "   " ),
    "For help, type: ?CoxIter package \n",
    "----------------------------------------------------------------\n" ),

TestFile := "tst/testall.g",

#Keywords := [ "TODO" ],

));


