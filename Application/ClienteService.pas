unit ClienteService;

interface

uses
  IClienteService,
  IClienteRepository,
  UCliente,
  System.Generics.Collections,
  System.SysUtils,
  Dialogs;

type
  TClienteService = class(TInterfacedObject, IClienteServices)
  private
    FClienteRepository: IClienteRepositories;
  public
    constructor Create(AClienteRepository: IClienteRepositories);
    function ObterCliente(const AId: Integer): TCliente;
    function ListarClientes: TList<TCliente>;
    function CriarCliente(const ANome, ACPFCNPJ, ATelefone, AEmail: string): TCliente;
    procedure AtualizarCliente(const AId: Integer; const ANome, ACPFCNPJ, ATelefone, AEmail: string);
    procedure ExcluirCliente(const AId: Integer);
  end;

implementation

{ TClienteService }

constructor TClienteService.Create(AClienteRepository: IClienteRepositories);
begin
  inherited Create;
  FClienteRepository := AClienteRepository;
end;

function TClienteService.CriarCliente(const ANome, ACPFCNPJ, ATelefone, AEmail: string): TCliente;
var
  LCliente: TCliente;
begin
  try
    LCliente := TCliente.Create(FClienteRepository.ObterProximoId, ANome, ACPFCNPJ, ATelefone, AEmail);
    Result := FClienteRepository.Adicionar(LCliente);
  except
    on E: Exception do
    begin
      ShowMessage('Erro em CriarCliente: ' + E.Message);
      raise;
    end;
  end;
end;

function TClienteService.ListarClientes: TList<TCliente>;
begin
  Result := FClienteRepository.ListarTodos;
end;

function TClienteService.ObterCliente(const AId: Integer): TCliente;
begin
  Result := FClienteRepository.ObterPorId(AId);
end;

procedure TClienteService.AtualizarCliente(const AId: Integer; const ANome, ACPFCNPJ, ATelefone, AEmail: string);
var
  LCliente: TCliente;
begin
  LCliente := FClienteRepository.ObterPorId(AId);
  if LCliente <> nil then
  begin
    LCliente.Atualizar(ANome, ACPFCNPJ, ATelefone, AEmail);
    FClienteRepository.Atualizar(LCliente);
  end
  else
    raise EArgumentException.Create('Cliente não encontrado.');
end;

procedure TClienteService.ExcluirCliente(const AId: Integer);
begin
  FClienteRepository.Excluir(AId);
end;

end.
