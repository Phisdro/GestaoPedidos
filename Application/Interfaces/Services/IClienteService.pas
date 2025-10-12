unit IClienteService;

interface

uses
  UCliente,
  System.Generics.Collections;

type
  IClienteServices = interface
    function ObterCliente(const AId: Integer): TCliente;
    function ListarClientes: TList<TCliente>;
    function CriarCliente(const ANome, ACPFCNPJ, ATelefone, AEmail: string): TCliente;
    procedure AtualizarCliente(const AId: Integer; const ANome, ACPFCNPJ, ATelefone, AEmail: string);
    procedure ExcluirCliente(const AId: Integer);
  end;

implementation

end.
