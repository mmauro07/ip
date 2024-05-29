import math
from typing import List, Dict, Tuple
#Primera Parte
#Ejercicio 1.1
def pertenece(s: List[int], c: int) -> bool:
    return c in s

def pertenece1(s: List[int], c: int) -> bool:
    for elemento in s:
        if elemento == c:
            return True
    return False

def pertenece2(s: List[int], c: int) -> bool:
    return any(elemento == c for elemento in s)

#Ejercicio 1.2
def divide_a_todos(s: List[int], c:int) -> bool:
    return all(elemento % c == 0 for elemento in s)

#Ejercicio 1.3
def suma_total(s: List[int]) -> int:
    suma = 0
    for elemento in s:
        suma += elemento
    return suma

#Ejercicio 1.4
def ordenados(s: List[int]) -> bool:
    for i in range(len(s) - 1):
        if s[i] > s[i + 1]:
            return False
    return True

#Ejercicio 1.5
def longitud_mayor_a_7(s: List[str]) -> bool:
    i = 0
    while i < len(s):
        if len(s[i]) > 7:
            return True
        i += 1
    return False

#Ejercicio 1.6
def es_palindromo(s: List[str]) -> bool:
    i = 0
    while i < len(s)//2:
        if s[i] != s[len(s)-(i+1)]:
            return False
        i += 1
    return True

#Ejercicio 1.7
def fortaleza_contrasena(contrasena:str) -> str:
    if len(contrasena) < 5:
        return "ROJA"
    elif len(contrasena) > 8 and any(c.islower() for c in contrasena) and any(c.isupper() for c in contrasena) and any(c.isdigit() for c in contrasena):
        return "VERDE"
    else:
        return "AMARILLA"
    
#Ejercicio 1.8
def saldo(movimientos: List[Tuple]) -> int:
    saldo = 0
    for movimiento, monto in movimientos:
        if movimiento == 'I':
            saldo += monto
        elif movimiento == 'R':
            saldo -= monto
    return saldo

#Ejercicio 1.9
def tres_vocales_distintas(palabra:str) -> bool:
    apareceVocal = [palabra.count(vocal) for vocal in 'aeiou']
    vocales_distintas = sum(ocurrencias > 0 for ocurrencias in apareceVocal)
    return vocales_distintas >= 3

#Segunda parte
#Ejercicio 2.1
def es_par(num:int) -> bool:
    return num % 2 == 0

def reemplazar_pos_pares_por_cero(s:list [int]):
    longitud:int = len(s)
    i = 0
    while (i < longitud):
        if es_par(i):
            s[i] = 0
        i += 1
    return s

#Ejercicio 2.2
def cero_en_posicion_par2(s: List[int]) -> List[int]:
    longitud:int = len(s)
    t: list[int] = []
    i = 0
    while i < longitud:
        if es_par(i):
            t.append(0)
        else:
            t.append(s[i])
        i += 1
    return t

#Ejercicio 2.3
def eliminar_vocales(palabra:str) -> str:
    vocales = "aeiouAEIOU"
    resultado = ""
    for chr in palabra:
        if chr not in vocales:
            resultado += chr
    return resultado

#Ejercicio 2.4
def reemplaza_vocales(s:str) -> str:
    vocales = "aeiouAEIOU"
    resultado = ""
    i = 0
    while i < len(s):
        if s[i] not in vocales:
            resultado += s[i]
        else:
            resultado += "-"
        i += 1
    return resultado

#Ejercicio 2.5
def da_vuelta_str(s: str) -> str:
    resultado = ""
    i = len(s) - 1
    while i >= 0:
        resultado += s[i]
        i -= 1
    return resultado

#Ejercicio 2.6
def eliminar_repetidos(s:str) -> str:
    resultado = ""
    for chr in s:
        if chr not in resultado:
            resultado += chr
    return resultado

#Ejercicio 3
def promedio(s:list[int]) -> float:
    promedio = suma_total(s)/len(s)

def aprobado(s:list[int]) -> int:
    i = 0
    while i < len(s):
        if all(s[i]>=4) and promedio(s)>=7.0:
            resultado = 1
        elif all(s[i]>=4) and promedio(s)<7.0 and promedio(s)>=4.0:
            resultado = 2
        else:
            resultado = 3
        i += 1
    return resultado

#Ejercicio 4.1
def lista_de_nombres() -> List[str]:
    res: List[str] = []
    sigo_pidiendo: bool = True
    while sigo_pidiendo:
        nombre = input("Ingrese nombre:\n")
        if nombre == "listo":
            sigo_pidiendo = False
        else:
            res.append(nombre)
    return res

#Ejercicio 4.2
def historial_monedero() -> List[Tuple[str,int]]:
    credito: int = 0
    historial: List[Tuple[str,int]] = []
    sesion_activa: bool = True
    while sesion_activa:
        operacion: str = input("Ingrese operacion:\n")
        if operacion == "C" or operacion == "D":
            monto: int = int(input("Ingrese monto:\n"))
            historial.append((operacion,monto))
            if operacion == "C":
                credito += monto
            else:
                credito -= monto
        if operacion == "X":
            sesion_activa = False
    return historial