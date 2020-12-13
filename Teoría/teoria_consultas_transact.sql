--
--TRANSACT SQL
--
--CREACIÓN DE OBJETOS DE BBDD (LÓGICA DE BBDD)
--EL LENGUAJE TRANSACT PERMITE INCLUIR LÓGICA DENTRO DE OBJETOS
--
--VISTAS
--UNA VISTA ES UNA CONSULTA ALMACENADA EN UN OBJETO
--SOLAMENTE PUEDE CONTENER INSTRUCCIONES SELECT
--UNA VISTA NO CONTIENE DATOS, ES UNA MÁSCARA SOBRE UNA TABLA
--QUE ES DONDE SALEN LOS DATOS REALMENTE
--LAS VISTAS TIENE DOS MODELOS DE USO
--1) CALIDAD Y RAPIDEZ EN UNA CONSULTA
--CUANDO REALIZAMOS UNA CONSULTA SOBRE UN SERVIDOR DE BBDD
--LA CONSULTA QUEDA ALMACENADA EN CACHÉ.
--CADA CONSULTA POSTERIOR QUE REALIZAMOS ES MÁS RÁPIDA, YA QUE EL
--SERVIDOR LA TIENE ALMACENADA. A ESTO SE LE LLAMA CONSULTAS AD HOC
--LAS VISTAS SON CARGADAS AD HOC EN EL SERVIDOR
--SI TENEMOS UNA CONSULTA SELECT GRANDE QUE REALIZAMOS MÚLTIPLES OCASIONES,
--LA PONEMOS EN LA VISTA PARA SIMPLIFICAR
--2) SEGURIDAD
--UN PROGRAMADOR NO SABE SI ESTÁ ATACANDO A UNA VISTA O UNA TABLA
--PODEMOS HACER CUALQUIER TIPO DE CONSULTA SOBRE UNA VISTA
--COMO UNA TABLA (UPDATE, SELECT, DELETE, INSERT)
--PODEMOS QUITAR LOS PERMISOS DE UNA TABLA Y OTORGAR PERMISOS
--EN UNA VISTA, DE ESTA FORMA, ESTAMOS GUARDANDO LOS DATOS
--DE LA TABLA Y MOSTRANDO UNA CAPA AL PROGRAMADOR
--CREATE, ALTER, DROP
--SINTAXIS:
--CREATE VIEW NOMBREVISTA
--AS
--	SELECT .... FROM TABLA
--GO
create view vistaempleados
AS
	select emp_no, apellido, oficio, dir, fecha_alt, dept_no from emp
GO
select * from vistaempleados
--PODEMOS INCLUIR CUALQUIER TIPO DE CONSULTA DENTRO DE UNA VISTA
create view vistaempdept
AS
	select emp.emp_no, emp.apellido, emp.salario,
	dept.dept_no, dept.dnombre, dept.loc from emp inner join dept
	on emp.dept_no = dept.dept_no
GO
--PODEMOS REALIZAR CONSULTAS MÁS SIMPLES
select * from vistaempdept where loc = 'madrid'
--CONSULTAS DE ACCIÓN SOBRE UNA VISTA????
update vistaempdept set loc = 'Madriz' where loc = 'Madrid'
delete from vistaempdept where loc = 'CADIZ'
--PODEMOS PERFECTAMENTE HACER LA CONSULTA ANTERIOR, PERO NECESITAMOS
--UN OBJETO QUE SE ENCARGARÁ DE DECIDIR SI BORRA EMP O DEPT: TRIGGER
--SI LA VISTA ES SIMPLE, PODEMOS HACER CUALQUIER CONSULTA
delete from vistaempleados where emp_no = 1111
insert into vistaempleados values (1111, 'NUEVO', 'BECARIO', 7839, GETDATE(), 10)
select * from vistaempleados
--LOS DATOS EN REALIDAD NUNCA ESTÁN EN LA VISTA, ESTÁN EN LA TABLA
select * from emp
--
--LENGUAJE TRANSACT SQL
--
--ES UN LENGUAJE QUE SE UTILIZA DENTRO DE OBJETOS DE SQL SERVER
--PARA DOTARLOS DE LÓGICA
--TIENE BUCLES (POCO UTILIZADOS EN BBDD), CONDICIONALES, VARIABLES
--LAS VARIABLES SE DECLARAN CON @
--EXISTEN VARIABLES DE SISTEMA QUE SON CON @@
--NO ES CASE SENSITIVE
--
--BLOQUES CÓDIGO TRANSACT
declare @texto nvarchar(40)
declare @numero int
declare @fecha datetime
--ASIGNAR VALORES A LAS VARIABLES
--1)	VALORES EXACTOS (INVENTADOS O PARTE DE UNA FUNCIÓN)
set @texto = LOWER('Hoy es Jueves')
set @numero = 19
set @fecha = GETDATE()
	--MOSTRAR DATOS
	--1) EN FORMATO CURSOR
	--select @texto as texto, @numero as numero, @fecha as fecha
	--2) MENSAJES EN SERVIDOR: PRINT
	--SI UTILIZAMOS PRINT, DEBEMOS HACER CASTING EN LAS VARIABLES
	--CAST(@VARIABLE AS TIPO)
print @texto + ' ' + CAST(@numero AS nvarchar) + ' ' + CAST(@fecha AS nvarchar)
print @numero + @numero
-------------------------------------------------------------------------------
--2)	ALMACENAR DATOS EN VARIABLES A PARTIR DE CONSULTAS
--MOSTRAR EL EMPLEADO MÁS ANTIGUO DE LA EMPRESA
select * from EMP where FECHA_ALT = (select MIN(fecha_alt) from EMP)
--BLOQUE TRANSACT PARA EVITAR LA SUBCONSULTA
declare @minfecha date
--CONSULTA PARA ALMACENAR DATOS
--NO PODEMOS COMBINAR: O ALMACENAOMS O MOSTRAMOS
select @minfecha = MIN(fecha_alt) from emp
select * from emp where fecha_alt = @minfecha
-------------------------------------------------------------------------------
--CONDICIONALES BLOQUES IF
declare @num int
set @num = 9
--CUALQUIER OPERADOR
IF (@num > 0)
BEGIN
	PRINT 'Positivo'
END
ELSE IF (@num = 0)
BEGIN
	PRINT 'Cero'
END
ELSE
BEGIN
	PRINT 'Negativo'
END
--MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO DE VENTAS
--DEPENDIENDO DEL NÚMERO DE REGISTROS PARA LOS JOIN PUDE SER MÁS
--ÓPTIMO REALIZAR LAS CONSULTAS POR SEPARADO
--SI NO HAY DEPARTAMENTO DE VENTAS, MOSTRAMOS UN MENSAJE
declare @deptno int
select @deptno = dept_no from DEPT where dnombre = 'Bentas'
IF (@deptno IS NULL)
BEGIN
	PRINT 'NO EXISTE DEPARTAMENTO DE VENTAS'
END
ELSE
BEGIN
	select * from EMP where DEPT_NO = @deptno
END
--MODIFICAR EL SALARIO DE GIL EN 10.000
--SI COBRA MENOS DE 150.000 SUBIMOS SUELDO
--SI COBRA MÁS DE 150.000 BAJAMOS SUELDO
DECLARE @salario int
select @salario = salario from EMP where APELLIDO = 'gil'
--print @salario
IF (@salario > 150000)
BEGIN
	PRINT 'Bajamos sueldo ' + CAST(@salario as nvarchar)
	UPDATE EMP set SALARIO = SALARIO - 10000 where APELLIDO = 'gil'
END
ELSE
BEGIN
	PRINT 'Subimos sueldo ' + CAST(@salario as nvarchar)
	UPDATE EMP SET SALARIO = SALARIO + 10000 where APELLIDO = 'gil'
END
--EJERCICIO:
--MODIFICAR EL SALARIO DE LOS EMPLEADOS (PLANTILLA) LA PAZ
--SI LA SUMA SALARIAL SUPERA UN MILLÓN, BAJAMOS EL SUELDO 10.000
--SI LA SUMA SALARIAL ES INFERIOR A UN MILLÓN, SUBIMOS EL SUELDO 10.000
--MOSTRAR LA SUMA SALARIAL Y SI HEMOS SUBIDO O BAJADO SALARIOS
DECLARE @codigo int
DECLARE @sumasalarial int
select @codigo = hospital_cod from hospital where NOMBRE = 'la paz'
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
--LOS BUCLES EN BBDD NO SE SUELEN UTILIZAR
--SU FUNCIÓN PRINCIPAL ES MEZCLARLOS CON CURSORES
--SINTAXIS BUCLE WHILE:
DECLARE @contador int
SET @contador = 1
WHILE (@contador <= 10)
BEGIN
	PRINT @contador
	SET @contador += 1
END
--POR SUERTE, EN SQL, LOS BUCLES NO SON DEL TODO IMPRESCINDIBLES
--PORQUE PODEMOS MOSTRAR CONSULTAS SELECT DENTRO DE BLOQUES DE CÓDIGO
--SON SOTA, CABALLO Y REY
--REALIZAR UN CURSOR PARA ALMACENAR EL APELLIDO Y OFICIO DE LOS EMPLEADOS
--MOSTRAREMOS CON PRINT SUS DATOS
declare @apellido nvarchar(40)
declare @oficio nvarchar(40)
--PARA PODER RECORRER UN CURSOR DEBEMOS DECLARARLO COMO CONSULTA
--1) DECLARAR CURSOS
declare query cursor for
	select apellido, oficio from EMP
--2) ABRIR CURSOR
open query
--3) ALMACENAR LOS DATOS DEL CURSOR
--CON fetch Y EL MISMO ORDEN DE CAMPOS QUE EN LA query
fetch next from query into @apellido, @oficio
--PARA SABER SI TENEMOS DATOS EN EL CURSOR EXISTE UNA VARIABLE DE SISTEMA LLAMADA @@FETCH_STATUS
--SI SU VALOR ES CERO, ES QUE TENEMOS REGISTROS
--4) REALIZAR BUCLE CON @@FETCH_STATUS PARA RECORRER
while (@@FETCH_STATUS = 0)
begin
	print @apellido + ' ' + @oficio
	--5) SEGUIMOS ALMACENANDO CON FETCH LOS DATOS
	fetch next from query into @apellido, @oficio
end
--6) CERRAR EL CURSOR
close query
--7) LIBERAR LA MEMORIA DEL CURSOR
deallocate query
----------------------------------------------------------------------------------------------
--MODIFICAR EL SALARIO DE LOS DOCTORES DE FORMA ALEATORIA
--CADA DOCTOR TENDRÁ UN INCREMENTO HASTA 1.000
--MOSTRAREMOS EL APELLIDO Y EL INCREMENTO DEL DOCTOR
--EXISTE UNA FUNCIÓN QUE ES RAND
--select rand() * 1000
--update DOCTOR set SALARIO = SALARIO + RAND() * 1000
--select * from doctor
declare @ape nvarchar(40)
declare @incremento int
declare @doctorno int
declare query cursor for
	select apellido, doctor_no from DOCTOR
open query
	fetch next from query into @ape, @doctorno
	while (@@FETCH_STATUS = 0)
	begin
		set @incremento = RAND() * 1000
		update DOCTOR set SALARIO = SALARIO + @incremento where DOCTOR_NO = @doctorno
		print 'El doctor ' + @ape + ' ha incrementado su salario en ' + cast(@incremento as nvarchar)
		fetch next from query into @ape, @doctorno
	end
close query
deallocate query
--PRÁCTICA
--LA CLAVE ESTÁ EN LA CONSULTA, LO DEMÁS ES SOTA, CABALLO Y REY = OPEN, CLOSE, DEALLOCATE
--MODIFICAR EL SALARIO DE LOS EMPLEADOS DE CADA DEPARTAMENTO
--SI LA SUMA SALARIAL SUPERA 1.000.000, BAJAMOS SUELDO (10.000)
--SI LA SUMA SALARIAL ES MENOR A 1.000.000, SUBIMOS SUELDO (10.000)
--MOSTRAR MENSAJES CON EL NOMBRE DEL DEPARTAMENTO, SI HA SUBIDO O BAJADO Y EL Nº DE PERSONAS AFECTADAS
declare @suma int
declare @dnombre nvarchar(30)
declare @afectados int
declare @dnumero int
declare query cursor for
	select SUM(e.salario) as sumatotal, d.dnombre, COUNT(e.emp_no) as afectados, d.dept_no
	from EMP e inner join DEPT d on e.DEPT_NO = d.DEPT_NO group by d.DNOMBRE, d.DEPT_NO
open query
	fetch next from query into @suma, @dnombre, @afectados, @dnumero
	while (@@FETCH_STATUS = 0)
	begin
		if (@suma > 1000000)
		begin
			print 'Bajando salarios ' + cast(@suma as nvarchar)
			update emp set salario -= 10000 where DEPT_NO = @dnumero
		end
		else
		begin
			print 'Subiendo salarios ' + cast(@suma as nvarchar)
			update emp set SALARIO += 10000 where DEPT_NO = @dnumero
		end
		print 'Se han modificado ' + cast(@afectados as nvarchar) + ' personas del departamento de ' + @dnombre
		fetch next from query into @suma, @dnombre, @afectados, @dnumero
	end
close query
deallocate query