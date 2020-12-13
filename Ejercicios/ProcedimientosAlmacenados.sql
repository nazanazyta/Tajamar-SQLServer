--PROCEDIMIENTOS ALMACENADOS
--
--1) Recuperar todos los empleados que se dieron de alta entre una determinada fecha inicial y fecha final
--y que pertenezcan a un determinado nombre de departamento.

--2) Crear un procedimiento que recupere el resumen de un hospital, mostrando la media, suma y el número
--de empleados que trabajan en él.  Enviaremos el nombre del hospital.

--3) Crear un procedimiento igual que el anterior, pero que recupere también las personas que trabajan
--en dicho hospital. Utilizar el procedimiento anterior para realizar la acción, de manera que siga
--funcionando con el mismo número de parámetros.

--4) Crear un procedimiento que sea un buscador, pasaremos todo o parte del apellido y nos mostrará
--el salario, oficio, apellido y nombre del departamento de todos los empleados que cumplan la condición.
--Nos devolverá en una variable de salida el número de empleado encontrados en la consulta.

--5) Crear procedimiento que inserte un doctor. El procedimiento pedirá el nombre del hospital.
--Si el hospital del doctor no existe mostraremos un mensaje informando y no insertaremos el registro.

--6) Crear un procedimiento almacenado que borre un determinado empleado. Comprobar que el empleado existe.
--El borrado del empleado se realizará enviando como parámetro el apellido del empleado. Si la consulta
--borrase más de un registro no realizaremos la acción e informaremos de ello.

--7) Procedimiento almacenado que nos permita la modificación de la especialidad de un doctor. Pasaremos como
--parámetro el  nombre del doctor y la nueva especialidad.

--8) Crear un procedimiento que modifique los datos de un departamento, pasando como parámetro para la
--modificación el número de departamento.  

--9) Crear un procedimiento en el que pasaremos como parámetro el Apellido de un empleado.
--El procedimiento devolverá los subordinados del empleado escrito.  

--10) Mostrar una lista de los empleados con el siguiente texto. Si el empleado no tiene nombre o la consulta
--devuelve null poner el texto de EMPLEADO SIN NOMBRE.

--DATOS EMPLEADOS                                                                                      
------------------------------------------------------------------------------------------------------ 
--EMPLEADO SIN NOMBRE
--EMPLEADO SIN NOMBRE
--El señor SANCHEZ con cargo de EMPLEADO se dió de alta el 17 de Diciembre de 1980
--El señor ARROYO con cargo de VENDEDOR se dió de alta el 22 de Febrero de 1981
--El señor SALA con cargo de VENDEDOR se dió de alta el 22 de Febrero de 1981
--El señor JIMENEZ con cargo de DIRECTOR se dió de alta el 2  de Abril de 1981
--El señor NEGRO con cargo de DIRECTOR se dió de alta el 1  de Mayo de 1981
--El señor CEREZO con cargo de DIRECTOR se dió de alta el 9  de Junio de 1981
--El señor TOVAR con cargo de VENDEDOR se dió de alta el 8  de Septiembre de 1981
--El señor MARTIN con cargo de VENDEDOR se dió de alta el 28 de Septiembre de 1981
--El señor SERRA con cargo de DIRECTOR se dió de alta el 10 de Octubre de 1981

--11) Modificación del ejercicio anterior, incluir también la diferencia de años que lleva en la empresa
--el empleado desde la fecha actual.

--DATOS EMPLEADOS                                                                                                                        
----------------------------------------------------------------------------------- 
--EMPLEADO SIN NOMBRE
--EMPLEADO SIN NOMBRE
--El señor SALA con cargo de VENDEDOR se dió de alta el 22 de Febrero de 1981 y lleva en la empresa 23 años

--12) Crear un procedimiento en el que pasaremos como parámetro el Apellido de un empleado.
--El procedimiento devolverá los subordinados del empleado escrito, si el empleado no existe en la base de datos,
--informaremos de ello, si el empleado no tiene subordinados, lo informaremos con un mensaje y mostraremos su jefe. 
--Mostrar el número de empleado, Apellido, Oficio y nombre del departamento de los subordinados.

--13) Crear un procedimiento en el que mostraremos la fecha de jubilación de un empleado junto a los años que le
--quedan en la empresa.El parámetro será el apellido. Debemos tener en cuenta que nuestra empresa sólo
--contrata gente de 22 años.

--14) Crear un procedimiento en el que pasaremos como argumento el apellido de un empleado y devolverá el número
--de vacaciones que se ha tomado el empleado desde que ingresó en la empresa dependiendo de su categoría.
--Mostraré el apellido, el oficio, la fecha de alta y fecha actual y el número de vacaciones.

--El PRESIDENTE rey tiene 40 dias de vacaciones, lleva en la empresa 12 años, con un total de 480 dias de vacaciones.

--VACACIONES AÑO POR CATEGORIA:
--*	Presidente: 40 días
--*	Empleado: 15 días
--*	Analista: 22 días
--*	Resto: 25 días