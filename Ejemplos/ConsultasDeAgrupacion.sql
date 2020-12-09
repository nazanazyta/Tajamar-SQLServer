--CONSULTAS DE AGRUPACI�N
--
--1. Encontrar el salario medio de los analistas, mostrando el n�mero de los empleados con oficio analista.
select AVG(salario) as salariomedio, oficio, count(emp_no) as numerodeempleados from emp where oficio = 'analista'
	group by oficio
select AVG(salario) as salariomedio, oficio, count(emp_no) as numerodeempleados from emp	group by oficio
	having oficio = 'analista'
--2. Encontrar el salario mas alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.
select max(salario) as maximosalario, min(salario) as minimosalario from emp where oficio = 'empleado'
--3. Visualizar los salarios mayores para cada oficio.
select max(salario) as salariomayor, oficio from emp group by oficio
--4. Visualizar el n�mero de personas que realizan cada oficio en cada departamento.
select count(emp_no) as personas, dept_no, oficio from emp group by dept_no, oficio order by 1
--5. Buscar aquellos departamentos con cuatro o mas personas trabajando.
select dept_no, count(emp_no) as personas from emp group by dept_no having count(*) > 3
--6. Mostrar el n�mero de directores que existen por departamento.
select count(emp_no) as numerodeempleados, dept_no from emp where oficio = 'director' group by dept_no
--7. Visualizar el n�mero de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la funci�n.

--8. Visualizar departamentos, oficios y n�mero de personas, para aquellos departamentos que tengan dos o m�s personas trabajando en el mismo oficio.

--9. Calcular el salario medio, Diferencia, M�ximo y M�nimo de cada oficio. Indicando el oficio y el n�mero de empleados de cada oficio.

--10. Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el n�mero de cada una de ellas.

--11. Calcular el salario medio de la plantilla de la sala 6, seg�n la funci�n que realizan. Indicar la funci�n y el n�mero de empleados.
select count(Empleado_no) as Empleados, funcion, avg(salario) as SalarioMedio  
from plantilla group by funcion, sala_cod having sala_cod = 6
--12. Averiguar los �ltimos empleados que se dieron de alta en la empresa en cada uno de los oficios, ordenados por la fecha.

--13. Mostrar el n�mero de hombres y el n�mero de mujeres que hay entre los enfermos.

--14. Mostrar la suma total del salario que cobran los empleados de la plantilla para cada funci�n y turno.

--15. Calcular el n�mero de salas que existen en cada hospital.

--16. Mostrar el n�mero de enfermeras que existan por cada sala.
