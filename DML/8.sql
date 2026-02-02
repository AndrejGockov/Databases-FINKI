select b1.ime as B1, b2.ime as B2
from Bend b1, Bend b2
where 
b1.godina_osnovanje = b2.godina_osnovanje 
and b1.id != b2.id 
-- Gets rid of: a1 = b1, b1 = a1 duplicate pairs
and b1.ime > b2.ime