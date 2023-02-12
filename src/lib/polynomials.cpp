/*
Copyright (C) 2013-2017
Rafael Guglielmetti, rafael.guglielmetti@unifr.ch
*/

/*
This file is part of CoxIter and AlVin.

CoxIter is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

CoxIter is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with CoxIter. If not, see <http://www.gnu.org/licenses/>.
*/

#include "polynomials.h"

namespace Polynomials {
vector<vector<mpz_class>> cyclotomicPolynomials = vector<vector<mpz_class>>(
    {{},
     {-1, 1},
     {1, 1},
     {1, 1, 1},
     {1, 0, 1},
     {1, 1, 1, 1, 1},
     {1, -1, 1},
     {1, 1, 1, 1, 1, 1, 1},
     {1, 0, 0, 0, 1},
     {1, 0, 0, 1, 0, 0, 1},
     {1, -1, 1, -1, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, -1, 0, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, -1, 1, -1, 1, -1, 1},
     {1, -1, 0, 1, -1, 1, 0, -1, 1},
     {1, 0, 0, 0, 0, 0, 0, 0, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, 0, -1, 0, 0, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, -1, 0, 1, 0, -1, 0, 1},
     {1, -1, 0, 1, -1, 0, 1, 0, -1, 1, 0, -1, 1},
     {1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, 0, 0, -1, 0, 0, 0, 1},
     {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
     {1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1},
     {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
     {1, 0, -1, 0, 1, 0, -1, 0, 1, 0, -1, 0, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 1, 0, -1, -1, -1, 0, 1, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
     {1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 1, 0, -1, 1, 0, -1, 1, 0, -1, 1},
     {1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1},
     {1,  -1, 0, 0,  0, 1,  -1, 1, -1, 0, 1,  -1, 1,
      -1, 1,  0, -1, 1, -1, 1,  0, 0,  0, -1, 1},
     {1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1},
     {1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1,
      0, -1, 1, 0, -1, 1, 0, -1, 1, 0, -1, 1},
     {1, 0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1, 0, 0, 0, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 1, 0, -1, -1, 0, 1, 0, -1, -1, 0, 1, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, -1, 0, 1, 0, -1, 0, 1, 0, -1, 0, 1, 0, -1, 0, 1, 0, -1, 0, 1},
     {1, 0, 0, -1, 0, 0, 0, 0, 0,  1, 0, 0, -1,
      0, 0, 1, 0,  0, 0, 0, 0, -1, 0, 0, 1},
     {1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1,
      1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1},
     {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1,
      0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1},
     {1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1},
     {1, -1, 0,  1, -1, 0,  1, -1, 0,  1, -1, 0,  1, -1, 0,  1, -1,
      1, 0,  -1, 1, 0,  -1, 1, 0,  -1, 1, 0,  -1, 1, 0,  -1, 1},
     {1, 0,  -1, 0, 1, 0,  -1, 0, 1, 0,  -1, 0, 1,
      0, -1, 0,  1, 0, -1, 0,  1, 0, -1, 0,  1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
     {1, -1, 0,  0, 0, 1, -1, 0,  0, 0, 1, 0, -1, 0,  0, 1, 0, -1, 0,  0, 1,
      0, 0,  -1, 0, 1, 0, 0,  -1, 0, 1, 0, 0, 0,  -1, 1, 0, 0, 0,  -1, 1},
     {1, 0, 0, 0, -1, 0, 0, 0,  1, 0, 0, 0, -1,
      0, 0, 0, 1, 0,  0, 0, -1, 0, 0, 0, 1},
     {1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1, -1, 0, 1,
      0, -1, 1, 0, -1, 1, 0, -1, 1, 0, -1, 1, 0, -1, 1, 0, -1, 1},
     {1,  -1, 1,  -1, 1,  -1, 1,  -1, 1,  -1, 1,  -1, 1,  -1, 1,
      -1, 1,  -1, 1,  -1, 1,  -1, 1,  -1, 1,  -1, 1,  -1, 1},
     {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
     {1, 0, 1, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 1, 0, 1}});
}
