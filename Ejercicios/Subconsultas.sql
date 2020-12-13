--SUBCONSULTAS
--
--1. Mostrar el numero de empleado, el apellido y la fecha de alta del empleado mas antiguo de la empresa
select emp_no, apellido, fecha_alt from emp where fecha_alt = (select max(fecha_alt) as fecha from emp)
--2. Mostrar el n�mero de empleado, el apellido y la fecha de alta del empleado mas modernos de la empresa.

--3. Visualizar el apellido y el oficio de los empleados con el mismo oficio que Jim�nez.

--4. Queremos saber el apellido, oficio, salario y n�mero de departamento de los empleados con salario mayor que el mejor salario del departamento 30.

--5. Mostrar el apellido, la funci�n, sala o departamento (nombres) de todos los empleados que trabajen en la empresa (DOCTOR, PLANTILLA y EMP).
select emp.apellido, emp.oficio as trabajo, dept.dnombre as lugar, 'emp' as tabla from emp inner join dept on emp.dept_no = dept.dept_no
union select doctor.apellido, doctor.especialidad, hospital.nombre, 'doc' from doctor inner join hospital on doctor.hospital_cod = hospital.hospital_cod
union select plantilla.apellido, plantilla.funcion, sala.nombre, 'pla' from plantilla inner join sala on plantilla.sala_cod = sala.sala_cod
--6. Averiguar el salario de todos los empleados de la empresa, de forma que se aprecien las diferencias entre ellos.

--7. Mostrar apellidos y oficio de los empleados del departamento 20 cuyo trabajo sea el mismo que el de cualquier empleado de ventas.

--8. Mostrar los empleados que tienen mejor salario que la media de los directores, no incluyendo al presidente.

--9. Mostrar el apellido, funci�n, salario y c�digo de hospital de los empleados de la plantilla que siendo enfermeros o enfermeras pertenecen al hospital SAN CARLOS.

--10. Visualizar los datos de los hospitales que tienen personal (Doctores) de cardiolog�a.

--11. Visualizar el salario anual (12 meses) de los empleados de la plantilla del Hospital Provincial y General.
select apellido, funcion, (salario * 12) as salarioanual from plantilla p inner join hospital h on p.hospital_cod = h.hospital_cod
	where nombre in (select nombre from hospital where nombre = 'Provincial' or nombre = 'general')
--12. Mostrar el apellido de los enfermos que nacieron antes que el Se�or Miller.

--13. Mostrar el apellido, la funci�n o especialidad, nombre de hospital de todos los empleados que trabajan en la paz o general.
select * from plantilla
select * from doctor
select * from hospital
select p.apellido, p.funcion as trabajo, h.nombre from plantilla p inner join hospital h on p.hospital_cod = h.hospital_cod in (select nombre from hospital in ('la paz', 'general'))
--14. Mostrar el apellido, n�mero de seguridad social y g�nero (MASCULINO, FEMENINO) de todos los enfermos.
