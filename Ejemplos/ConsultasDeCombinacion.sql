--CONSULTAS DE COMBINACIÓN
--
--1. Seleccionar el apellido, oficio, salario, numero de departamento y su nombre de todos los empleados
--cuyo salario sea mayor de 300000
select emp.apellido, emp.oficio, emp.salario, emp.dept_no, dept.dnombre from emp inner join dept on emp.dept_no = dept.dept_no
	where emp.salario > 300000
--2. Mostrar todos los nombres de Hospital con sus nombres de salas correspondientes.
select h.nombre, s.nombre from hospital h inner join sala s on h.hospital_cod = s.hospital_cod
--3. Calcular cuantos trabajadores de la empresa hay en cada ciudad.
select count(e.emp_no) as trabajadores, d.loc as ciudad from emp e right join dept d on d.dept_no = e.dept_no group by d.loc
--4. Visualizar cuantas personas realizan cada oficio en cada departamento mostrando el nombre del departamento.
select count(e.emp_no) as personas, e.oficio, d.dnombre from emp e inner join dept d on e.dept_no = d.dept_no group by d.dnombre, e.oficio
--5. Contar cuantas salas hay en cada hospital, mostrando el nombre de las salas y el nombre del hospital.
select count(s.sala_cod) as numeroSalas, s.nombre as sala, h.nombre as hospital from sala s right join hospital h
	on h.hospital_cod = s.hospital_cod group by s.nombre, h.nombre
--6. Calcular cuantos trabajadores hay en cada departamento (Nombre del departamento)
select count(e.emp_no) as trabajadores, d.dnombre as departamento from emp e right join dept d on d.dept_no = e.dept_no group by d.dnombre
--7. Buscar aquellas ciudades con cuatro o mas personas trabajando.
select count(e.emp_no) as empleados, d.loc as ciudad from emp e right join dept d on e.dept_no = d.dept_no having count(e.emp_no) > 3 group by d.loc
select loc from dept
--8. Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el código de cada una de ellas.

--9. Calcular la media salarial por ciudad.

--10. Mostrar los doctores junto con el nombre de hospital en el que ejercen, la dirección y el teléfono del mismo.

--11. Mostrar los nombres de los hospitales junto con el mejor salario de los empleados de cada hospital.

--12. Visualizar el Apellido de los empleados de la plantilla junto con el nombre de la sala, el nombre del hospital
--y el número de camas libres de cada una de ellas.

--13. Visualizar el máximo salario, mínimo salario de los empleados dependiendo de la ciudad en la que trabajen.
--Indicar el número total de trabajadores por ciudad.

--14. Averiguar la combinación de que salas podría haber por cada uno de los hospitales.