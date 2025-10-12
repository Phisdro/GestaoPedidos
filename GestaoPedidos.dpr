program GestaoPedidos;

uses
  Vcl.Forms,
  UCliente in 'Domain\Entities\UCliente.pas',
  IClienteRepository in 'Domain\Interfaces\Repositories\IClienteRepository.pas',
  IClienteService in 'Application\Interfaces\Services\IClienteService.pas',
  ClienteService in 'Application\Services\ClienteService.pas',
  ClienteRepositoryMemory in 'Infrastructure\Repositories\ClienteRepositoryMemory.pas',
  FormClienteCadastro in 'Presentation\FormClienteCadastro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormClienteCadastro, FormClienteCadastro.FClienteCadastro);
  Application.Run;
end.

Application.CreateForm(TFormClienteCadastro, FormClienteCadastro);

Application.CreateForm(TFormClienteCadastro, FormClienteCadastro);

