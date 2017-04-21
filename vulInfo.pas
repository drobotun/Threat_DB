unit vulInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ShellAPI;

type
  TvulInfoForm = class(TForm)
    logoImage: TImage;
    Logo_1: TLabel;
    insertOkBtn: TBitBtn;
    vulInsertPanel: TPanel;
    logoBevel: TBevel;
    vulURLLabel: TLabel;
    vulURLEdit: TEdit;
    vulGoWebButton: TSpeedButton;
    vulInfoMemo: TMemo;
    procedure FormShow(Sender: TObject);
    procedure insertOkBtnClick(Sender: TObject);
    procedure vulGoWebButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vulInfoForm: TvulInfoForm;

implementation

uses Main;

{$R *.dfm}

procedure TvulInfoForm.FormShow(Sender: TObject);
var
  CVSSLevelStr : string;
begin
  if mainForm.vulClientDataSet.Fields[10].AsFloat = 0 then
    CVSSLevelStr := 'Опасность отсутствует (базовая оценка CVSS составляет 0)';
  if (mainForm.vulClientDataSet.Fields[10].AsFloat >= 0.1) and
     (mainForm.vulClientDataSet.Fields[10].AsFloat <= 3.9)  then
    CVSSLevelStr := 'Низкий уровень опасности (базовая оценка CVSS составляет '
      + floattostr(mainForm.vulClientDataSet.Fields[10].AsFloat) + ')';
  if (mainForm.vulClientDataSet.Fields[10].AsFloat >= 4) and
     (mainForm.vulClientDataSet.Fields[10].AsFloat <= 6.9)  then
    CVSSLevelStr := 'Средний уровень опасности (базовая оценка CVSS составляет '
      + floattostr(mainForm.vulClientDataSet.Fields[10].AsFloat) + ')';
  if (mainForm.vulClientDataSet.Fields[10].AsFloat >= 7) and
     (mainForm.vulClientDataSet.Fields[10].AsFloat <= 9.9)  then
    CVSSLevelStr := 'Высокий уровень опасности (базовая оценка CVSS составляет '
      + floattostr(mainForm.vulClientDataSet.Fields[10].AsFloat) + ')';
  if (mainForm.vulClientDataSet.Fields[10].AsFloat = 10)  then
    CVSSLevelStr := 'Критический уровень опасности (базовая оценка CVSS составляет '
      + floattostr(mainForm.vulClientDataSet.Fields[10].AsFloat) + ')';
  vulInfoMemo.Clear;
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Идентификатор уязвимости:');
  vulInfoMemo.Lines.Add(inttostr(mainForm.vulClientDataSet.Fields[0].
                        AsInteger));
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Наименование уязвимости:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[1].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Идентификатор ФСТЭК:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[2].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Дата выявления уязвимости:');
  vulInfoMemo.Lines.Add(datetimetostr(mainForm.vulClientDataSet.Fields[3].
                        AsDateTime));
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Идентификаторы других систем описания уязвимостей:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[4].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Название ПО:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[5].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Версия ПО:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[6].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Класс уязвимости:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[7].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Наименование ОС:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[8].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Базовый вектор CVSS:');
  vulInfoMemo.Lines.Add(mainForm.vulClientDataSet.Fields[9].AsString);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulInfoMemo.Lines.Add('Уровень опасности:');
  vulInfoMemo.Lines.Add(CVSSLevelStr);
  vulInfoMemo.Lines.Add('----------------------------------------------------');
  vulURLEdit.Text := mainForm.vulClientDataSet.Fields[11].AsString
end;

procedure TvulInfoForm.insertOkBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TvulInfoForm.vulGoWebButtonClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open',
               'iexplore.exe',
               pansichar(mainForm.vulClientDataSet.Fields[11].AsString),
               nil, SW_SHOW);
end;

end.
