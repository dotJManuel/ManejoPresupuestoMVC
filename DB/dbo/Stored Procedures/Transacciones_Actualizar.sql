CREATE PROCEDURE Transacciones_Actualizar
	@Id INT,
	@FechaTransaccion DATETIME,
	@Monto DECIMAL(18,2),
	@MontoAnterior DECIMAL(18,2),
	@CuentaId INT,
	@CuentaAnteriorId INT,
	@CategoriaId INT,
	@Nota NVARCHAR(1000) = NULL
AS
BEGIN
	
	UPDATE Cuentas 
	SET Balance -= @MontoAnterior
	WHERE Id = @CuentaAnteriorId;

	UPDATE Cuentas
	SET Balance += @Monto
	WHERE Id = @CuentaId;

	UPDATE Transacciones
	SET Monto = ABS(@Monto), FechaTransaccion = @FechaTransaccion,
	CategoriaId = @CategoriaId, CuentaId = @CuentaId, Nota = @Nota
	WHERE Id = @Id;

END
