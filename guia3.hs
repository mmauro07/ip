-----ejercicioUno-----
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}
import System.Win32 (xBUTTON1, COORD (yPos), SECURITY_ATTRIBUTES (bInheritHandle))
{-# HLINT ignore "Use max" #-}
{-# HLINT ignore "Redundant if" #-}
f :: Integer -> Integer
f x
    | x == 1 = 8
    | x == 4 = 131
    | x == 16 = 16

g :: Integer -> Integer
g x
    | x == 8 = 16
    | x == 16 = 4
    | x == 131 = 1

h :: Integer -> Integer
h x = f (g x)

k :: Integer -> Integer
k x = g (f x)
-----ejercicioDos-----
absoluto :: Integer -> Integer
absoluto x = if x >= 0 then x else (-x)

maximoabsoluto :: Integer -> Integer -> Integer
maximoabsoluto x y = if absoluto x > absoluto y then absoluto x else absoluto y

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z = max x (max y z)

algunoes0 :: Float -> Float -> Bool
algunoes0 x y = if x==0 || y==0 then True else False

ambosson0 :: Float -> Float -> Bool
ambosson0 x y = if x==0 && y==0 then True else False

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y = if x <= 3 && y <= 3 || 3<x && 3<y && x<=7 && y<=7 || x>7 && y>7 then True else False

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
    | x == y && y == z = x
    | x == y           = z
    | x == z           = y
    | y == z           = x
    | otherwise        = x + y + z

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y = if mod x y == 0  then True else False

digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

digitoDecenas :: Integer -> Integer
digitoDecenas x = mod (div x 10) 10
-----ejercicioTres-----
estanRelacionados :: Integer ->Integer ->Bool
estanRelacionados x y
    | x==0 || y==0 = undefined
    | mod (x*x) (x*y) == 0 = True
    | mod (x*x) (x*y) /= 0 = False
-----ejercicioCuatro-----
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a, b) (c, d) = (a*c) + (b*d)

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a, b) (c, d) = if a < c && b < d then True else False

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a, b) (c, d) = sqrt (((a-c)*(a-c))+((b-d)*(b-d)))

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x, y, z) = x + y + z

esMultiplo :: Int -> Int -> Bool
esMultiplo x y = mod x y == 0
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x, y, z) n =
    sum [num | num <- [x, y, z], esMultiplo num n]

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x, y, z) 
    | mod x 2 == 0 = 1
    | mod y 2 == 0 = 2
    | mod z 2 == 0 = 3
    | otherwise = 4

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)
-----ejercicioCinco-----
f5 :: Integer -> Integer
f5 n
    | n <= 7 = n*n
    | n > 7 = 2*n-1
g5 :: Integer -> Integer
g5 n
    | mod n 2 == 0 = div n 2
    | otherwise = 3*n+1
todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x, y, z) = if f5 x > g5 x && f5 y > g5 y && f5 z > g5 z then True else False
-----ejercicioSeis-----
bisiesto :: Integer -> Bool
bisiesto n = if mod n 4 /= 0 || (mod n 100 == 0 && mod n 400 /= 0) then False else True
-----ejercicioSiete-----
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a, b, c) (x, y, z) = abs ((a-x)+(b-y)+(c-z))
-----ejercicioOcho-----
sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos n = mod (abs n) 10 +  mod (div (abs n) 10) 10
comparar :: Integer -> Integer -> Integer
comparar x y
    | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
    | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = -1
    | sumaUltimosDosDigitos x == sumaUltimosDosDigitos y = 0