--PROCEDIMIENTOS ALMACENADOS
--
--1) Recuperar todos los empleados que se dieron de alta entre una determinada fecha inicial y fecha final
--y que pertenezcan a un determinado nombre de departamento.

--2) Crear un procedimiento que recupere el resumen de un hospital, mostrando la media, suma y el n�mero
--de empleados que trabajan en �l.  Enviaremos el nombre del hospital.

--3) Crear un procedimiento igual que el anterior, pero que recupere tambi�n las personas que trabajan
--en dicho hospital. Utilizar el procedimiento anterior para realizar la acci�n, de manera que siga
--funcionando con el mismo n�mero de par�metros.

--4) Crear un procedimiento que sea un buscador, pasaremos todo o parte del apellido y nos mostrar�
--el salario, oficio, apellido y nombre del departamento de todos los empleados que cumplan la condici�n.
--Nos devolver� en una variable de salida el n�mero de empleado encontrados en la consulta.

--5) Crear procedimiento que inserte un doctor. El procedimiento pedir� el nombre del hospital.
--Si el hospital del doctor no existe mostraremos un mensaje informando y no insertaremos el registro.

--6) Crear un procedimiento almacenado que borre un determinado empleado. Comprobar que el empleado existe.
--El borrado del empleado se realizar� enviando como par�metro el apellido del empleado. Si la consulta
--borrase m�s de un registro no realizaremos la acci�n e informaremos de ello.

--7) Procedimiento almacenado que nos permita la modificaci�n de la especialidad de un doctor. Pasaremos como
--par�metro el  nombre del doctor y la nueva especialidad.

--8) Crear un procedimiento que modifique los datos de un departamento, pasando como par�metro para la
--modificaci�n el n�mero de departamento.  

--9) Crear un procedimiento en el que pasaremos como par�metro el Apellido de un empleado.
--El procedimiento devolver� los subordinados del empleado escrito.  

--10) Mostrar una lista de los empleados con el siguiente texto. Si el empleado no tiene nombre o la consulta
--devuelve null poner el texto de EMPLEADO SIN NOMBRE.

--DATOS EMPLEADOS                                                                                      
------------------------------------------------------------------------------------------------------ 
--EMPLEADO SIN NOMBRE
--EMPLEADO SIN NOMBRE
--El se�or SANCHEZ con cargo de EMPLEADO se di� de alta el 17 de Diciembre de 1980
--El se�or ARROYO con cargo de VENDEDOR se di� de alta el 22 de Febrero de 1981
--El se�or SALA con cargo de VENDEDOR se di� de alta el 22 de Febrero de 1981
--El se�or JIMENEZ con cargo de DIRECTOR se di� de alta el 2  de Abril de 1981
--El se�or NEGRO con cargo de DIRECTOR se di� de alta el 1  de Mayo de 1981
--El se�or CEREZO con cargo de DIRECTOR se di� de alta el 9  de Junio de 1981
--El se�or TOVAR con cargo de VENDEDOR se di� de alta el 8  de Septiembre de 1981
--El se�or MARTIN con cargo de VENDEDOR se di� de alta el 28 de Septiembre de 1981
--El se�or SERRA con cargo de DIRECTOR se di� de alta el 10 de Octubre de 1981

--11) Modificaci�n del ejercicio anterior, incluir tambi�n la diferencia de a�os que lleva en la empresa
--el empleado desde la fecha actual.

--DATOS EMPLEADOS                                                                                                                        
----------------------------------------------------------------------------------- 
--EMPLEADO SIN NOMBRE
--EMPLEADO SIN NOMBRE
--El se�or SALA con cargo de VENDEDOR se di� de alta el 22 de Febrero de 1981 y lleva en la empresa 23 a�os

--12) Crear un procedimiento en el que pasaremos como par�metro el Apellido de un empleado.
--El procedimiento devolver� los subordinados del empleado escrito, si el empleado no existe en la base de datos,
--informaremos de ello, si el empleado no tiene subordinados, lo informaremos con un mensaje y mostraremos su jefe. 
--Mostrar el n�mero de empleado, Apellido, Oficio y nombre del departamento de los subordinados.

--13) Crear un procedimiento en el que mostraremos la fecha de jubilaci�n de un empleado junto a los a�os que le
--quedan en la empresa.El par�metro ser� el apellido. Debemos tener en cuenta que nuestra empresa s�lo
--contrata gente de 22 a�os.

--14) Crear un procedimiento en el que pasaremos como argumento el apellido de un empleado y devolver� el n�mero
--de vacaciones que se ha tomado el empleado desde que ingres� en la empresa dependiendo de su categor�a.
--Mostrar� el apellido, el oficio, la fecha de alta y fecha actual y el n�mero de vacaciones.

--El PRESIDENTE rey tiene 40 dias de vacaciones, lleva en la empresa 12 a�os, con un total de 480 dias de vacaciones.

--VACACIONES A�O POR CATEGORIA:
--*	Presidente: 40 d�as
--*	Empleado: 15 d�as
--*	Analista: 22 d�as
--*	Resto: 25 d�as