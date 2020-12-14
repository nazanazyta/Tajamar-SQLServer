--
--CONSULTAS DE AGRUPACIÓN
--------------------------
--
--1.	Encontrar el salario medio de los analistas, mostrando el número de los empleados con oficio analista
select COUNT(emp_no) as numero, oficio, AVG(salario) as salariomedio from EMP where OFICIO = 'analista' group by oficio
select COUNT(emp_no) as numero, oficio, AVG(salario) as salariomedio from EMP group by oficio having OFICIO = 'analista'
--2.	Encontrar el salario mas alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.
select MAX(salario) as salariomaximo, MIN(salario) as salariominimo, MAX(salario) - MIN(salario) as diferencia, oficio from EMP where OFICIO = 'empleado'group by oficio