unit FormClienteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IClienteService,
  UCliente,
  System.Generics.Collections;

type
  TFormClienteCadastro = class(TForm)
    Panel1: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    edtNome: TEdit;
    edtCPFCNPJ: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBoxCadastroClientes: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure ListBoxCadastroClientesClick(Sender: TObject);
  private
    FClienteService: IClienteServices;
    FClienteAtual: TCliente;
    FListaClientes: TList<TCliente>;
    procedure LimparCampos;
    procedure CarregarClientes;
    procedure PreencherCampos(const ACliente: TCliente);
  public
    { Public declarations }
  end;

var
  FClienteCadastro: TFormClienteCadastro;

implementation

{$R *.dfm}

uses
  ClienteService,
  ClienteRepositoryMemory;

procedure TFormClienteCadastro.btnExcluirClick(Sender: TObject);
begin
  if (FClienteAtual <> nil) and (MessageDlg('Excluir cliente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    FClienteService.ExcluirCliente(FClienteAtual.Id);
    CarregarClientes;
    LimparCampos;
    ShowMessage('Cliente excluído com sucesso!');
  end;
end;

procedure TFormClienteCadastro.btnNovoClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TFormClienteCadastro.btnSalvarClick(Sender: TObject);
begin
  try
    if FClienteAtual = nil then
    begin
      FClienteService.CriarCliente(edtNome.Text, edtCPFCNPJ.Text, edtTelefone.Text, edtEmail.Text);
      ShowMessage('Cliente criado com sucesso!');
    end
    else
    begin
      FClienteService.AtualizarCliente(FClienteAtual.Id, edtNome.Text, edtCPFCNPJ.Text, edtTelefone.Text, edtEmail.Text);
      ShowMessage('Cliente atualizado com sucesso!');
    end;
    CarregarClientes;
    LimparCampos;
  except
    on E: Exception do
      ShowMessage('Erro ao salvar cliente: ' + E.Message);
  end;
end;

procedure TFormClienteCadastro.CarregarClientes;
var
  LCliente: TCliente;
begin
  try
    ListBoxCadastroClientes.Items.BeginUpdate;
    ListBoxCadastroClientes.Clear;

    if Assigned(FListaClientes) then
      FListaClientes.Free;

    FListaClientes := FClienteService.ListarClientes;

    for LCliente in FListaClientes do
      ListBoxCadastroClientes.Items.Add(Format('%d - %s (%s)', [LCliente.Id, LCliente.Nome, LCliente.CPFCNPJ]));

  finally
    ListBoxCadastroClientes.Items.EndUpdate;
  end;
end;

procedure TFormClienteCadastro.FormCreate(Sender: TObject);
var
  LClienteRepository: TClienteRepositoryMemory;
begin

  LClienteRepository := TClienteRepositoryMemory.Create;
  FClienteService := TClienteService.Create(LClienteRepository);

  CarregarClientes;
end;


procedure TFormClienteCadastro.FormDestroy(Sender: TObject);
begin
  if Assigned(FListaClientes) then
    FListaClientes.Free;
end;

procedure TFormClienteCadastro.ListBoxCadastroClientesClick(Sender: TObject);
var
  LIndex: Integer;
begin
  LIndex := ListBoxCadastroClientes.ItemIndex;
  if (LIndex >= 0) and (LIndex < FListaClientes.Count) then
  begin
    PreencherCampos(FListaClientes[LIndex]);
  end;
end;

procedure TFormClienteCadastro.LimparCampos;
begin
  edtNome.Text := '';
  edtCPFCNPJ.Text := '';
  edtTelefone.Text := '';
  edtEmail.Text := '';
  FClienteAtual := nil;
  ListBoxCadastroClientes.ItemIndex := -1;
end;

procedure TFormClienteCadastro.PreencherCampos(const ACliente: TCliente);
begin
  if ACliente <> nil then
  begin
    edtNome.Text := ACliente.Nome;
    edtCPFCNPJ.Text := ACliente.CPFCNPJ;
    edtTelefone.Text := ACliente.Telefone;
    edtEmail.Text := ACliente.Email;
    FClienteAtual := ACliente;
  end;
end;

end.
