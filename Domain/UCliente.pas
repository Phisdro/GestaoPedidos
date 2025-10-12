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
    function CalcularDigito(const ANumero: string; const APesoInicial: Integer): Char;
    function CPFEhValido(const ACpfCnpj: string): Boolean;
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

function TCliente.CalcularDigito(const ANumero: string; const APesoInicial: Integer): Char;
var
  LSoma, I: Integer;
  LResto: Double;
begin
  LSoma := 0;
  for I := 1 to Length(ANumero) do
  begin
    LSoma := LSoma + (StrToInt(ANumero[I]) * (APesoInicial - I + 1));
  end;

  LResto := LSoma mod 11;
  if LResto < 2 then
    Result := '0'
  else
    Result := Chr(Trunc(11 - LResto) + Ord('0'));
end;

function TCliente.CPFEhValido(const ACpfCnpj: string): Boolean;
var
  LDigito1Calculado, LDigito2Calculado: Char;
begin
  LDigito1Calculado := CalcularDigito(Copy(ACpfCnpj,1,9), 10);
  LDigito2Calculado := CalcularDigito(Copy(ACpfCnpj,1,9) + LDigito1Calculado, 11);

  Result := (Copy(ACpfCnpj,10,1) = LDigito1Calculado) and
            (Copy(ACpfCnpj,11,1) = LDigito2Calculado);
end;

procedure TCliente.ValidarCPFCNPJ(const ACpfCnpj: string);
var
  LLength, LPeso: Integer;
  LAuxInt64: Int64;
begin
  LLength := Length(Trim(ACpfCnpj));
  if (LLength <> 11) and (LLength <> 14) then
    raise EArgumentException.Create('CPF/CNPJ deve ter 11 ou 14 dígitos.');

  if not TryStrToInt64(ACpfCnpj, LAuxInt64) then
    raise EArgumentException.Create('CPF/CNPJ deve conter apenas números');

  if((LLength = 11) and not CPFEhValido(ACpfCnpj)) then
    raise EArgumentException.Create('O CPF informado é inválido!');
end;

procedure TCliente.ValidarEmail(const AEmail: string);
begin
  if not Trim(AEmail).Contains('@') then
    raise EArgumentException.Create('E-mail inválido.');
end;

end.
