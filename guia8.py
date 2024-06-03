#ARCHIVOS
#ejercicio 1.1
def contar_lineas(nombre_archivo: str) -> int:
    archivo = open(nombre_archivo, 'r',encoding='UTF-8')
    lineas = archivo.readlines()
    cantidad_lineas = len(lineas)
    archivo.close()
    return cantidad_lineas

#ejercicio 1.2
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo, 'r', encoding='UTF-8')
    lineas = archivo.readlines()
    resultado = False
    i = 0
    while i < len(lineas):
        if palabra in lineas[i]:
            resultado = True
            break
        i += 1
    return resultado 

#ejercicio 1.3
def apariciones_en_linea_aux(palabra: str, linea: str) -> int:
    palabras_en_linea = linea.split()
    apariciones = 0
    for palabra_en_linea in palabras_en_linea:
        if palabra_en_linea == palabra:
            apariciones += 1
    return apariciones

def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
    archivo = open(nombre_archivo, 'r', encoding='UTF-8')
    apariciones: int = 0
    lineas = archivo.readlines()
    i = 0
    while i < len(lineas):
        if palabra in lineas[i]:
            apariciones += apariciones_en_linea_aux(palabra, lineas[i])
        i += 1
    return apariciones

#ejercicio 2
def clonar_sin_comentarios(nombre_archivo: str) -> str:
    archivo_original = open(nombre_archivo, 'r', encoding='UTF-8')
    archivo_salida = open('sin_comentarios_' + nombre_archivo, 'w', encoding='UTF-8')
    for linea in archivo_original:
        if linea.lstrip().startswith('#'):
            continue
        else:
            archivo_salida.write(linea)
    print('El archivo fue clonado')

#ejercicio 3
def invertir_lineas(nombre_archivo: str) -> str:
    archivo_original = open(nombre_archivo, 'r', encoding='UTF-8')
    archivo_salida = open('lineas_invertidas_' + nombre_archivo, 'w', encoding='UTF-8')
    lineas = archivo_original.readlines()
    i = len(lineas) - 1
    while i >= 0:
        archivo_salida.write(lineas[i])
        i -= 1
    print('Se creó el archivo con las líneas invertidas')

#ejercicio 4
def agregar_frase_al_final(nombre_archivo: str, frase: str) -> str:
    archivo = open(nombre_archivo, 'r', encoding='UTF-8')
    lineas = archivo.readlines()
    archivo.close()
    lineas.append('\n' + frase)
    archivo = open(nombre_archivo, 'w', encoding='UTF-8')
    i = 0
    while i < len(lineas):
        archivo.write(lineas[i])
        i += 1
    print('Se agregó la frase al archivo de texto')

#ejercicio 5
def agregar_frase_al_principio(nombre_archivo: str, frase: str) -> str:
    archivo = open(nombre_archivo, 'r', encoding='UTF-8')
    lineas = archivo.readlines()
    archivo.close()
    archivo = open(nombre_archivo, 'w', encoding='UTF-8')
    archivo.write('\n' + frase)
    i = 0
    while i < len(lineas):
        archivo.write(lineas[i])
        i += 1
    print('Se agregó la frase al archivo de texto')

#ejercicio 7
def dividir_en_comas(s:str) -> list[str]:
    lista: list[str] = []
    palabra = ""
    for i in range(len(s)):
        if s[i] != "," :
            palabra = palabra + s[i]
        else:
            if palabra != "":
                lista.append(palabra)
            palabra = ""
    if palabra != "":
        lista.append(palabra)
    return lista

def pertenece_str(lista: list[str], elemento: str) -> bool:
    for i in range(len(lista)):
        if lista[i] == elemento:
            return True
    return False

def sacar_salto_de_linea(string: str) -> str:
    res: str = ""
    if existe_palabra(string, "\n"):
        for i in range(len(string)):
            if string[i] != "\n" :
                res += string[i]
            if string[i] == "\n" :
                return res
    else: 
        return string
        
def calcular_promedio_por_estudiante(nombre_archivo_notas : str, nombre_archivo_promedios : str):
    archivo = open(nombre_archivo_notas, "r")
    lineas: list[str] = archivo.readlines()
    archivo.close()
    parciales: list[list[str]] = []
    for linea in lineas:
        info : list[str] = dividir_en_comas(linea)
        nota = info[3]
        info[3] = sacar_salto_de_linea(nota)
        parciales.append(info)
    alumnos: list[str] = []
    for info_parcial in parciales:
        if not pertenece_str(alumnos, info_parcial[0]):
            alumnos.append(info_parcial[0])
    promedios = open(nombre_archivo_promedios , "w")
    for alumno in alumnos:
        suma_de_notas: int = 0
        cantidad_de_notas : int = 0
        for info_parcial in parciales:
            if info_parcial[0] == alumno:
                suma_de_notas += float(info_parcial[3])
                cantidad_de_notas += 1
        promedio: int = suma_de_notas / cantidad_de_notas
        promedios.write("Alumno; " + alumno + "," + " Promedio:" + str(promedio) + "\n")
    promedios.close()

#PILAS
from queue import LifoQueue
import random
#ejercicio 8
def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> LifoQueue[int]:
    