--
--PROCEDIMIENTOS ALMACENADOS
--
--EL CÓDIGO QUE HEMOS REALIZADO SE PIERDE COMPLETAMENTE SI NO LO ALMACENAMOS.
--PARA ESO SON LOS PROCEDIMIENTOS ALMACENADOS. ALMACENAN BLOQUES TRANSACT Y NOS
--PERMITEN REALIZAR LA LLAMADA TANTAS VECES COMO DESEEMOS.
--PERMITEN RECIBIR PARÁMETROS (COMO MÉTODOS)
--UTIILIZAN CREATE, ALTER Y DROP
--SINTAXIS
/*
	CREATE PROCEDURE NOMBREPROCEDIMIENTO
	(@PARAM1 TIPO, @PARAM2 TIPO) -> opcional los parámetros
	AS
		--CÓDIGO TRANSACT SQL
	GO
*/
--EJECUTAR PROCEDIMIENTOS ALMACENADOS
--	EXEC/EXECUTE NOMBREPROCEDIMIENTO VALOR1, VALOR2
--EJEMPLO DE PROCEDIMIENTO PARA INSERTAR UN DEPARTAMENTO
CREATE PROCEDURE insertardepartamento (@num int, @nombre nvarchar(30), @localidad nvarchar(30))
AS
	INSERT INTO DEPT VALUES (@num, @nombre, @localidad)
GO
EXEC insertardepartamento 55, 'informatica', 'cadiz'
--select * from dept
--PROCEDIMIENTO PARA MODIFICAR EL SALARIO DE LOS EMPLEADOS DE UN DEPARTAMENTO POR SU NOMBRE
create procedure incrementarsalariodept (@incremento int, @nombre nvarchar(30))
as
	--podría hacer con un inner join, con una subconsulta...
	declare @deptno int
	select @deptno = DEPT_no from DEPT where DNOMBRE = @nombre
	update EMP set SALARIO = SALARIO + @incremento where DEPT_NO = @deptno
go
execute incrementarsalariodept 1, 'ventas'
select * from emp
select * from DEPT
--PROCEDIMIENTO PARA MODIFICAR EL SALARIO DE LA PLANTILLA DE UN HOSPITAL
--SUBIR EN 10.000 SI SU SUMA SALARIAL ES MAYOR A UN MILLÓN, BAJAR EN CASO CONTRARIO
create procedure modificarsalarioplantilla (@nombre nvarchar(30))
as
	DECLARE @codigo int
	DECLARE @sumasalarial int
	select @codigo = hospital_cod from hospital where NOMBRE = @nombre
	select @sumasalarial = SUM(salario) from PLANTILLA where HOSPITAL_COD = @codigo
	IF (@sumasalarial > 1000000)
	BEGIN
		PRINT 'Más de 1.000.000 - Bajamos salarios'
		PRINT 'Suma salarial: ' + CAST(@sumasalarial as nvarchar)
		UPDATE PLANTILLA set SALARIO = SALARIO - 10000 where HOSPITAL_COD = @codigo
	END
	ELSE
	BEGIN
		PRINT 'Menos de 1.000.000 - Subimos salarios'
		PRINT 'Suma salarial: ' + CAST(@sumasalarial as nvarchar)
		UPDATE PLANTILLA set SALARIO += 10000 where HOSPITAL_COD = @codigo
	END
go
exec modificarsalarioplantilla 'general'
exec modificarsalarioplantilla 'la paz'
--PROCEDIMIENTO ALMACENADO PARA INSERTAR UN EMPLEADO
--ENVIAREMOS TODOS SUS DATOS EXCEPTO LA FECHA (GETDATE())
--SI EL EMPLEADO INSERTADO ES PRESIDENTE: PONEMOS AL ACTUAL PRESIDENTE COMO DIRECTOR
drop procedure insertarempleado
create procedure insertarempleado (@numero int, @apellido nvarchar(30), @oficio nvarchar(20), @dir int, @salario int, @comision int, @deptno int)
as
	declare @presi int
	if (@oficio = 'presidente')
	begin
		select @presi = emp_no from EMP where OFICIO = 'presidente'
		update EMP set OFICIO = 'Director' where EMP_NO = @presi
		--where OFICIO = 'presidente'
	end
	insert into EMP values (@numero, @apellido, @oficio, @dir, GETDATE(), @salario, @comision, @deptno)
go
exec insertarempleado 8888, 'De la Calle', 'Presidente', 1215, 800000, 500000, 55
select * from emp
--PROCEDIMIENTOS ALMACENADOS CON PARÁMETROS OPCIONALES
--INCREMENTAR EL SALARIO DE LOS EMPLEADOS POR SU OFICIO
--SI NO RECIBIMOS INCREMENTO, LE INDICAREMOS 100
alter procedure incrementoemp (@oficio nvarchar(30), @incremento int = 100, @dato int = 0)
as
	update EMP set SALARIO = SALARIO + @incremento where OFICIO = @oficio

go
exec incrementoemp 'analista'
exec incrementoemp 'analista', 1
exec incrementoemp 'analista', @dato = 1
--
--PROCEDIMIENTOS ALMACENADOS CON PARÁMETROS DE SALIDA
--AQUÍ EN SQL SERVER NO TENDRÁN MUCHO SENTIDO. SU FUNCIÓN REAL SERÁ
--CUANDO LOS UTILICEMOS FUERA DE SQL SERVER (.NET, JAVA...)
--PERMITEN PODER ENVIAR VALORES DE SALIDA EN LA LLAMADA A UN PROCEDIMIENTO
--PROCEDIMIENTO PARA MOSTRAR LAS PERSONAS DE UN DEPARTAMENTO
--QUEREMOS SABER SU MEDIA SALARIAL TAMBIÉN
alter procedure mostrarempleados (@deptno int, @media int out)
as
	select @media = AVG(salario) from EMP where DEPT_NO = @deptno
	select * from EMP where DEPT_NO = @deptno
go
--exec mostrarempleados 10
declare @respuesta int
exec mostrarempleados 10, @respuesta output
print @respuesta