
CREATE PROCEDURE CrearDatosUsuarioNuevo
	@UsuarioId INT
AS
BEGIN
	
	SET NOCOUNT ON;
    DECLARE @Efectivo NVARCHAR(50) = 'Efectivo';
    DECLARE @CuentasBanco NVARCHAR(50) = 'Cuentas de Banco';
    DECLARE @Tarjetas NVARCHAR(50) = 'Tarjetas';

	INSERT INTO TiposCuentas (Nombre, UsuarioId, Orden)
	VALUES (@Efectivo, @UsuarioId, 1),
	(@CuentasBanco, @UsuarioId, 2),
	(@Tarjetas, @UsuarioId, 3);

	INSERT INTO Cuentas (Nombre, Balance, TipoCuentaId)
	SELECT Nombre, 0, Id
	FROM TiposCuentas
	WHERE UsuarioId = @UsuarioId;

	INSERT INTO Categorias(Nombre, TipoOperacionId, UsuarioId)
	VALUES
	('Libros', 2, @UsuarioId),
	('Salario', 1, @UsuarioId),
	('Comida', 2, @UsuarioId);
END
