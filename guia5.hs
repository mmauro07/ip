-----ejercicioUno-----
longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
ultimo :: [t] -> t
ultimo (x:xs)
    | longitud (x:xs) == 1 = x
    | longitud (x:xs) > 1 = ultimo xs
principio :: [t] -> [t]
principio (x:xs)
    | longitud (x:xs) == 1 = []
    | longitud (x:xs) == 2 = (:) x []
    | longitud (x:xs) > 2 = x : principio xs
reverso :: [t] -> [t]
reverso (x:xs)
    | longitud (x:xs) == 1 = (:) x []
    | longitud (x:xs) == 2 = ultimo (x:xs) : principio (x:xs)
    | longitud (x:xs) > 2 = ultimo (x:xs) : reverso (principio(x:xs))
-----ejercicioDos-----
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece x (y:ys)
    | longitud (y:ys) == 1 && ultimo (y:ys) == x = True
    | longitud (y:ys) > 1 && (ultimo (y:ys) == x || pertenece x (principio (y:ys))) = True
    | otherwise = False
todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:xs)
    | longitud (x:xs) >= 2 = ultimo (x:xs) == ultimo (principio (x:xs))
    | otherwise = False
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:xs)
    | longitud (x:xs) == 2 = ultimo (x:xs) /= ultimo (principio (x:xs))
    | longitud (x:xs) == 3 = ultimo (x:xs) /= ultimo (principio (x:xs)) && ultimo (x:xs) /= x && ultimo (principio (x:xs)) /= x
    | longitud (x:xs) > 2 = ultimo (x:xs) /= ultimo (principio (x:xs)) && todosDistintos (principio xs)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos (x:xs)
    | longitud (x:xs) == 2 = ultimo (x:xs) == ultimo (principio (x:xs))
    | longitud (x:xs) == 3 = ultimo (x:xs) == ultimo (principio (x:xs)) || ultimo (x:xs) == x || ultimo (principio (x:xs)) == x
    | longitud (x:xs) > 2 = ultimo (x:xs) == ultimo (principio (x:xs)) || todosDistintos (principio xs)
quitar :: (Eq t) => t -> [t] -> [t]
quitar x (y:ys)
    | x==y = ys
    | otherwise = y : quitar x ys
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos x (y:ys)
    | x == y = quitarTodos x ys
    | otherwise = y : quitarTodos x ys
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
-----ejercicioTres-----
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = sumatoria xs + x
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = productoria xs * x
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs)
    | x < (head xs) = maximo xs
    | maximo (x:(tail xs))
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x+n]
sumarN n (x:xs) = x+n : sumarN n xs
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | mod x 2 == 0 = x : pares xs
    | otherwise = pares xs
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs)
    | mod x n == 0 = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = ordenar (quitar (maximo (x:xs))) ++ [maximo (x:xs)]
-----ejercicioCuatro-----
sacarEspaciosRepetidos :: [Char] -> [Char]
sacarEspaciosRepetidos [] = []
sacarEspaciosRepetidos [x] = [x]
sacarEspaciosRepetidos (x:y:xs) | x==y && x==' ' = sacarEspaciosRepetidos (y:xs)
                                | otherwise =  x:sacarEspaciosRepetidos (y:xs) 
contarPalabras :: [Char] -> Int
contarPalabras xs = contarEspacios (sacarEspaciosIniFin (sacarEspaciosRepetidos xs)) + 1
sacarEspaciosIniFin :: [Char] -> [Char]
sacarEspaciosIniFin [] = []
sacarEspaciosIniFin (x:xs) | x==' ' = sacarEspacioFin xs
                           | otherwise = x:sacarEspacioFin xs
sacarEspacioFin :: [Char] -> [Char]
sacarEspacioFin [] = []
sacarEspacioFin [x] | x==' ' = []
                       | otherwise = [x] 
sacarEspacioFin (x:xs) = x:sacarEspacioFin xs
contarEspacios :: [Char] -> Int
contarEspacios [] = 0
contarEspacios (x:xs) | x==' '= 1 + contarEspacios xs
                      | otherwise = contarEspacios xs
palabras :: [Char] -> [[Char]]
palabras xs = palabrasAux (sacarEspaciosIniFin (sacarEspaciosRepetidos xs))
palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux (x:xs) = primeraPalabra (x:xs):palabrasAux (sacarPrimeraPalabra (x:xs))
primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs) | x == ' ' = []
                      | otherwise = x:primeraPalabra xs                    
sacarPrimeraPalabra :: [Char] -> [Char]
sacarPrimeraPalabra [] = []
sacarPrimeraPalabra (x:xs) | x == ' ' = xs
                           | otherwise = sacarPrimeraPalabra xs  
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = palabraMasLargaAux (sacarEspaciosIniFin (sacarEspaciosRepetidos xs))
palabraMasLargaAux :: [Char] -> [Char]
palabraMasLargaAux xs | sacarPrimeraPalabra xs == [] = primeraPalabra xs
                      | length (primeraPalabra xs) > length (palabraMasLargaAux (sacarPrimeraPalabra xs)) = primeraPalabra xs
                      | otherwise = palabraMasLargaAux (sacarPrimeraPalabra xs)                      
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (xs:xss) = xs ++ aplanar xss
-----ejercicioCinco-----
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada xs = sumaAcumulada' xs 0
    where
        sumaAcumulada' [] _ = []
        sumaAcumulada' (x:xs) acc = (x + acc) : sumaAcumulada' xs (x + acc)
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = obtenerFactoresPrimos x : descomponerEnPrimos xs
obtenerFactoresPrimos :: Integer -> [Integer]
obtenerFactoresPrimos n = factorizar n 2
    where
        factorizar n divisor
            | n <= 1 = []
            | n `mod` divisor == 0 = divisor : factorizar (n `div` divisor) divisor
            | otherwise = factorizar n (divisor + 1)
