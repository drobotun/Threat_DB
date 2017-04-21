program threatDB;

uses
  Forms,
  Main in 'Main.pas' {mainForm},
  threatInsert in 'threatInsert.pas' {threatInsertForm},
  threatEdit in 'threatEdit.pas' {threatEditForm},
  threatInfo in 'threatInfo.pas' {threatInfoForm},
  threatDelete in 'threatDelete.pas' {threatDeleteForm},
  threatFind in 'threatFind.pas' {threatFindForm},
  threatFilter in 'threatFilter.pas' {threatFiltreForm},
  vulInsert in 'vulInsert.pas' {vulInsertForm},
  vulEdit in 'vulEdit.pas' {vulEditForm},
  vulInfo in 'vulInfo.pas' {vulInfoForm},
  vulDelete in 'vulDelete.pas' {vulDeleteForm},
  vulFind in 'vulFind.pas' {vulFindForm},
  vulFilter in 'vulFilter.pas' {vulFiltreForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(TthreatInsertForm, threatInsertForm);
  Application.CreateForm(TthreatEditForm, threatEditForm);
  Application.CreateForm(TthreatInfoForm, threatInfoForm);
  Application.CreateForm(TthreatDeleteForm, threatDeleteForm);
  Application.CreateForm(TthreatFindForm, threatFindForm);
  Application.CreateForm(TthreatFiltreForm, threatFiltreForm);
  Application.CreateForm(TvulInsertForm, vulInsertForm);
  Application.CreateForm(TvulEditForm, vulEditForm);
  Application.CreateForm(TvulInfoForm, vulInfoForm);
  Application.CreateForm(TvulDeleteForm, vulDeleteForm);
  Application.CreateForm(TvulFindForm, vulFindForm);
  Application.CreateForm(TvulFiltreForm, vulFiltreForm);
  Application.Run;
end.
