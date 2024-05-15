import math
#ejercicio 1.1
def imprimir_hola_mundo():
    print ("hola mundo")

#ejercicio 1.2
def imprimir_un_verso():
    print ("Best believe I'm still bejeweled \n. When I walk in the room \n. I can still make the whole place shimmer")

#ejercicio 1.3
def raizDe2() -> int:
    x: int
    x = math.sqrt(2)
    return round(x,4)

#ejercicio 1.4
def factorial_de_dos() -> int:
    x: int
    x = math.factorial(2)
    return x

#ejercicio 1.5
def perimetro() -> int:
    x: int
    x = 2 * math.pi
    return x

#ejercicio 2.1
def imprimir_saludo(nombre):
    print ("Hola " + nombre)

#ejercicio 2.2
def raiz_cuadrada_de(x:int) -> int:
    y = math.sqrt(x)
    return y

#ejercicio 2.3
def fahrenheit_a_celsius(fahrenheit:int) -> int:
    celcius = ((fahrenheit-32)*5)/9
    return celcius

#ejercicio 2.4
def imprimir_dos_veces(estribillo):
    print (estribillo*2)

#ejercicio 2.5
def es_multiplo_de(n:int, m:int) -> bool:
    if n % m == 0: 
        return True
    else:
        return False
    
#ejercicio 2.6
def es_par(n:int) -> bool:
    return es_multiplo_de(n,2)

#ejercicio 2.7
def cantidad_de_pizzas(comensales:int, min_cant_de_porciones:int):
    x = comensales*min_cant_de_porciones
    return math.ceil(x/8)

#ejercicio 3.1
def alguno_es_0(n:int, m:int) -> bool:
    if n == 0 or m == 0:
        return True
    else:
        return False
    
#ejercicio 3.2
def ambos_son_0(n:int, m:int) -> bool:
    if n == 0 and m == 0:
        return True
    else:
        return False
    
#ejercicio 3.3
def es_nombre_largo(nombre) -> bool:
    if len(nombre) >= 3 and len(nombre) <= 8:
        return True
    else:
        return False
    
#ejercicio 3.4
def es_bisiesto(año:int) -> bool:
    if año % 4 != 0 or (año % 100 == 0 and año % 400 != 0):
        return False
    else:
        return True

#ejercicio 4.1
