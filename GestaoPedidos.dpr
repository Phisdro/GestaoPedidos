program GestaoPedidos;

uses
  Vcl.Forms,
  UCliente in 'Domain\UCliente.pas',
  IClienteRepository in 'Domain\IClienteRepository.pas',
  IClienteService in 'Domain\IClienteService.pas',
  ClienteService in 'Application\ClienteService.pas',
  ClienteRepositoryMemory in 'Infrastructure\ClienteRepositoryMemory.pas',
  FormClienteCadastro in 'Presentation\FormClienteCadastro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormClienteCadastro, FormClienteCadastro.FClienteCadastro);
  Application.Run;
end.
