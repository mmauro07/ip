{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
import System.Win32 (COORD(yPos), SECURITY_ATTRIBUTES (nLength), kEYEVENTF_EXTENDEDKEY)
{-# HLINT ignore "Eta reduce" #-}
-----ejercicioUno-----
fibonacci :: Integer -> Integer
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n-1) + fibonacci (n-2)
-----ejercicioDos-----
parteEntera :: Float -> Integer
parteEntera n
    | ((n < 1)&&(n >= 0))||((n > -1)&&(n <= 0)) = 0
    | n > 1 = parteEntera (n-1) + 1
    | n < (-1) = parteEntera (n+1) - 1
-----ejercicioTres-----
esDivisible :: Integer -> Integer -> Bool
esDivisible x y
    | x < y = False
    | x == y = True
    | otherwise = esDivisible (x-y) y
-----ejercicioCuatro-----
sumaImpares :: Integer -> Integer
sumaImpares n
    | n == 1 = 1
    | otherwise = (2*n - 1) + sumaImpares (n-1)
-----ejercicioCinco-----
medioFact :: Integer -> Integer
medioFact n
    | n == 0 = 1
    | n == 1 = 1
    | n > 1 = n * medioFact (n-2)
-----ejercicioSeis-----
sumaDigitos :: Integer -> Integer
sumaDigitos n
    | n < 10 = n
    | n >= 10 = sumaDigitos (div n 10) + sumaDigitos (mod n 10)
-----ejercicioSiete-----
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | n < 10 = True
    | n >= 10 = mod n 10 == mod (div n 10) 10 && todosDigitosIguales (div n 10)
-----ejercicioOcho-----
cantDigitos :: Integer -> Integer
cantDigitos n
    | n < 10 = 1
    | n >= 10 = cantDigitos (div n 10) + cantDigitos (mod n 10)
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
    | i == 1 = mod n 10
    | i > 1 = iesimoDigito (div n 10) (i - 1)
-----ejercicioNueve-----
esCapicua :: Integer -> Bool
esCapicua n
    | cantDigitos n == 2 && iesimoDigito n 1 == iesimoDigito n 2 = True
    | cantDigitos n == 3 && iesimoDigito n 1 == iesimoDigito n 3 = True
    | cantDigitos n > 3 && iesimoDigito n 1 == iesimoDigito n (cantDigitos n) && esCapicua (n `div` 10 - iesimoDigito n 1 * 10^(cantDigitos n - 2)) = True
    | otherwise = False
-----ejercicioDiez-----
f1 :: Integer -> Integer
f1 n
    | n == 0 = 2^n
    | n > 0 = 2^n + f1 (n-1)
f2 :: Integer -> Integer -> Integer
f2 n q
    | n == 1 = q^n
    | n > 1 = q^n + f2 (n-1) q
f3 :: Integer -> Integer -> Integer
f3 n q
    | n == 1 = q^(2*n)
    | n > 1 = q^(2*n) + f3 (n-1) q
f4 :: Integer -> Integer -> Integer
f4 n q = f2 (2*n) q - f2 (n - 1) q
-----ejercicioOnce-----
factorial :: Integer -> Integer
factorial n
    | n == 0 = 1
    | n == 1 = 1
    | n > 1 = n*factorial (n-1)
eAprox :: Integer -> Float
eAprox n
    | n == 0 = 1/fromIntegral (factorial n)
    | n > 0 = 1/fromIntegral (factorial n) + eAprox (n-1)
e :: Float
e = eAprox 10
-----ejercicioDoce-----
an :: Integer -> Float
an n
    | n == 1 = 2
    | n > 1 = 2 + (1/an (n-1))
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = an n -1
-----ejercicioTrece-----
sumatoriaInterna :: Integer -> Integer -> Integer
sumatoriaInterna _ 0 = 0
sumatoriaInterna n j = n^j + sumatoriaInterna n (j-1)
sumatoriaDoble :: Integer -> Integer -> Integer
sumatoriaDoble 0 _ = 0
sumatoriaDoble n m = sumatoriaDoble (n-1) m + sumatoriaInterna n m
-----ejercicioCatorce-----
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m
    | n == 1 && m == 1 = q^(n+m)
    | otherwise = q^(n+m) + sumaPotencias q (n-1) (m-1)
-----ejercicioQuince-----
internaSumatoria :: Integer -> Integer -> Float
internaSumatoria n q
    | q == 1 = fromIntegral n
    | otherwise = (fromIntegral n/ fromIntegral q) + internaSumatoria n (q-1)
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n m
    | n == 1 = 1
    | otherwise = sumaRacionales (n-1) m + internaSumatoria n m
-----ejercicioDieciseis-----
buscarDivisor :: Integer -> Integer -> Integer
buscarDivisor n k
    | k*k > n = n
    | mod n k == 0 = k
    | otherwise = buscarDivisor n (k+1)
menorDivisor :: Integer -> Integer
menorDivisor n = buscarDivisor n 2
esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n
sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos x y = divisores x y 2
divisores :: Integer -> Integer -> Integer -> Bool
divisores x y i 
    | i > x || i > y = True
    | buscarDivisor x i == buscarDivisor y i = False
    | otherwise = divisores x y (i+1)
nesimoPrimo :: Integer -> Integer
nesimoPrimo x = encontrarPrimo x 2
encontrarPrimo :: Integer -> Integer -> Integer
encontrarPrimo cont n
    | esPrimo n && cont == 1 = n
    | esPrimo n = encontrarPrimo (cont-1) (n+1)
    | otherwise = encontrarPrimo cont (n+1)
-----ejercicioDiecisiete-----
esFibonacci :: Integer -> Bool 
esFibonacci n = buscoFibonacci n 1
buscoFibonacci :: Integer -> Integer -> Bool
buscoFibonacci n cont
    | n == fibonacci cont = True
    | n < fibonacci cont = False
    | otherwise = buscoFibonacci n (cont+1)
-----ejercicioDieciocho-----
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = recorridoDigitos n 1 (-1)
recorridoDigitos :: Integer -> Integer -> Integer -> Integer
recorridoDigitos n pos mayor 
    | pos > cantDigitos n = mayor
    | esPar (iesimoDigito n pos) && iesimoDigito n pos > mayor = recorridoDigitos n (pos+1) (iesimoDigito n pos) 
    | otherwise = recorridoDigitos n (pos+1) mayor
esPar :: Integer -> Bool 
esPar n = even n
-----ejercicioDiecinueve-----
esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos n = esSumaDePrimerosKPrimos 1 n
esSumaDePrimerosKPrimos :: Integer -> Integer -> Bool
esSumaDePrimerosKPrimos k n
    |sumaKprimos k == n = True
    |sumaKprimos k > n = False
    |otherwise = esSumaDePrimerosKPrimos (k+1) n
sumaKprimos :: Integer -> Integer
sumaKprimos 1 = 2
sumaKprimos n = nesimoPrimo n + nesimoPrimo (n-1)
-----ejercicioVeinte-----
tomaValorMax :: Integer -> Integer -> Integer
