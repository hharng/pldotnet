/* Lua treats 'NUMERIC' as datum and I have not found methods to manipulate/return datum
DROP FUNCTION get_sumlua(numeric,numeric);
CREATE OR REPLACE FUNCTION get_sumLua(
   a NUMERIC(3,2),
   b NUMERIC(3,2))
RETURNS NUMERIC AS $$
return tostring(a) + tostring(b)
$$ LANGUAGE plluau;

SELECT get_sumLua(1.3333333, 10) =  numeric '11.3333333';
SELECT get_sumLua(1.33333333, -10.99999999) = '-9.66666666';
SELECT get_sumLua(1999999999999.555555555555555, -10.99999999) = numeric '1999999999988.555555565555555'; -- 1999999999988.555555565555555
*/

CREATE OR REPLACE FUNCTION getbigNumLua(a NUMERIC) RETURNS NUMERIC AS $$
return a
$$ LANGUAGE pllua;

SELECT getbigNumLua(99999999999999999991.9999991) = numeric '99999999999999999991.9999991';
SELECT getbigNumLua(999999999999999999991.99999999) =  numeric '999999999999999999991.99999999';