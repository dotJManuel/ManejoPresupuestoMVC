CREATE TABLE [dbo].[Tareas] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Titulo]        NVARCHAR (250) NOT NULL,
    [Descripcion]   NVARCHAR (MAX) NULL,
    [Orden]         INT            NOT NULL,
    [FechaCreacion] DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED ([Id] ASC)
);

