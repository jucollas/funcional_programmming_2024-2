doubleUs x y = doubleMe x + doubleMe y
doubleMe x = x + x
--doubleUs x y = x * 2 + y * 2
doubleSmallNumber x = if x > 100
then x
else x*2

--doubleSmallNumber' x = (if x > 100 then x else x*2) + 1
doubleSmallNumber' x = doubleSmallNumber x + 1

conanO'Brien = "It's a-me, Conan O'Brien!"