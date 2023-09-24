
CREATE PROCEDURE TiposCuentas_Insertar
	@Nombre NVARCHAR(50),
	@UsuarioId INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @Orden INT;
	SELECT @Orden = COALESCE(MAX(Orden), 0) + 1
	FROM TiposCuentas
	WHERE UsuarioId = @UsuarioId

	INSERT INTO TiposCuentas (Nombre, UsuarioId, Orden)
    VALUES (@Nombre, @UsuarioId, @Orden);

    SELECT SCOPE_IDENTITY()
END
