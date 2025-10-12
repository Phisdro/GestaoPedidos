unit IClienteRepository;

interface

uses
  UCliente,
  System.Generics.Collections;

type
  IClienteRepositories = interface
    function ObterPorId(const AId: Integer): TCliente;
    function ListarTodos: TList<TCliente>;
    function Adicionar(const ACliente: TCliente): TCliente;
    procedure Atualizar(const ACliente: TCliente);
    procedure Excluir(const AId: Integer);
    function ObterProximoId: Integer;
  end;

implementation

end.
