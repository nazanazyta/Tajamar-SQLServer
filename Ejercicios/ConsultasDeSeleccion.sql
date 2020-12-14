--CONSULTAS DE SELECCIÓN I
--
--1. Mostrar todos los datos de los empleados de nuestra tabla EMP
select * from emp
--2. Mostrar el apellido, oficio, salario anual, con las dos extras
--para aquellos empleados con comisión mayor de 100000.
select apellido, oficio, salario, salario * 14 as [salario anual] from emp
	where comision > 100000
--3. Ídem del anterior, pero para aquellos empleados que su salario
--anual con extras supere los 2.200.000 Ptas.
select apellido, oficio, salario, salario * 14 as [salario anual] from emp
	where salario * 14 > 2200000
--4. Ídem del anterior, pero para aquellos empleados que sumen entre
--salario anual con extras y comisión los 3.000.000 millones.
select apellido, oficio, salario, salario * 14 as [salario anual] from emp
	where salario * 14 + comision > 3000000
--5. Mostrar todos los datos de empleados ordenados por departamento
--y dentro de este por oficio para tener una visión jerárquica.
select * from emp order by dept_no, oficio
--6. Mostrar todas las salas para el hospital 45.
select * from sala where hospital_cod = 45
--7. Mostrar todos los enfermos nacidos antes de 1970.
select * from enfermo where fecha_nac < '01/01/1970'
--8. Igual que el anterior, para los nacidos antes de 1970 ordenados
--por número de inscripción descendente
select * from enfermo where fecha_nac < '01/01/1970'
	order by INSCRIPCION desc
--9. Listar todos los datos de la plantilla del hospital del
--turno de mañana
select * from plantilla where t = 'm'
--10. Ídem del turno de noche.
select * from plantilla where t = 'n'
--11. Visualizar los empleados de la plantilla del turno de mañana
--que tengan un salario entre 200.000 y 225.000 Ptas
select * from plantilla where salario <= 225000 and salario >=200000
select * from plantilla where salario between 200000 and 225000
--12. Visualizar los empleados de la tabla EMP que no se dieron de alta
--entre el 01/01/80 y el 12/12/82.
select * from emp where fecha_alt <= '01/01/80'
	or fecha_alt >= '12/12/82'
select * from emp where fecha_alt not between '01/01/1980' and '31/12/1982'
--13. Mostrar los nombres de los departamentos situados en Madrid
--o en Barcelona.
select dnombre from dept where loc = 'madrid' or loc = 'barcelona'
select dnombre from dept where loc in ('madrid', 'barcelona')
select dnombre from DEPT where LOC like 'Madrid' or LOC like 'Barcelona'
--
--CONSULTAS DE SELECCIÓN II
--
--1. Mostrar aquellos empleados con fecha de alta posterior
--al 1 de Julio de 1985.
select * from emp where fecha_alt > '01/07/1985'
select * from emp where fecha_alt > '01-07-1985'
--2. Lo mismo que en el ejercicio 1 pero con salario entre
--150000 y 400000.
select * from emp where fecha_alt > '01/07/1985'
	and salario >= 150000 and salario <= 400000
select * from emp where fecha_alt > '01-01-1985'
	and salario between 150000 and 4000000
--3. Igual que en el ejercicio 2, pero también incluimos aquellos
--que no siendo analistas pertenecen al departamento 20.
select * from emp where fecha_alt > '01/07/1985'
	and salario >= 150000 and salario <= 400000
	or (dept_no = 20 and oficio <> 'analista')
select * from emp where fecha_alt > '01-01-1985'
	and salario between 150000  and 4000000
	or (oficio <> 'ANALISTA' and  dept_no = 20)
--4. Mostrar aquellos empleados cuyo apellido termine en ‘Z’
--ordenados por departamento, y dentro de este por antigüedad.
select * from emp where apellido like '%z' order by dept_no, fecha_alt
--5. De los empleados del ejercicio 4 quitar aquellos que superen
--las 200000 Ptas. mensuales.
select * from emp where apellido like '%z' and salario <= 200000
	order by dept_no, fecha_alt
--6. Mostrar todos los empleados cuyo oficio no sea analista.
select * from emp where oficio <> 'analista'
--7. Igual que el 6, pero mostrándolos de forma que se aprecien las
--diferencias de salario dentro de cada oficio.
select * from emp where oficio <> 'analista' order by oficio, salario
--8. De los del 7, nos quedamos solo con aquellos cuyo número de empleado
--no esté entre 7600 y 7900.
select * from emp where oficio <> 'analista' and (emp_no > 7900
	or emp_no < 7600) order by oficio, salario
select * from emp where oficio <> 'ANALISTA'
	and emp_no not between 7600 and 7900 order by oficio, salario
--
--CONSULTAS DE SELECCIÓN III
--
--1. Mostrar los distintos oficios de los empleados.
select distinct oficio from emp
--2. Mostrar los distintos nombres de sala.
select distinct nombre from sala
--3. Mostrar que personal “No Interino” existe en cada sala de cada
--hospital, ordenado por hospital y sala.
select apellido, funcion, hospital_cod, sala_cod from plantilla
	where funcion <> 'interino' order by hospital_cod, sala_cod
select apellido, funcion, hospital_cod, sala_cod from plantilla
	where funcion not in ('interino') order by hospital_cod, sala_cod
--4. Justificar el resultado de la siguiente consulta.
--Indicar qué ocurre y modificarla para que todo vaya bien.
--SELECT APELLIDO DISTINCT DEPT_NO FROM EMP
--Incorrect syntax near the keyword 'DISTINCT'.
--DISTINCT va con el SELECT, y los campos separados por comas
select distinct apellido, dept_no from emp
--5. Seleccionar los distintos valores del sexo que tienen los enfermos.
select distinct s from enfermo
select distinct s as sexo from enfermo
--6. Indicar los distintos turnos de la plantilla del hospital,
--ordenados por turno y por apellido.
select distinct t, apellido from plantilla order by t, apellido
select distinct t as turno, apellido from plantilla
	order by turno, apellido
--7. Seleccionar las distintas especialidades que ejercen los médicos,
--ordenados por especialidad y apellido.
select distinct especialidad, apellido from doctor
	order by especialidad, apellido