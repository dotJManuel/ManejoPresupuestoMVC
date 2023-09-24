
CREATE PROCEDURE Transacciones_Borrar
	@Id INT
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @Monto DECIMAL(18,2)
	DECLARE @CuentaId INT;
	DECLARE @TipoOperacionId INT;

	SELECT @Monto = Monto, @CuentaId = CuentaId, @TipoOperacionId = cat.TipoOperacionId
	FROM Transacciones
	INNER JOIN Categorias cat
	ON cat.Id = Transacciones.CategoriaId
	WHERE Transacciones.Id = @Id

	DECLARE @FactorMultiplicativo INT = 1;

	IF (@TipoOperacionId = 2)
		SET @FactorMultiplicativo = -1;

	SET @Monto = @Monto * @FactorMultiplicativo;

	UPDATE Cuentas
	SET Balance -= @Monto
	WHERE Id = @CuentaId;

	DELETE Transacciones
	WHERE Id = @Id;

END
