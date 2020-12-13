--CONSULTAS DE ACCIÓN
--
--1. Dar de alta con fecha actual al empleado Escriche como programador perteneciente al departamento de informática.
--Tendrá un salario base de 70000 pts/mes y no cobrará comisión. ¿Qué consultas deberíamos hacer?
insert into dept values (50, 'INFORMATICA', 'GRANADA')
insert into emp values (1234, 'ESCRICHE', 'PROGRAMADO', 1456, GETDATE(), 70000, 0, (select dept_no from dept where dnombre = 'INFORMATICA'))
select * from emp
--2. Se quiere dar de alta un departamento de Recursos Humanos situado en Soria y otro departamento de Informática en Alicante.
--Realizar la acción lo más rápido posible para el servidor.

--3. El departamento de ventas por motivos de peseteros se traslada a Lérida, realizar dicha modificación.

--4. En el departamento anterior (VENTAS) se dan de alta dos empleados: Julián Romeral y Luis Alonso.
--Su salario base es de 80000 Pts. y cobrarán una comisión del 15% de su salario.

--5. Modificar la comisión de los empleados de la empresa, de forma que todos tengan un incremento del 10% del salario.

--6. Incrementar en 10000 el salario de los interinos de la plantilla que trabajen en el turno de noche.

--7. Ha llegado un nuevo doctor a la Paz. Su apellido es House y su especialidad es Diagnostico. Introducir el siguiente número de doctor disponible.

--8. Incrementar el salario de los empleados del departamento de ventas de modo que cobren 5000 más que el empleado que menos cobre con oficio EMPLEADO.

--9. Ha llegado un nuevo doctor a la Paz. Su apellido es House y su especialidad es Diagnostico. Introducir el siguiente número de doctor disponible.

--10. Modificar el salario de los empleados trabajen en la paz y estén destinados a Psiquiatría. Subirles el sueldo 20000 Ptas. más que al señor Amigo R.

--11. Borrar los empleados cuyo nombre de departamento sea producción.

--12. Crear una tabla llamada Listaespera e insertar los enfermos con el sexo masculino.

--13. Insertar los enfermos en lista de espera que se hayan nacido antes de 1960.

--14. Crear una tabla llamada Empleados e introducir todos los datos de la tabla EMP en ella.

--15. Insertar dos registros con instrucción múltiple insert en la tabla empleados.

--16. Borrar de la lista de espera al enfermo con número de inscripción igual a 64823.

--17. Borrar todos los registros de la tabla lista de espera de la forma más rápida.

--18. Utilizar la tabla Empleados. Borrar todos los empleados dados de alta entre las fechas 01/01/80 y 31/12/82.
