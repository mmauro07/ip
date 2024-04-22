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
    | 