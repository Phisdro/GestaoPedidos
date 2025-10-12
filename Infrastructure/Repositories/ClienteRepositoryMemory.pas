unit ClienteRepositoryMemory;

interface

uses
  IClienteRepository,
  UCliente,
  System.Generics.Collections,
  System.SysUtils;

type
  TClienteRepositoryMemory = class(TInterfacedObject, IClienteRepositories)
  private
    FLista: TObjectList<TCliente>;
    FProximoId: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function ObterPorId(const AId: Integer): TCliente;
    function ListarTodos: TList<TCliente>;
    function Adicionar(const ACliente: TCliente): TCliente;
    procedure Atualizar(const ACliente: TCliente);
    procedure Excluir(const AId: Integer);
    function ObterProximoId: Integer;
  end;


implementation

constructor TClienteRepositoryMemory.Create;
var
  LCliente: TCliente;
begin
  FLista := TObjectList<TCliente>.Create(True);
  FProximoId := 1;

  try
    LCliente := TCliente.Create(ObterProximoId, 'João Silva', '12345678901', '(11) 9999-8888', 'joao@email.com');
    Adicionar(LCliente);

    LCliente := TCliente.Create(ObterProximoId, 'Maria Santos', '98765432100', '(11) 7777-6666', 'maria@email.com');
    Adicionar(LCliente);

    LCliente := TCliente.Create(ObterProximoId, 'Empresa XYZ Ltda', '12345678000199', '(11) 5555-4444', 'contato@xyz.com');
    Adicionar(LCliente);
  except
    on E: Exception do
  end;
end;

destructor TClienteRepositoryMemory.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TClienteRepositoryMemory.Adicionar(const ACliente: TCliente): TCliente;
begin
  FLista.Add(ACliente);
  Result := ACliente;
  Inc(FProximoId);
end;

procedure TClienteRepositoryMemory.Atualizar(const ACliente: TCliente);
begin
  if ObterPorId(ACliente.Id) = nil then
    raise EArgumentException.Create('Cliente não encontrado para atualização.');
end;

procedure TClienteRepositoryMemory.Excluir(const AId: Integer);
var
  I: Integer;
begin
  for I := 0 to FLista.Count - 1 do
  begin
    if FLista[I].Id = AId then
    begin
      FLista.Delete(I);
      Exit;
    end;
  end;
end;

function TClienteRepositoryMemory.ListarTodos: TList<TCliente>;
var
  I: Integer;
begin
  Result := TList<TCliente>.Create;
  for I := 0 to FLista.Count - 1 do
    Result.Add(FLista[I]);
end;

function TClienteRepositoryMemory.ObterPorId(const AId: Integer): TCliente;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FLista.Count - 1 do
  begin
    if FLista[I].Id = AId then
    begin
      Result := FLista[I];
      Break;
    end;
  end;
end;

function TClienteRepositoryMemory.ObterProximoId: Integer;
begin
  Result := FProximoId;
end;

end.
