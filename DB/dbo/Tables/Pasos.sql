CREATE TABLE [dbo].[Pasos] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [TareaId]     INT              NOT NULL,
    [Descripcion] NVARCHAR (MAX)   NULL,
    [Realizado]   BIT              NOT NULL,
    [Orden]       INT              NOT NULL,
    CONSTRAINT [PK_Pasos] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Pasos_Tareas_TareaId] FOREIGN KEY ([TareaId]) REFERENCES [dbo].[Tareas] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Pasos_TareaId]
    ON [dbo].[Pasos]([TareaId] ASC);

