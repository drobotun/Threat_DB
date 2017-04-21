unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, DBTables, StdCtrls, ExtCtrls, DBCtrls,
  DBClient, ADODB, ComCtrls, Mask, Buttons, Menus, Math, TeEngine,
  TeeFunci, Series, TeeProcs, Chart;

type
  TmainForm = class(TForm)
    PageControl: TPageControl;
    threatTab: TTabSheet;
    threatDataSource: TDataSource;
    threatClientDataSet: TClientDataSet;
    vulTab: TTabSheet;
    CVSSTab: TTabSheet;
    threatPanel: TPanel;
    threatDBGrid: TDBGrid;
    threatDBNavigator: TDBNavigator;
    exitButton: TButton;
    vulClientDataSet: TClientDataSet;
    vulDataSource: TDataSource;
    vulPanel: TPanel;
    vulDBGrid: TDBGrid;
    vulDBNavigator: TDBNavigator;
    logoImage: TImage;
    logoBevel: TBevel;
    Logo_1: TLabel;
    Label1: TLabel;
    threatEditBtn: TBitBtn;
    threatInsertBtn: TBitBtn;
    threatDeleteBtn: TBitBtn;
    threatFindBtn: TBitBtn;
    threatStatusBar: TStatusBar;
    CopyrightLabel_2: TLabel;
    Logo_4: TLabel;
    threatPopupMenu: TPopupMenu;
    threatInfo: TMenuItem;
    threatEdit: TMenuItem;
    threatDelete: TMenuItem;
    threatInsert: TMenuItem;
    N1: TMenuItem;
    vulStatusBar: TStatusBar;
    vulEditBtn: TBitBtn;
    vulInsertBtn: TBitBtn;
    vulDeleteBtn: TBitBtn;
    vulFindBtn: TBitBtn;
    N2: TMenuItem;
    threatFind: TMenuItem;
    vulPopupMenu: TPopupMenu;
    vulInfo: TMenuItem;
    MenuItem2: TMenuItem;
    vulEdit: TMenuItem;
    vulDelete: TMenuItem;
    vulInsert: TMenuItem;
    MenuItem6: TMenuItem;
    vulFind: TMenuItem;
    threatClearFindFiltre: TMenuItem;
    vulClearFindFilter: TMenuItem;
    baseMetricsGroup: TGroupBox;
    timeMetricsGroup: TGroupBox;
    contextMetricsGroup: TGroupBox;
    StaticText1: TStaticText;
    AVCombo: TComboBox;
    StaticText2: TStaticText;
    ACCombo: TComboBox;
    StaticText3: TStaticText;
    AuCombo: TComboBox;
    StaticText4: TStaticText;
    CCombo: TComboBox;
    ICombo: TComboBox;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    ACombo: TComboBox;
    StaticText7: TStaticText;
    ECombo: TComboBox;
    StaticText8: TStaticText;
    RLCombo: TComboBox;
    StaticText9: TStaticText;
    RCCombo: TComboBox;
    StaticText10: TStaticText;
    CDPCombo: TComboBox;
    StaticText11: TStaticText;
    TDCombo: TComboBox;
    StaticText12: TStaticText;
    CRCombo: TComboBox;
    StaticText13: TStaticText;
    IRCombo: TComboBox;
    StaticText14: TStaticText;
    ARCombo: TComboBox;
    StaticText15: TStaticText;
    CVSSVerIIStatusBar: TStatusBar;
    ScoreGroupBox: TGroupBox;
    reportScoreMemo: TMemo;
    BaseScoreChart: TChart;
    BaseSeries: TBarSeries;
    TeeFunction1: TAddTeeFunction;
    TemporalScoreChart: TChart;
    TemporalSeries: TBarSeries;
    AddTeeFunction1: TAddTeeFunction;
    EnvironmentalScoreChart: TChart;
    EnvironmentalSeries: TBarSeries;
    AddTeeFunction2: TAddTeeFunction;
    OverallScoreChart: TChart;
    OverallSeries: TBarSeries;
    AddTeeFunction3: TAddTeeFunction;
    procedure threatDBGridTitleClick(Column: TColumn);
    procedure exitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure threatInsertBtnClick(Sender: TObject);
    procedure threatDeleteBtnClick(Sender: TObject);
    procedure threatEditBtnClick(Sender: TObject);
    procedure threatDBGridDblClick(Sender: TObject);
    procedure threatInfoClick(Sender: TObject);
    procedure threatEditClick(Sender: TObject);
    procedure threatDeleteClick(Sender: TObject);
    procedure threatInsertClick(Sender: TObject);
    procedure vulDBGridTitleClick(Column: TColumn);
    procedure threatFindBtnClick(Sender: TObject);
    procedure threatClearFindFiltreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure threatFindClick(Sender: TObject);
    procedure vulInsertBtnClick(Sender: TObject);
    procedure vulEditBtnClick(Sender: TObject);
    procedure vulEditClick(Sender: TObject);
    procedure vulInsertClick(Sender: TObject);
    procedure vulDeleteBtnClick(Sender: TObject);
    procedure vulDeleteClick(Sender: TObject);
    procedure vulDBGridDblClick(Sender: TObject);
    procedure vulInfoClick(Sender: TObject);
    procedure vulFindBtnClick(Sender: TObject);
    procedure vulClearFindFilterClick(Sender: TObject);
    procedure vulFindClick(Sender: TObject);
    procedure CVSSTabShow(Sender: TObject);
    procedure AVComboChange(Sender: TObject);
    procedure ACComboChange(Sender: TObject);
    procedure AuComboChange(Sender: TObject);
    procedure CComboChange(Sender: TObject);
    procedure IComboChange(Sender: TObject);
    procedure AComboChange(Sender: TObject);
    procedure EComboChange(Sender: TObject);
    procedure RLComboChange(Sender: TObject);
    procedure RCComboChange(Sender: TObject);
    procedure CDPComboChange(Sender: TObject);
    procedure TDComboChange(Sender: TObject);
    procedure CRComboChange(Sender: TObject);
    procedure IRComboChange(Sender: TObject);
    procedure ARComboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  AV_L = 0.395;
  AV_A = 0.646;
  AV_N = 1;

  AC_H = 0.35;
  AC_M = 0.61;
  AC_L = 0.71;

  AU_N = 0.704;
  AU_S = 0.56;
  AU_M = 0.45;

  CI_N = 0;
  CI_P = 0.275;
  CI_C = 0.660;

  II_N = 0;
  II_P = 0.275;
  II_C = 0.660;

  AI_N = 0;
  AI_P = 0.275;
  AI_C = 0.660;

  E_U = 0.85;
  E_POC = 0.9;
  E_F = 0.95;
  E_H = 1;
  E_ND = 1;

  RL_OF = 0.87;
  RL_TF = 0.9;
  RL_W = 0.95;
  RL_U = 1;
  RL_ND = 1;

  RC_UC = 0.9;
  RC_UR = 0.95;
  RC_C = 1.0;
  RC_ND = 1.0;

  CDP_N = 0;
  CDP_L = 0.1;
  CDP_LM = 0.3;
  CDP_MH = 0.4;
  CDP_H = 0.5;
  CDP_ND = 0;

  TD_N = 0;
  TD_L = 0.25;
  TD_M = 0.75;
  TD_H = 1;
  TD_ND = 1;

  CR_L = 0.5;
  CR_M = 1;
  CR_H = 1.51;
  CR_ND = 1;

  IR_L = 0.5;
  IR_M = 1;
  IR_H = 1.51;
  IR_ND = 1;

  AR_L = 0.5;
  AR_M = 1;
  AR_H = 1.51;
  AR_ND = 1;

function GetLastNumThreadRecord : integer;
function GetLastNumVulRecord : integer;

var
  mainForm: TmainForm;

type
  TFakeDBGrid = class(TCustomGrid);

implementation

uses threatInsert, threatEdit, threatInfo, threatDelete, threatFind,
  vulInsert, vulEdit, vulDelete, vulInfo, vulFind;

{$R *.dfm}

function GetLastNumThreadRecord : integer;
begin
  Result := mainForm.threatClientDataSet.RecordCount;
end;

function GetLastNumVulRecord : integer;
begin
  Result := mainForm.vulClientDataSet.RecordCount;
end;

function GetAccessVector : real;
begin
  case mainForm.AVCombo.ItemIndex of
    0 : Result := AV_L;
    1 : Result := AV_A;
    2 : Result := AV_N;
  end;
end;

function GetAccessComplexity : real;
begin
  case mainForm.ACCombo.ItemIndex of
    0 : Result := AC_H;
    1 : Result := AC_M;
    2 : Result := AC_L;
  end;
end;

function GetAutentification : real;
begin
  case mainForm.AuCombo.ItemIndex of
    0 : Result := AU_M;
    1 : Result := AU_S;
    2 : Result := AU_N;
  end;
end;

function GetConfImpact : real;
begin
  case mainForm.CCombo.ItemIndex of
    0 : Result := CI_N;
    1 : Result := CI_P;
    2 : Result := CI_C;
  end;
end;

function GetIntegImpact : real;
begin
  case mainForm.ICombo.ItemIndex of
    0 : Result := II_N;
    1 : Result := II_P;
    2 : Result := II_C;
  end;
end;

function GetAvailImpact : real;
begin
  case mainForm.ACombo.ItemIndex of
    0 : Result := AI_N;
    1 : Result := AI_P;
    2 : Result := AI_C;
  end;
end;

function GetExplotablityToBaseScore : real;
begin
  Result := 20 * GetAccessComplexity * GetAutentification * GetAccessVector;
end;

function GetImpact : real;
begin
  Result := 10.41 * (1 - (1 - GetConfImpact) * (1 - GetIntegImpact) * (1 - GetAvailImpact));
end;

function GetFImpact(impact : real) : real;
begin
  if impact = 0 then
    Result := 0
  else
    Result := 1.176;
end;

function GetBaseScore : real;
begin
  Result := RoundTo((0.6 * GetImpact + 0.4 *
             GetExplotablityToBaseScore - 1.5) *
             GetFImpact(GetImpact), -1);
end;

function GetExplotability : real;
begin
  case mainForm.ECombo.ItemIndex of
    0 : Result := E_U;
    1 : Result := E_POC;
    2 : Result := E_F;
    3 : Result := E_H;
    4 : Result := E_ND;
  end;
end;

function GetRemediationLevel : real;
begin
  case mainForm.RLCombo.ItemIndex of
    0 : Result := RL_OF;
    1 : Result := RL_TF;
    2 : Result := RL_W;
    3 : Result := RL_U;
    4 : Result := RL_ND;
  end;
end;

function GetReportConfidence : real;
begin
  case mainForm.RCCombo.ItemIndex of
    0 : Result := RC_UC;
    1 : Result := RC_UR;
    2 : Result := RC_C;
    3 : Result := RC_ND;
  end;
end;

function GetTemporalScore : real;
begin
  Result := RoundTo(GetBaseScore *
                    GetExplotability *
                    GetRemediationLevel *
                    GetReportConfidence, - 1);
end;

function GetCollateralDamagePotential : real;
begin
  case mainForm.CDPCombo.ItemIndex of
    0 : Result := CDP_ND;
    1 : Result := CDP_N;
    2 : Result := CDP_L;
    3 : Result := CDP_LM;
    4 : Result := CDP_MH;
    5 : Result := CDP_H;
  end;
end;

function GetTargetDistribution : real;
begin
  case mainForm.TDCombo.ItemIndex of
    0 : Result := TD_ND;
    1 : Result := TD_N;
    2 : Result := TD_L;
    3 : Result := TD_M;
    4 : Result := TD_H;
  end;
end;

function GetConfReq : real;
begin
  case mainForm.CRCombo.ItemIndex of
    0 : Result := CR_ND;
    1 : Result := CR_L;
    2 : Result := CR_M;
    3 : Result := CR_H;
  end;
end;

function GetIntegReq : real;
begin
  case mainForm.IRCombo.ItemIndex of
    0 : Result := IR_ND;
    1 : Result := IR_L;
    2 : Result := IR_M;
    3 : Result := IR_H;
  end;
end;

function GetAvailReq : real;
begin
  case mainForm.ARCombo.ItemIndex of
    0 : Result := AR_ND;
    1 : Result := AR_L;
    2 : Result := AR_M;
    3 : Result := AR_H;
  end;
end;

function GetAdjustedImpact : real;
begin
  Result := min(10, (10.41 * (1 - (1 - GetConfImpact * GetConfReq) *
                                  (1 - GetIntegImpact * GetIntegReq) *
                                  (1 - GetAvailImpact * GetAvailReq))));
end;

function GetAdjustedTemporal : real;
var
  adjustedBase : real;
begin
  adjustedBase := (0.6 * GetAdjustedImpact + 0.4 *
                  GetExplotablityToBaseScore - 1.5) *
                  GetFImpact(GetImpact);
  Result := RoundTo(adjustedBase *
                    GetExplotability *
                    GetRemediationLevel *
                    GetReportConfidence, - 1);
end;

function GetEnvironmentalScore : real;
begin
  Result := RoundTo((GetAdjustedTemporal +
            (10 - GetAdjustedTemporal) *
            GetCollateralDamagePotential) *
            GetTargetDistribution, -1);
end;

function GetOverallScore : real;
begin
  Result := GetBaseScore;
  if GetBaseScore = 0 then exit;
  if GetEnvironmentalScore <> 0 then
    begin
      Result := GetEnvironmentalScore;
      exit;
    end;
  if GetTemporalScore <> 0 then
    begin
      Result := GetTemporalScore;
      exit;
    end;
end;

function GetCVSSBaseVectorString : string;
var
  av_str, ac_str, au_str, c_str, i_str, a_str : string;
  e_str, rl_str, rc_str,
  cdp_str, td_str, cr_str, ir_str, ar_str : string;
begin
  case mainForm.AVCombo.ItemIndex of
    0 : av_str := 'L';
    1 : av_str := 'A';
    2 : av_str := 'N';
  end;
  case mainForm.ACCombo.ItemIndex of
    0 : ac_str := 'H';
    1 : ac_str := 'M';
    2 : ac_str := 'L';
  end;
  case mainForm.AuCombo.ItemIndex of
    0 : au_str := 'M';
    1 : au_str := 'S';
    2 : au_str := 'N';
  end;
  case mainForm.CCombo.ItemIndex of
    0 : c_str := 'N';
    1 : c_str := 'P';
    2 : c_str := 'C';
  end;
  case mainForm.ICombo.ItemIndex of
    0 : i_str := 'N';
    1 : i_str := 'P';
    2 : i_str := 'C';
  end;
  case mainForm.ACombo.ItemIndex of
    0 : a_str := 'N';
    1 : a_str := 'P';
    2 : a_str := 'C';
  end;
  Result := 'AV:' + av_str + '/AC:' + ac_str + '/Au:' + au_str +
            '/C:' + c_str + '/I:' + i_str + '/A:' + a_str;
end;

function GetCVSSTemporalVectorString : string;
var
  e_str, rl_str, rc_str : string;
begin
  case mainForm.ECombo.ItemIndex of
    0 : e_str := 'U';
    1 : e_str := 'POC';
    2 : e_str := 'F';
    3 : e_str := 'H';
    4 : e_str := 'ND';
  end;
  case mainForm.RLCombo.ItemIndex of
    0 : rl_str := 'OF';
    1 : rl_str := 'TF';
    2 : rl_str := 'W';
    3 : rl_str := 'U';
    4 : rl_str := 'ND';
  end;
  case mainForm.RCCombo.ItemIndex of
    0 : rc_str := 'UC';
    1 : rc_str := 'UR';
    2 : rc_str := 'C';
    3 : rc_str := 'ND';
  end;
  Result := 'E:' + e_str + '/RL:' + rl_str + '/RC:' + rc_str;
end;

function GetCVSSContextVectorString : string;
var
  cdp_str, td_str, cr_str, ir_str, ar_str : string;
begin
  case mainForm.CDPCombo.ItemIndex of
    0 : cdp_str := 'ND';
    1 : cdp_str := 'N';
    2 : cdp_str := 'L';
    3 : cdp_str := 'LM';
    4 : cdp_str := 'MH';
    5 : cdp_str := 'H';
  end;
  case mainForm.TDCombo.ItemIndex of
    0 : td_str := 'ND';
    1 : td_str := 'N';
    2 : td_str := 'L';
    3 : td_str := 'M';
    4 : td_str := 'H';
  end;
  case mainForm.CRCombo.ItemIndex of
    0 : cr_str := 'ND';
    1 : cr_str := 'L';
    2 : cr_str := 'M';
    3 : cr_str := 'H'
  end;
  case mainForm.IRCombo.ItemIndex of
    0 : ir_str := 'ND';
    1 : ir_str := 'L';
    2 : ir_str := 'M';
    3 : ir_str := 'H'
  end;
  case mainForm.ARCombo.ItemIndex of
    0 : ar_str := 'ND';
    1 : ar_str := 'L';
    2 : ar_str := 'M';
    3 : ar_str := 'H'
  end;
  Result := 'CDP:' + cdp_str + '/TD:' + td_str +
            '/CR:' + cr_str + '/IR:' + ir_str + '/AR:' + ar_str;
end;

procedure CVSSResultRefresh;
begin
  mainForm.reportScoreMemo.Clear;
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Базовый вектор CVSS:');
  mainForm.reportScoreMemo.Lines.Add(GetCVSSBaseVectorString);
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Временной вектор CVSS:');
  mainForm.reportScoreMemo.Lines.Add(GetCVSSTemporalVectorString);
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Вектор окружения:');
  mainForm.reportScoreMemo.Lines.Add(GetCVSSContextVectorString);
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Базовая оценка (CVSS Base Score): ' +
                                     floattostrf(GetBaseScore,ffFixed, 1, 1));
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Временная оценка (CVSS Temporal Score): ' +
                                     floattostrf(GetTemporalScore,ffFixed, 1, 1));
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Оценка окружения (CVSS Environmental Score): ' +
                                     floattostrf(GetEnvironmentalScore,ffFixed, 1, 1));
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.reportScoreMemo.Lines.Add('Суммарная оценка (Overall CVSS Score): ' +
                                     floattostrf(GetOverallScore,ffFixed, 1, 1));
  mainForm.reportScoreMemo.Lines.Add('----------------------------------------------------');
  mainForm.BaseSeries.Clear;
  mainForm.BaseSeries.Add(GetBaseScore, 'Base', clLime);
  mainForm.BaseSeries.Add(GetImpact, 'Impact', clLime);
  mainForm.TemporalSeries.Clear;
  mainForm.TemporalSeries.Add(GetTemporalScore, 'Temporal', clLime);
  mainForm.EnvironmentalSeries.Clear;
  mainForm.EnvironmentalSeries.Add(GetEnvironmentalScore, 'Environmental', clLime);
  mainForm.OverallSeries.Clear;
  mainForm.OverallSeries.Add(GetOverallScore, 'Overall', clLime);
  mainForm.CVSSVerIIStatusBar.Panels.Items[0].Text :=
    'Базовая оценка CVSS: ' + floattostrf(GetBaseScore,ffFixed, 1, 1);
  mainForm.CVSSVerIIStatusBar.Panels.Items[2].Text :=
    'Базовый вектор CVSS: (' + GetCVSSBaseVectorString + ')';
  if GetBaseScore = 0 then
    mainForm.CVSSVerIIStatusBar.Panels.Items[1].Text :=
    'Уровень опасности: Отсутствует';
  if (GetBaseScore < 4) and (GetBaseScore > 0) then
    mainForm.CVSSVerIIStatusBar.Panels.Items[1].Text :=
    'Уровень опасности: Низкий';
  if (GetBaseScore < 7) and (GetBaseScore >= 4) then
    mainForm.CVSSVerIIStatusBar.Panels.Items[1].Text :=
    'Уровень опасности: Средний';
  if (GetBaseScore < 10) and (GetBaseScore >= 7) then
    mainForm.CVSSVerIIStatusBar.Panels.Items[1].Text :=
    'Уровень опасности: Высокий';
  if GetBaseScore = 10 then
    mainForm.CVSSVerIIStatusBar.Panels.Items[1].Text :=
    'Уровень опасности: Критический';
end;

procedure TmainForm.threatDBGridTitleClick(Column: TColumn);
begin
  threatClientDataSet.IndexFieldNames:=Column.FieldName;
end;

procedure TmainForm.exitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  try
    threatClientdataSet.Active := true;
  except
    MessageBox(0,'Ошибка подключения базы данных угроз',
      'T&V DataBase', MB_OK or MB_ICONERROR);
  end;
  try
    vulClientdataSet.Active := true;
  except
    MessageBox(0,'Ошибка подключения базы данных уязвимостей',
      'T&V DataBase', MB_OK or MB_ICONERROR);
  end;
  threatStatusBar.Panels.Items[0].Text := 'Всего записей в базе: ' +
    inttostr(GetLastNumThreadRecord);
  vulStatusBar.Panels.Items[0].Text := 'Всего записей в базе: ' +
    inttostr(GetLastNumvulRecord);
  TFakeDBGrid(threatDBGrid).ScrollBars := ssNone;
  TFakeDBGrid(vulDBGrid).ScrollBars := ssNone;
  mainForm.PageControl.ActivePage := mainForm.threatTab;
end;

procedure TmainForm.threatInsertBtnClick(Sender: TObject);
begin
  threatInsertForm.threatNameEdit.Text := '';
  threatInsertForm.threatObjEdit.Text := '';
  threatInsertForm.threatInCheckBox.Checked := false;
  threatInsertForm.threatOutCheckBox.Checked := false;
  threatInsertForm.InHightRadioButton.Enabled := false;
  threatInsertForm.InMidRadioButton.Enabled := false;
  threatInsertForm.InLowRadioButton.Enabled := false;
  threatInsertForm.OutHightRadioButton.Enabled := false;
  threatInsertForm.OutMidRadioButton.Enabled := false;
  threatInsertForm.OutLowRadioButton.Enabled := false;
  threatInsertForm.threatIDUpDown.Position:= GetLastNumThreadRecord+1;
  threatDBNavigator.BtnClick(nbInsert);
  threatInsertForm.ShowModal;
end;

procedure TmainForm.threatDeleteBtnClick(Sender: TObject);
begin
  if GetLastNumThreadRecord <> 0 then
    threatDeleteForm.ShowModal;
end;

procedure TmainForm.threatEditBtnClick(Sender: TObject);
begin
  if GetLastNumThreadRecord <> 0 then
    begin
      threatEditForm.threatIDUpDown.Position :=
        mainForm.threatClientDataSet.Fields[0].AsInteger;
      threatEditForm.threatNameEdit.Text :=
        mainForm.threatClientDataSet.Fields[1].AsString;
      threatEditForm.threatObjEdit.Text :=
        mainForm.threatClientDataSet.Fields[2].AsString;
      threatEditForm.threatInCheckBox.Checked :=
         mainForm.threatClientDataSet.Fields[3].AsBoolean;
      threatEditForm.threatOutCheckBox.Checked :=
        mainForm.threatClientDataSet.Fields[4].AsBoolean;
      if threatEditForm.threatInCheckBox.Checked then
        begin
          threatEditForm.inHightRadioButton.Enabled := true;
          threatEditForm.inMidRadioButton.Enabled := true;
          threatEditForm.inLowRadioButton.Enabled := true;
          case mainForm.threatClientDataSet.Fields[5].AsInteger of
            3 : threatEditForm.inHightRadioButton.Checked := true;
            2 : threatEditForm.inMidRadioButton.Checked := true;
            1 : threatEditForm.inLowRadioButton.Checked := true;
          end;
        end;
      if threatEditForm.threatOutCheckBox.Checked then
        begin
          threatEditForm.outHightRadioButton.Enabled := true;
          threatEditForm.outMidRadioButton.Enabled := true;
          threatEditForm.outLowRadioButton.Enabled := true;
          case mainForm.threatClientDataSet.Fields[6].AsInteger of
            3 : threatEditForm.outHightRadioButton.Checked := true;
            2 : threatEditForm.outMidRadioButton.Checked := true;
            1 : threatEditForm.outLowRadioButton.Checked := true;
          end;
        end;
      threatEditForm.threatConfCheckBox.Checked :=
        mainForm.threatClientDataSet.Fields[7].AsBoolean;
      threatEditForm.threatIntCheckBox.Checked :=
        mainForm.threatClientDataSet.Fields[8].AsBoolean;
      threatEditForm.threatAccessCheckBox.Checked :=
        mainForm.threatClientDataSet.Fields[9].AsBoolean;
      mainForm.threatDBNavigator.BtnClick(nbEdit);
      threatEditForm.ShowModal;
    end;
end;

procedure TmainForm.threatDBGridDblClick(Sender: TObject);
begin
  if GetLastNumThreadRecord <> 0 then
    threatInfoForm.ShowModal;
end;

procedure TmainForm.threatInfoClick(Sender: TObject);
begin
  if GetLastNumThreadRecord <> 0 then
    threatInfoForm.ShowModal;
end;

procedure TmainForm.threatEditClick(Sender: TObject);
begin
  threatEditBtn.Click;
end;

procedure TmainForm.threatDeleteClick(Sender: TObject);
begin
  threatDeleteBtn.Click;
end;

procedure TmainForm.threatInsertClick(Sender: TObject);
begin
  threatInsertBtn.Click;
end;

procedure TmainForm.vulDBGridTitleClick(Column: TColumn);
begin
  vulClientDataSet.IndexFieldNames:=Column.FieldName; 
end;

procedure TmainForm.threatFindBtnClick(Sender: TObject);
begin
  if GetLastNumThreadRecord <> 0 then
    threatFindForm.ShowModal;
end;

procedure TmainForm.threatClearFindFiltreClick(Sender: TObject);
begin
  mainForm.threatClientDataSet.Filter := '';
  mainForm.threatStatusBar.Panels.Items[1].Text := '';
end;

procedure TmainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  threatClientdataSet.Active := false;
  vulClientdataSet.Active := false;
end;

procedure TmainForm.threatFindClick(Sender: TObject);
begin
  threatFindBtn.Click;
end;

procedure TmainForm.vulInsertBtnClick(Sender: TObject);
begin
  vulInsertForm.vulIDUpDown.Position:= GetLastNumVulRecord+1;
  vulInsertForm.vulNameEdit.Text := '';
  vulInsertForm.vulIDFSTECEdit.Text := '';
  vulInsertForm.vulOtherIDEdit.Text := '';
  vulInsertForm.vulSoftEdit.Text := '';
  vulInsertForm.vulVerEdit.Text := '';
  vulInsertForm.vulOSEdit.Text := '';
  vulInsertForm.vulCVSSEdit.Text := '';
  vulInsertForm.vulCVSSLevEdit.Text := '0';
  vulInsertForm.vulURLEdit.Text := '';
  vulDBNavigator.BtnClick(nbInsert);
  vulInsertForm.ShowModal;
end;

procedure TmainForm.vulEditBtnClick(Sender: TObject);
begin
  if GetLastNumThreadRecord <> 0 then
    begin
      vulEditForm.vulIDUpDown.Position :=
        vulClientdataSet.Fields[0].AsInteger;
      vulEditForm.vulNameEdit.Text :=
        vulClientdataSet.Fields[1].AsString;
      vulEditForm.vulIDFSTECEdit.Text :=
        vulClientdataSet.Fields[2].AsString;
      vulEditForm.vulDate.DateTime :=
        vulClientdataSet.Fields[3].AsDateTime;
      vulEditForm.vulOtherIDEdit.Text :=
        vulClientdataSet.Fields[4].AsString;
      vulEditForm.vulSoftEdit.Text :=
        vulClientdataSet.Fields[5].AsString;
      vulEditForm.vulVerEdit.Text :=
        vulClientdataSet.Fields[6].AsString;
      vulEditForm.vulClassComboBox.Text :=
        vulClientdataSet.Fields[7].AsString;
      vulEditForm.vulOSEdit.Text :=
        vulClientdataSet.Fields[8].AsString;
      vulEditForm.vulCVSSEdit.Text :=
        vulClientdataSet.Fields[9].AsString;
      vulEditForm.vulCVSSLevEdit.Text :=
        floattostr(vulClientdataSet.Fields[10].AsFloat);
      vulEditForm.vulURLEdit.Text :=
        vulClientdataSet.Fields[11].AsString;
      mainForm.vulDBNavigator.BtnClick(nbEdit);
      vulEditForm.ShowModal;
    end;
end;

procedure TmainForm.vulEditClick(Sender: TObject);
begin
  vulEditBtn.Click;
end;

procedure TmainForm.vulInsertClick(Sender: TObject);
begin
  vulInsertBtn.Click;
end;

procedure TmainForm.vulDeleteBtnClick(Sender: TObject);
begin
  if GetLastNumVulRecord <> 0 then
    vulDeleteForm.ShowModal;
end;

procedure TmainForm.vulDeleteClick(Sender: TObject);
begin
  vulDeleteBtn.Click;
end;

procedure TmainForm.vulDBGridDblClick(Sender: TObject);
begin
  if GetLastNumVulRecord <> 0 then
    vulInfoForm.ShowModal;
end;

procedure TmainForm.vulInfoClick(Sender: TObject);
begin
  if GetLastNumVulRecord <> 0 then
    vulInfoForm.ShowModal;
end;

procedure TmainForm.vulFindBtnClick(Sender: TObject);
begin
  if GetLastNumVulRecord <> 0 then
    vulFindForm.ShowModal;
end;

procedure TmainForm.vulClearFindFilterClick(Sender: TObject);
begin
  mainForm.vulClientDataSet.Filter := '';
  mainForm.vulStatusBar.Panels.Items[1].Text := '';
end;

procedure TmainForm.vulFindClick(Sender: TObject);
begin
  vulFindBtn.Click;
end;

procedure TmainForm.CVSSTabShow(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.AVComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.ACComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.AuComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.CComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.IComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.AComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.EComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.RLComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.RCComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.CDPComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.TDComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.CRComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.IRComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

procedure TmainForm.ARComboChange(Sender: TObject);
begin
  CVSSResultRefresh;
end;

end.
