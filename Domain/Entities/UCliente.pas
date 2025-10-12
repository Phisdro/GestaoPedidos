unit UCliente;

interface

uses
  System.SysUtils;

type
  TCliente = class
  private
    FId: Integer;
    FNome: string;
    FCPFCNPJ: string;
    FTelefone: string;
    FEmail: string;
    procedure ValidarEmail(const AEmail: string);
    procedure ValidarCPFCNPJ(const ACpfCnpj: string);
  public
    constructor Create(const AId: Integer; const ANome, ACPFCNPJ, ATelefone, AEmail: string);
    procedure Atualizar(const ANome, ACPFCNPJ, ATelefone, AEmail: string);

    property Id: Integer read FId;
    property Nome: string read FNome;
    property CPFCNPJ: string read FCPFCNPJ;
    property Telefone: string read FTelefone;
    property Email: string read FEmail;
  end;

implementation

constructor TCliente.Create(const AId: Integer; const ANome, ACPFCNPJ, ATelefone, AEmail: string);
begin
  FId := AId;
  Atualizar(ANome, ACPFCNPJ, ATelefone, AEmail);
end;

procedure TCliente.Atualizar(const ANome, ACPFCNPJ, ATelefone, AEmail: string);
begin
  if Trim(ANome) = '' then
    raise EArgumentNilException.Create('Nome deve ser preenchido.');

  ValidarCPFCNPJ(ACPFCNPJ);
  ValidarEmail(AEmail);

  FNome := ANome;
  FCPFCNPJ := ACPFCNPJ;
  FTelefone := ATelefone;
  FEmail := AEmail;
end;

procedure TCliente.ValidarCPFCNPJ(const ACpfCnpj: string);
var
  LLength: Integer;
begin
  LLength := Length(Trim(ACpfCnpj));
  if (LLength <> 11) and (LLength <> 14) then
    raise EArgumentException.Create('CPF/CNPJ deve ter 11 ou 14 dígitos.');
end;

procedure TCliente.ValidarEmail(const AEmail: string);
begin
  if not Trim(AEmail).Contains('@') then
    raise EArgumentException.Create('E-mail inválido.');
end;

end.
