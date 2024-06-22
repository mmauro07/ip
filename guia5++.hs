{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant ==" #-}
--ejercicioUno
type Punto2D = (Float,Float)
prodInt :: Punto2D -> Punto2D -> Float
prodInt (x,y) (a,b) = x*a+y*b
todoMenor :: Punto2D -> Punto2D -> Bool
todoMenor (x,y) (a,b) =  x<a && y<b
distanciaPuntos :: Punto2D -> Punto2D -> Float
distanciaPuntos (x,y) (a,b) = sqrt ((a-x)^2 + (b-y)^2)
type Coordenada = (Float, Float)
crearPar :: Float -> Float -> Coordenada
crearPar x y = (x,y)
--ejercicioDos
type Año = Integer
type EsBisiesto = Bool
bisiesto :: Año -> EsBisiesto
bisiesto x
    | mod x 4 /= 0 || (mod x 100 == 0 && mod x 400 /= 0) = False
    | otherwise = True
--ejercicioTres
type Coordenada3d = (Float, Float, Float)
distanciaManhattan :: Coordenada3d ->Coordenada3d ->Float
distanciaManhattan (x,y,z) (a,b,c) = absoluto ((x-a)+(y-b)+(z-c))
absoluto :: Float -> Float
absoluto x
    | x>=0 = x
    | x<0 = -x
--ejercicioCuatro
type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

elNombre :: Contacto -> Nombre
elNombre (x,y) = x

elTelefono :: Contacto -> Telefono
elTelefono (x,y) = y

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos x [] = False
enLosContactos x (y:ys)
    | x == elNombre y = True
    | otherwise = enLosContactos x ys

telefonoGuardado :: Telefono -> ContactosTel -> Bool
telefonoGuardado x [] = False
telefonoGuardado x (y:ys)
    | x == elTelefono y = True
    | otherwise = telefonoGuardado x ys

actualizarTelefono :: Telefono -> Contacto -> Contacto
actualizarTelefono t (x,y) = (x,t)

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto x [] = [x]
agregarContacto (x,y) (z:zs)
    | enLosContactos x (z:zs) == False = (x,y):z:zs 
    | enLosContactos x (z:zs) == True && telefonoGuardado y (z:zs) == False = actualizarTelefono y (x,y):z:zs 

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto x [] = []
eliminarContacto x (y:ys)
    | x == elNombre y = ys
    | otherwise = y: eliminarContacto x ys
