--
--CONSULTAS DE SELECCIÓN 1
--------------------------
--
--1.	Mostrar todos los datos de los empleados de nuestra tabla EMP
select * from EMP
--2.	Mostrar el apellido, oficio, salario anual, con las dos extras para aquellos empleados con comisión mayor de 100000
select apellido, oficio, salario * 14 as [Salario Anual] from EMP where COMISION > 100000
--3.	Ídem del anterior, pero para aquellos empleados que su salario anual con extras supere los 2.200.000 Ptas
select apellido, oficio, salario * 14 as [Salario Anual] from EMP where SALARIO * 14 > 2200000
--4.	Ídem del anterior, pero para aquellos empleados que sumen entre salario anual con extras y comisión los 3.000.000 millones
select apellido, oficio, salario * 14 as [Salario Anual] from EMP where SALARIO * 14 + COMISION > 3000000
--5.	Mostrar todos los datos de empleados ordenados por departamento y dentro de este por oficio para tener una visión jerárquica
select * from EMP order by DEPT_NO, OFICIO
--6.	Mostrar todas las salas para el hospital 45
select * from SALA where HOSPITAL_COD = 45
--7.	Mostrar todos los enfermos nacidos antes de 1970.
select * from ENFERMO where FECHA_NAC < '01/01/1970'
--8.	Igual que el anterior, para los nacidos antes de 1970 ordenados por número de inscripción descendente
select * from ENFERMO where FECHA_NAC < '01/01/1970' order by INSCRIPCION desc
--9.	Listar todos los datos de la plantilla del hospital del turno de mañana
select * from PLANTILLA where T like 'm'
select * from PLANTILLA where T = 'm'
--10.	Ídem del turno de noche.
select * from PLANTILLA where T like 'n'
select * from PLANTILLA where T = 'n'
--11.	Visualizar los empleados de la plantilla del turno de mañana que tengan un salario entre 200.000 y 225.000 Ptas…
select * from PLANTILLA where T = 'm' and SALARIO >= 200000 and SALARIO <= 225000
--12.	Visualizar los empleados de la tabla EMP que no se dieron de alta entre el 01/01/80 y el 12/12/82
select * from EMP where FECHA_ALT < '01/01/80' or FECHA_ALT > '12/12/82'
--13.	Mostrar los nombres de los departamentos situados en Madrid o en Barcelona
select dnombre from DEPT where LOC like 'Madrid' or LOC like 'Barcelona'
select dnombre from DEPT where LOC = 'Madrid' or LOC = 'Barcelona'
select dnombre from DEPT where LOC in ('Madrid', 'Barcelona')
---------------------------------------------------------------------------------------------------------------------------------
--
--CONSULTAS DE SELECCIÓN 2
--------------------------
--
--1.	Mostrar aquellos empleados con fecha de alta posterior al 1 de Julio de 1985
select * from EMP where FECHA_ALT > '01/07/1985'
--2.	Lo mismo que en el ejercicio 1 pero con salario entre 150000 y 400000
select * from EMP where FECHA_ALT > '01/07/1985' and SALARIO >= 150000 and SALARIO <= 400000
--3.	Igual que en el ejercicio 2, pero también incluimos aquellos que no siendo analistas pertenecen al departamento 20
select * from EMP where FECHA_ALT > '01/07/1985' and SALARIO >= 150000 and SALARIO <= 400000 or (OFICIO <> 'analista' and DEPT_NO = 20)
--4.	Mostrar aquellos empleados cuyo apellido termine en ‘Z’ ordenados por departamento, y dentro de este por antigüedad
select * from EMP where APELLIDO like '%Z' order by DEPT_NO, FECHA_ALT
--5.	De los empleados del ejercicio 4 quitar aquellos que superen las 200000 Ptas. mensuales
select * from EMP where APELLIDO like '%Z' and salario <= 200000 order by DEPT_NO, FECHA_ALT
--6.	Mostrar todos los empleados cuyo oficio no sea analista
select * from EMP where OFICIO <> 'analista'
--7.	Igual que el 6, pero mostrándolos de forma que se aprecien las diferencias de salario dentro de cada oficio
select * from EMP where OFICIO <> 'analista' order by oficio, SALARIO
--8.	De los del 7, nos quedamos solo con aquellos cuyo número de empleado no esté entre 7600 y 7900
select * from EMP where OFICIO <> 'analista' and (EMP_NO < 7600 or EMP_NO > 7900) order by oficio, SALARIO
---------------------------------------------------------------------------------------------------------------------------------
--
--CONSULTAS DE SELECCIÓN 3
--------------------------
--
--1.	Mostrar los distintos oficios de los empleados
select distinct oficio from EMP
--2.	Mostrar los distintos nombres de sala
select distinct nombre from SALA
--3.	Mostrar que personal “No Interino” existe en cada sala de cada hospital, ordenado por hospital y sala
select * from PLANTILLA where FUNCION <> 'Interino' order by HOSPITAL_COD, SALA_COD
--4.	Justificar el resultado de la siguiente consulta SELECT APELLIDO DISTINCT DEPT_NO FROM EMP. Indicar que ocurre y modificarla para que todo vaya bien
select distinct apellido, dept_no from EMP
--5.	Seleccionar los distintos valores del sexo que tienen los enfermos
select distinct s as sexo from ENFERMO
--6.	Indicar los distintos turnos de la plantilla del hospital, ordenados por turno y por apellido
select distinct t as turno, APELLIDO from PLANTILLA order by turno, APELLIDO
--7.	Seleccionar las distintas especialidades que ejercen los médicos, ordenados por especialidad y apellido
select distinct especialidad, apellido from DOCTOR order by ESPECIALIDAD, APELLIDO